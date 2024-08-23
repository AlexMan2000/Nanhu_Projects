import React from "react"
import * as d3 from "d3"
import {TheMap} from "./TheMap"
import {MapLegend} from "./MapLegend"


// 画图例+地图
function WorldMap(props) {
    const {x,y,height,width,dataAll,mapAll,position,setPosition,
     selectedCountry,setSelectedCountry,selectedInterval,setSelectedInterval,year,
     continent,mapping_dict,setView,setClickedCountry,setNav} = props;

     //创建legend上的分割点
     const bins = [0,5,10,15,20,25,30,40,50];
     

     const colorScale = d3.scaleThreshold(bins,d3.schemeYlGnBu[9])
 

     return <svg width={width} height={height}>
         <TheMap mapAll={mapAll} width={width} height={height} dataAll={dataAll} color={colorScale}
          selectedCountry={selectedCountry} setSelectedCountry={setSelectedCountry}
          selectedInterval = {selectedInterval} setSelectedInterval = {setSelectedInterval}
          position={position} setPosition={setPosition} year={year} continent={continent} mapping_dict={mapping_dict}
          setView={setView} setClickedCountry={setClickedCountry} setNav={setNav}
          />
         <MapLegend x={140} y={height-55} dataAll={dataAll} colorScale={colorScale} thresholds = {bins} selectedCountry={selectedCountry}
         selectedInterval = {selectedInterval} setSelectedInterval = {setSelectedInterval} year={year}/>
         </svg>
         
 }

 export {WorldMap}