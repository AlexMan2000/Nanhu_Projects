import * as d3 from "d3"
import React from "react"


 // 定义条形图的坐标轴(待修改)
 function DualAxes(props) {
    const {xScale,yScale,width,height,hoveredYear,year}=props;
    const xticks = xScale.ticks(5);

    const yticks = yScale.ticks(5);

    return (<g>
        <g className="HorizontalAxis">
            {xticks.map(tickValue=>{
            //x轴的文本
            return (<text key={tickValue.toString()+"horizontalText"} x={xScale(tickValue)}
                    className="ticks" y={height+20} dominantBaseline={"middle"} textAnchor={"middle"}>{tickValue}$/h
                    </text>)
                    })}
        </g>

        <g className="AxisGridLines">
        {xticks.map(tickValue=>{
            //x轴的水平刻度线
            return (<line key={tickValue.toString()+"AxisGrid"} x1={xScale(tickValue)}
            y1={height} x2={xScale(tickValue)} y2={height+5} stroke="#ccc" strokeDasharray="3,2"/>
               )
        })}
         </g>
    
        <g className="VerticalAxis">
            {yticks.map(tickValue=>{
            //y轴的文本
            return (<text key={tickValue.toString()+"VerticalText"} x={-5} y={yScale(tickValue)}
            className="ticks" dominantBaseline={"middle"} textAnchor={"end"}>{tickValue}
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