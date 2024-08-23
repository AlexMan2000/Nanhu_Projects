import * as d3 from "d3"
import React from "react"


function judgeLineOverLoad(position,xScale,timeFormat,year){
    let timestamp_list = xScale.ticks(d3.timeYear.every(1));
    timestamp_list.unshift(new Date(year[0].toString()))
    const mapped_timestamp_list = timestamp_list.map(d=>xScale(d))
    const index = d3.bisect(mapped_timestamp_list,position.x);
    const left = mapped_timestamp_list[index-1];
    const right = mapped_timestamp_list[index];
    const lineYear = position.x>(left+right)/2+10? timeFormat(timestamp_list[index]):timeFormat(timestamp_list[index-1]);
    const lineX = position.x>(left+right)/2+10? right:left;
    return {lineYear:lineYear,lineX:lineX}
}


function HoverIndicator(props){
    const {height,data,xScale,yScale,hoveredYear,colorScale,selectedCountryBox,clickedCountry} = props;

    let filteredData = hoveredYear?
    clickedCountry?
    data.filter(d=>d.Entity===clickedCountry).filter(d=>d.Year===+hoveredYear.lineYear).filter(d=>{const tmp=new Set(selectedCountryBox);return tmp.has(d.Entity)})
    :data.filter(d=>d.Year===+hoveredYear.lineYear).filter(d=>{const tmp=new Set(selectedCountryBox);return tmp.has(d.Entity)}):null;
    

    if(filteredData){
    return (<g className="hoverIndicator">
        <line x1={hoveredYear.lineX} y1={-30} x2={hoveredYear.lineX} y2={height-30} stroke={"rgba(180,180,180,4)"}/>
            {filteredData.map(d=>{
                return (
                <circle key={d.Entity+"HoverSelect"} cx={xScale(d.timestamp)} cy={yScale(d.Productivity)} r={5}
                fill={colorScale(d.Entity)}/>
                )
            })}
        </g>)}else{
            return (<g></g>)
        } 
}


function ToolTipLine(props){
    const{year,data,x,y,hoveredYear,colorScale,selectedCountryBox,clickedCountry} = props;
    let filteredData = hoveredYear?
    clickedCountry?
    data.filter(d=>d.Entity===clickedCountry).filter(d=>d.Year===+hoveredYear.lineYear).filter(d=>{const tmp=new Set(selectedCountryBox);return tmp.has(d.Entity)})
    :data.filter(d=>d.Year===+hoveredYear.lineYear).filter(d=>{const tmp=new Set(selectedCountryBox);return tmp.has(d.Entity)}):null;
    
    const yearEnd = year?year[1]:null;
    
    if(filteredData){
        filteredData.sort((a,b)=>{
        return b.Productivity-a.Productivity;
    }
    )}

    if(filteredData){
    return(
        <div style={{left:yearEnd-hoveredYear.lineYear>=3?hoveredYear.lineX+x+15:hoveredYear.lineX-150,top:y+40}} className="ToolTipLine">
        <table>
            <tbody>
                <tr>
                    <td colSpan="3">
                        <strong>{hoveredYear.lineYear}</strong>
                        </td>
                </tr>
                {filteredData.map(country=>{

                    return (<tr key={country.Entity} style={{color:"rgb(51,51,51)"}}>
                            <td>
                                <div style={{"width": "10px","height": "10px", 
                                        "borderRadius": "5px"
                                        ,"backgroundColor": colorScale(country.Entity),
                                         "display": "inline-block", "marginRight": "2px"}}></div>
                                </td>
                                <td style={{paddingRight:"0.8em",fontSize:"0.9em"}}>{country.Entity}</td>
                                <td style={{textAlign:"right",whiteSpace:"nowrap"}}>{country.Productivity.toFixed(2).toString()+" $/h"}</td>
                        </tr>)
                })}
            </tbody>
            
        </table>

        </div>)}else{
            return(<div></div>)
        }
}


export {judgeLineOverLoad,HoverIndicator,ToolTipLine}