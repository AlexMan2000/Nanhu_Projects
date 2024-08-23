import * as d3 from "d3"
import React from "react"


 // 定义条形图的坐标轴(待修改)
 function DualAxes(props) {
    const {xScale,yScale,width,height,timeFormat,hoveredYear,year}=props;
    const xticksForText = xScale.ticks(5);
    let xticks = xScale.ticks(d3.timeYear.every(1));
    xticks.unshift(new Date(year[0].toString()))
    const yticks = yScale.ticks(5);

    return (<g>
        <g className="HorizontalAxis">
            
            {xticks.map(tickValue=>{
                //x轴的刻度线
                return (<line key={Math.random().toString()+timeFormat(tickValue)+"horizontalLines"}
                x1={xScale(tickValue)} y1={height} x2={xScale(tickValue)} y2={height+5}
                stroke="#ccc"/>)
            })}


            <text key={Math.random().toString()+timeFormat(xticks[0])+"startHorizontalText"}
                    x={xScale(xticks[0])} y={height+20} className="ticks" textAnchor={"middle"}
                    >
                {timeFormat(xticks[0])}
                </text>
            

            {xticksForText.map(tickValue=>{
                //x轴的文本
                if (+timeFormat(xticks[xticks.length-1])-(+timeFormat(tickValue))>=2&&
                    +timeFormat(tickValue)-(+timeFormat(xticks[0]))>=2){

                return (<text key={Math.random().toString()+timeFormat(tickValue)+"horizontalText"}
                        x={xScale(tickValue)} y={height+20} className="ticks" textAnchor="middle">
                        {timeFormat(tickValue)}
                    </text>)}
                    
                    
                else{
                        return (<text key={Math.random().toString()+"null"}></text>)
                    }
            })}

            <text key={timeFormat(xticks[xticks.length-1])+"endHorizontalText"}
                    x={xScale(xticks[xticks.length-1])} y={height+20} className="ticks" textAnchor={"middle"}
                    >
                {timeFormat(xticks[xticks.length-1])}
                
                </text>
        </g>
    
        <g className="VerticalAxis">
            {yticks.map(tickValue=>{
            //y轴的文本
            return (<text key={tickValue.toString()+"VerticalText"} x={-5} y={yScale(tickValue)}
            className="ticks" dominantBaseline={"middle"} textAnchor={"end"}>{tickValue}$/h
            </text>)
            })}
        </g>

        <g className="AxisGridLines">
        {yticks.map(tickValue=>{
            //y轴的水平刻度线
            return (<line key={tickValue.toString()+"AxisGrid"} x1={0} y1={yScale(tickValue)}
            x2={width} y2={yScale(tickValue)} stroke="#ccc" strokeDasharray="3,2"/>
               )
        })}
         </g>
        </g>)
}


export {DualAxes}