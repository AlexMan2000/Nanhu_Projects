import * as d3 from "d3"
import {nest} from "d3-collection"
import React from "react"
import {judgeLineOverLoad} from "./ToolTipLine"

function Lines(props){
    const {x,y,data,xScale,yScale,width,height,colorScale,hoveredYear,selectedCountry,
        setHoveredYear,timeFormat,year,selectedCountryBox,clickedCountry} = props;

    const data_time = d3.extent(data,d=>d.Year);
    const time_span = data_time[1]-data_time[0];
    let nested_data = nest().key(d=>d.Entity).entries(data);

    if(clickedCountry){
        nested_data = nested_data.filter(item=>item.key===clickedCountry);
    }else{

    //选取在选中的国家范围内
    nested_data = nested_data.filter(item=>{const tmp=new Set(selectedCountryBox);return tmp.has(item.key)});
    }

    colorScale.domain(nested_data.map(d=>d.key));
    const opacity = selectedCountry? 0.2:1;
    const filteredData = nested_data.filter(d=>d.key===selectedCountry);
    

    //定义rect的事件接收
    const onMouseOver =(event,xScale,timeFormat)=>{
        const mouseX = event.nativeEvent.pageX-x;
        const mouseY = event.nativeEvent.pageY-y;
        const position={x:mouseX,y:mouseY}
        const {lineYear,lineX} = judgeLineOverLoad(position,xScale,timeFormat,year)
        setHoveredYear({lineYear:lineYear,lineX:lineX});
    }

    const onMouseOut = ()=>{
        setHoveredYear(null);
    }

    const onMouseMove =(event)=>{
        const mouseX = event.nativeEvent.pageX-x;
        const mouseY = event.nativeEvent.pageY-y;
        const position={x:mouseX,y:mouseY}
        const {lineYear,lineX} = judgeLineOverLoad(position,xScale,timeFormat,year)
        setHoveredYear({lineYear:lineYear,lineX:lineX});
    }


    return (<g className="Lines">
        
        
        <path x={xScale(hoveredYear)} className="vertical-line" stroke="#ccc" strokeWidth="1px" opcaity={0}/>
        
        {nested_data.map(country=>{
            return (<g key={country.key} opacity={opacity}>
                <path className={"city-lines"} fill="none" stroke={colorScale(country.key)} 
                d={d3.line().x(d=>xScale(d.timestamp)).y(d=>yScale(d.Productivity)).curve(d3.curveLinear)(country.values)}/>
                
                <g className="city-circles" fill={colorScale(country.key)}>
                {country.values.map(d=>{
                    return (<circle key={d.Year} cx={xScale(d.timestamp)} cy={yScale(d.Productivity)} r={time_span<=40?2:0} 
                />)
                })}   
                </g> 
            </g>
            )})}
        

        //处理图例的筛选
        {filteredData.map(country=>{
            return (<g key={country.key} opacity={1}>
                <path className={"city-lines"} fill="none" stroke={colorScale(country.key)} 
                d={d3.line().x(d=>xScale(d.timestamp)).y(d=>yScale(d.Productivity)).curve(d3.curveLinear)(country.values)}/>
                
                <g className="city-circles" fill={colorScale(country.key)}>
                {country.values.map(d=>{
                    return (<circle key={d.Year} cx={xScale(d.timestamp)} cy={yScale(d.Productivity)} r={time_span<=40?2:0} 
                />)
                })}   
                </g> 
            </g>
            )})}
            

            //用于捕捉MouseEvent
            <rect className={"capturing"} width={width-50} height={height} fill="rgba(255,255,255,0)" opacity="0"
        onMouseOver={(event)=>{onMouseOver(event,xScale,timeFormat)}} onMouseOut={onMouseOut} onMouseMove={(event)=>{onMouseMove(event,xScale,timeFormat)}}></rect>
            
        </g>)
}

export {Lines}