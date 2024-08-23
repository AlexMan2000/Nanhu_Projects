import React from "react"

//画图例
function MapLegend(props) {
    const {x, y, dataAll, colorScale, thresholds, 
        selectedCountry, selectedInterval,setSelectedInterval,year} = props;
    const w1 = 55;
    const w2 = 110;
    const h = 10;

    const data = dataAll.filter(d=>d.Year===year);
    
    //设置长度分歧点
    const cutting = thresholds.filter(d=>d<30).length;

    const convert_width = (left)=>{
        if (left === 30|| left ===40){
            return w2
        }
        else if(left<30){
            return w1
        }else if(left===50){
            return 0
        }
    }

    const convert_start = (idx)=>{
        if(thresholds[idx]<30){
            return idx*convert_width(thresholds[idx])
        }else{
            return cutting*w1 + (idx-cutting)*w2
        }
    }

    // 挑出被选中的legend
    const filteredLegend = data.filter(d=>d.Entity===selectedCountry.country);
    const level = filteredLegend.length>0 ? +filteredLegend[0].Productivity_level:-1;


    return <g className="MapLegend" transform = {`translate(${x}, ${y})`} >
        {thresholds.map( (d, idx) => {
            return <g key={idx+"legend"}>
            <rect x={convert_start(idx)+10} y={0}  width={convert_width(thresholds[idx])} height={h} style={{fill:colorScale(thresholds[idx])}}
            stroke={"#333"} strokeWidth={level===idx? "2":selectedInterval.length===0?"0.3":+selectedInterval[0]===thresholds[idx]? "2":"0.3"}  
            onMouseEnter={(d)=>{setSelectedInterval([thresholds[idx],idx+1>=thresholds.length ? 100:thresholds[idx+1]])}}
                onMouseOut={()=>setSelectedInterval([])}/>
            
            <text x={convert_start(idx)-5} y={idx%2 ? -15:-25} fontSize="12" dominantBaseline="hanging" >
                {idx===thresholds.length-1?">"+d.toString():d}$/h
            </text>
            <line x1={convert_start(idx)+10} y1={idx%2 ? -10:-20} x2={convert_start(idx)+10} y2={h} stroke="#333" strokeWidth="0.3"/>
            </g>
        })}

        <g key={"unknow_rect"} onMouseEnter={()=>setSelectedInterval("null")}
                onMouseOut={()=>setSelectedInterval([])}>
            <rect x={-75} y={0} width={w1} height={h} fill={"#eee"} stroke="#333" strokeWidth={selectedCountry.country&&filteredLegend.length===0? "2":selectedInterval==="null"? "2":"0.3"}/>
            <text x={-75} y={-15} fontSize="12" dominantBaseline="hanging">No data</text>
        </g>

    </g>
}


export {MapLegend}