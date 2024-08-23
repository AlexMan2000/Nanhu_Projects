import React from "react"
import * as d3 from "d3"
import {DualAxes} from "./DualAxes"
import {Arrow} from "./Arrow"
import {ArrowLabels} from "./ArrowLabels"


function ArrowChart(props){
    const {x,y,height,width,data,hoveredYear,setHoveredYear,colorScale,selectedCountryBox,year,clickedCountry,continent,mapping_dict,hoveredCountry,setHoveredCountry} = props;
    const [selectedCountry,setSelectedCountry] = React.useState(null);

    const plotWidth = width - 50 ;
    const plotHeight = height - 50;

    //定义xScale和yScale
    
    const xScale = d3.scaleLinear()
                         .domain([0,d3.max(data,d=>d.Productivity)])
                         .range([0,plotWidth]).nice()

    const timeFormat = d3.timeFormat("%Y");

    const yScale = d3.scaleLinear()
                        .domain([1000,d3.max(data,d=>d.Avh_worked)])
                        .range([plotHeight,0]).nice()


    return <g width={width} height={height} transform={`translate(${x},${y+30})`}>
        <DualAxes data={data} xScale={xScale} yScale={yScale} width={plotWidth} height={plotHeight}
         timeFormat = {timeFormat} hoveredYear={hoveredYear} year={year}/>
        <Arrow x={x} y={y} data={data} xScale={xScale} yScale={yScale} width={width} height={height} colorScale={colorScale}
        selectedCountry={selectedCountry} selectedCountryBox={selectedCountryBox} hoveredYear={hoveredYear} setHoveredYear={setHoveredYear}
        timeFormat={timeFormat} year={year} clickedCountry={clickedCountry} continent={continent} mapping_dict={mapping_dict} hoveredCountry={hoveredCountry} setHoveredCountry={setHoveredCountry}/>
        <ArrowLabels data={data} yScale={yScale} width={width} height={height} colorScale={colorScale}
        selectedCountry={selectedCountry} setSelectedCountry={setSelectedCountry} selectedCountryBox={selectedCountryBox}
            clickedCountry={clickedCountry} hoveredCountry={hoveredCountry} continent={continent} mapping_dict={mapping_dict}
        />
        
        </g>

}


export {ArrowChart}