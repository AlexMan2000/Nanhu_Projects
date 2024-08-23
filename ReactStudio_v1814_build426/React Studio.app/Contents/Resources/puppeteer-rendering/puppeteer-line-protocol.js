/*
Copyright 2019- Neonto Ltd.
All rights reserved.
*/

const puppeteer = require('puppeteer');
const split_ = require('split');


let g_outputScreenshotPath = 'output.png';


async function main() {
  const t0 = Date.now();

  const browser = await puppeteer.launch();
  const t1 = Date.now();

  const page = await browser.newPage();
  const t2 = Date.now();

  startLineProtocol(page);
}
main();


async function grab(page) {
  const t0 = Date.now();
  await page.screenshot({path: g_outputScreenshotPath, omitBackground: true});
  console.error("screenshot: %d ms", Date.now()-t0);
}


function startLineProtocol(page) {
  console.log("awaiting commands from stdin");
  process.stdin
  .pipe(split_())
  .on('data', async (line) => {
    console.error("--- puppeteer protocol has cmd: %s\n", line);
    // cmd: go to page
    if (line.indexOf('#http') === 0) {
      const url = line.substr(1);
      const t0 = Date.now();

      try {
        await page.goto(url);
        console.error("loaded %s in %d ms", url, Date.now()-t0);
        await grab(page);
      } catch (e) {
        console.error("** error loading url '%s': ", url, e);
      }
    }
    // cmd: set browser properties
    else if (line.indexOf('!') === 0) {
      const json = line.substr(1);
      try {
        const obj = JSON.parse(json);
        let didSet = false;
        if (obj.viewport) {
          console.error("setting viewport: ", obj.viewport);
          page.setViewport(obj.viewport);
          didSet = true;
        }

        if ( !didSet) {
          console.error("no valid properties found in: ", obj);
        }
      } catch (e) {
        console.error("** failed to parse properties: ", e);
      }
    }
    // cmd: set output path
    else if (line.indexOf('>') === 0) {
      g_outputScreenshotPath = line.substr(1);
      console.error("output path set to: ", g_outputScreenshotPath);
    }
    else {
      console.error("unrecognized cmd: ", line);
    }
  })
}
