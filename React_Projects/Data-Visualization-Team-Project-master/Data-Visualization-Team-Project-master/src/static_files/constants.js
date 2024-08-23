const MAPWIDTH = 1600;
const MAPHEIGHT = 600;
const marginMap = { top: 20, right: 40, bottom: 20, left: 40 };
const innerWidthMap = MAPWIDTH - marginMap.left -marginMap.right;
const innerHeightMap = MAPHEIGHT - marginMap.top - marginMap.bottom;

const LINEWIDTH = 1300;
const LINEHEIGHT = 900;
const marginLine = { top: 140, right: 0, bottom: 0, left: 140 };
const innerWidthLine = LINEWIDTH - marginLine.left -marginLine.right;
const innerHeightLine = LINEHEIGHT - marginLine.top - marginLine.bottom;



const csvUrl = "https://raw.githubusercontent.com/leonardoding959/IV/main/second_graph.csv";
const mapUrl = "https://unpkg.com/world-atlas@2.0.2/countries-110m.json";
const mappingUrl = "https://raw.githubusercontent.com/AlexMan2000/Information-Visualization/main/continents-to-countries.csv"
const defaultCountries=["Australia"
,"Belgium"
,"Brazil"
,"Cambodia"
,"Chile"
,"China"
,"Germany",
,"India"
,"South Africa"
,"South Korea"
,"Swizerland"
,"Taiwan"
,"United Kingdom"
,"United States of America"]
export {MAPWIDTH,MAPHEIGHT,LINEWIDTH,LINEHEIGHT,marginMap,marginLine,innerWidthMap,innerHeightMap,innerWidthLine,innerHeightLine,csvUrl,mapUrl,mappingUrl,defaultCountries}