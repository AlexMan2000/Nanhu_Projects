import React from "react"
import * as d3 from "d3"
import {DualAxes} from "./DualAxes"
import {Lines} from "./Lines"
import {LineLabels} from "./LineLabels"
import {HoverIndicator} from "./ToolTipLine"

function LineChart(props){
    const {x,y,height,width,data,hoveredYear,setHoveredYear,colorScale,selectedCountryBox,year,clickedCountry} = props;
    const [selectedCountry,setSelectedCountry] = React.useState(null);

    const plotWidth = width-50 ;
    const plotHeight = height - 50;

    //定义xScale和yScale
    
    const xScale = d3.scaleTime()
                         .domain(d3.extent(data,d=>d.timestamp))
                         .range([0,plotWidth]);
    

    const timeFormat = d3.timeFormat("%Y");

    const yScale = d3.scaleLinear()
                        .domain([0,d3.max(data,d=>d.Productivity)])
                        .range([plotHeight,0]).nice()


    return <g width={width} height={height} transform={`translate(${x},${y+30})`}>
        <DualAxes data={data} xScale={xScale} yScale={yScale} width={plotWidth} height={plotHeight}
         timeFormat = {timeFormat} hoveredYear={hoveredYear} year={year}/>
        <Lines x={x} y={y} data={data} xScale={xScale} yScale={yScale} width={width} height={height} colorScale={colorScale}
        selectedCountry={selectedCountry} selectedCountryBox={selectedCountryBox} hoveredYear={hoveredYear} setHoveredYear={setHoveredYear}
        timeFormat={timeFormat} year={year} clickedCountry={clickedCountry}/>
        <LineLabels data={data} yScale={yScale} width={width} height={height} colorScale={colorScale}
        selectedCountry={selectedCountry} setSelectedCountry={setSelectedCountry} selectedCountryBox={selectedCountryBox}
            clickedCountry={clickedCountry}
        />
        <HoverIndicator height={height} data={data} xScale={xScale} yScale={yScale} 
         hoveredYear={hoveredYear} setHoveredYear={setHoveredYear}
         timeFormat={timeFormat} colorScale={colorScale} selectedCountryBox={selectedCountryBox} clickedCountry={clickedCountry}/>
        </g>

}


export {LineChart}