import React from 'react';
import  {LINEWIDTH,LINEHEIGHT,marginLine,innerWidthLine,innerHeightLine,defaultCountries} from "../../static_files/constants"
import {ArrowChart} from "./ArrowChart"
import {DoubleSlider} from "./DoubleSliderLine"
import {SelectingFilter} from "./SelectingFilter"
import {PlayButton} from "./PlayButton"
import {SelectBox} from "./SelectBox"
import {ToolTipArrow} from "./ToolTipArrow"
import * as d3 from "d3"
import './ArrowChart.css';


function ArrowChartLine (props){
    const {dataAll,clickedCountry,mapping_dict} = props;
    const [hoveredYear,setHoveredYear] = React.useState(null);
    const [year,setYear] = React.useState([1980,2000]);
    const [selectedCountryBox,setSelectedCountryBox]=React.useState(defaultCountries)
    const [hoveredCountry,setHoveredCountry]=React.useState(null);
    const [value,setValue] = React.useState([1980,2000]);
    const [continent,setContinent] = React.useState("World");
    const data = dataAll.filter(d=>d.Year>=year[0]&&d.Year<=year[1])
    const colorScale = d3.scaleOrdinal(d3.schemeCategory10);

    return <div className="Overall">
        <h1 style={{"fontSize": "22.4px", "lineHeight": 1, "overflow-y": "visible"}}>Annual Working Hours vs. Labor Productivity from {year[0]} to {year[1]}</h1>
        <h4 className="notes" style={{"fontSize": "10px","lineHeight":1,"overflow-y":"visible"}}>Working hours are the annual average per worker. Labor productivity per hour is measured as GDP per hour of work.</h4>
        <div className="MainChart">
            <svg width={LINEWIDTH} height={LINEHEIGHT}>
                <g className={"ArrowChart"}>
                    <ArrowChart x={marginLine.left} y={marginLine.top} height={innerHeightLine/2} 
                    width={innerWidthLine/2} data={data} hoveredYear={hoveredYear} setHoveredYear = {setHoveredYear}
                    colorScale={colorScale} selectedCountryBox={selectedCountryBox} year={year} 
                    clickedCountry={clickedCountry} continent={continent} mapping_dict={mapping_dict}
                    hoveredCountry={hoveredCountry} setHoveredCountry={setHoveredCountry}/>
                </g>              
            </svg> 
        </div>
        <DoubleSlider year={year} setYear={setYear} value={value} setValue={setValue}/>
        <SelectingFilter data={data} selectedCountryBox={selectedCountryBox} setSelectedCountryBox={setSelectedCountryBox}/>
        <SelectBox continent={continent} setContinent={setContinent}/>
        <PlayButton setYear={setYear} setValue={setValue}/>
        <ToolTipArrow hoveredCountry={hoveredCountry} data={data}/>
    </div>
    
}

export {ArrowChartLine};