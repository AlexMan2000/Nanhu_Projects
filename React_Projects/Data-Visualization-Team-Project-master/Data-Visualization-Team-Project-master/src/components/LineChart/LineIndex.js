import React from 'react';
import  {LINEWIDTH,LINEHEIGHT,marginLine,innerWidthLine,innerHeightLine,defaultCountries} from "../../static_files/constants"
import {LineChart} from "./LineChart"
import {DoubleSlider} from "./DoubleSliderLine"
import {SelectingFilter} from "./SelectingFilter"
import {ToolTipLine} from "./ToolTipLine"
import {PlayButton} from "./PlayButton"
import * as d3 from "d3"
import './LineChart.css';


function WorldProductivityLine (props){
    const {dataAll,clickedCountry} = props;
    const [hoveredYear,setHoveredYear] = React.useState(null);
    const [year,setYear] = React.useState([1980,2000]);
    const [selectedCountryBox,setSelectedCountryBox]=React.useState(defaultCountries)
    const [value,setValue] = React.useState([1980,2000]);

    const data = dataAll.filter(d=>d.Year>=year[0]&&d.Year<=year[1])
    const colorScale = d3.scaleOrdinal(d3.schemeCategory10);

    return <div className="Overall">
        <h1 style={{"fontSize": "22.4px", "lineHeight": 1, "overflow-y": "visible"}}>Productivity per hour worked from {year[0]} to {year[1]}</h1>
        <h4 className="notes" style={{"fontSize": "10px","lineHeight":1,"overflow-y":"visible"}}>Labor productivity per hour is measured as gross domestic product (GDP) per hour of work.</h4>
        <div className="MainChart">
            <svg width={LINEWIDTH} height={LINEHEIGHT}>
                <g className={"LineChart"}>
                    <LineChart x={marginLine.left} y={marginLine.top} height={innerHeightLine/2} 
                    width={innerWidthLine/2} data={data} hoveredYear={hoveredYear} setHoveredYear = {setHoveredYear}
                    colorScale={colorScale} selectedCountryBox={selectedCountryBox} year={year} clickedCountry={clickedCountry}/>
                </g>              
            </svg> 
        </div>
        <ToolTipLine year={year} data={data} x={marginLine.left} y={marginLine.top} 
         hoveredYear={hoveredYear} colorScale={colorScale} selectedCountryBox={selectedCountryBox}
         clickedCountry={clickedCountry}/>
        <DoubleSlider year={year} setYear={setYear} value={value} setValue={setValue}/>
        <SelectingFilter data={data} selectedCountryBox={selectedCountryBox} setSelectedCountryBox={setSelectedCountryBox}
           />
        <PlayButton setYear={setYear} setValue={setValue}/>
    </div>
    
}

export {WorldProductivityLine};