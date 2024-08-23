import React from 'react';
import  {MAPWIDTH,MAPHEIGHT,marginMap,innerWidthMap,innerHeightMap} from "../../static_files/constants"
import {WorldMap} from "./WorldMap"
import {ToolTipMap} from "./ToolTipMap"
import {DoubleSlider} from "./DoubleSliderMap"
import {SelectBox} from "./SelectBox"
import {PlayButton} from "./PlayButton"

import './WorldMap.css';

function WorldProductivityMap (props){
  const {dataAll,mapAll,mapping_dict,setView,setClickedCountry,setNav} =props;
  const [position,setPosition] = React.useState(null);
  const [selectedCountry,setSelectedCountry] = React.useState({country:null,value:null});
  const [selectedInterval,setSelectedInterval] = React.useState([]);
  const [year,setYear] = React.useState(1990);
  const [value,setValue] = React.useState(1990);
  const [continent,setContinent] = React.useState("World");
  

  return <div className="Overall"> 
    <h1 style={{"fontSize": "22.4px", "lineHeight": 1, "overflow-y": "visible"}}>Productivity per hour worked in {year}</h1>
    <h4 className="notes" style={{"fontSize": "10px","lineHeight":1,"overflow-y":"visible"}}>Labor productivity per hour is measured as gross domestic product (GDP) per hour of work.</h4>
      <div className="MainChart">
          <svg width={MAPWIDTH} height={MAPHEIGHT}>
              <g>
                  <WorldMap x={marginMap.left} y={marginMap.top} height={innerHeightMap} 
                  width={innerWidthMap/2} dataAll={dataAll} mapAll={mapAll} position={position} 
                  setPosition={setPosition} selectedCountry={selectedCountry} setSelectedCountry={setSelectedCountry}
                  selectedInterval={selectedInterval} setSelectedInterval={setSelectedInterval} year={year}
                  continent={continent} mapping_dict={mapping_dict} setView={setView} setClickedCountry={setClickedCountry}
                  setNav={setNav}
                  />
              </g>              
          </svg>        
      </div>
      <ToolTipMap dataAll={dataAll} mapAll={mapAll} position={position} setPosition={setPosition} 
      selectedCountry={selectedCountry} setSelectedCountry={setSelectedCountry} year={year} continent={continent}/>
      <DoubleSlider year={year} setYear={setYear} value={value} setValue={setValue}/>
      <SelectBox continent={continent} setContinent={setContinent}/>
      <PlayButton year={year} setYear={setYear} value={value} setValue={setValue}/>
  </div>
}

export {WorldProductivityMap}