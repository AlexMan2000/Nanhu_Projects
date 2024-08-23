import * as d3 from "d3"
import React from "react"


function ToolTipArrow(props){
    const{year,data,x,y,hoveredCountry} = props;
    
    const filteredData = data.filter(d=>d.Entity===hoveredCountry);

    if(filteredData.length!==0){
    return(
        <div className="ToolTipArrow">
        <text key={"tip"} className="arrowTip">
            {filteredData[0].Year}:<br/>
            X Axis: {filteredData[0].Productivity.toFixed(2)}$/h<br/>           
            Y Axis: {filteredData[0].Avh_worked.toFixed(2)}hours<br/>
            {filteredData[filteredData.length-1].Year}:<br/>
            X Axis: {filteredData[filteredData.length-1].Productivity.toFixed(2)}$/h<br/>
            Y Axis: {filteredData[filteredData.length-1].Avh_worked.toFixed(2)}hours<br/>

        </text>

        </div>)}else{
            return(<div></div>)
        }
}


export {ToolTipArrow}