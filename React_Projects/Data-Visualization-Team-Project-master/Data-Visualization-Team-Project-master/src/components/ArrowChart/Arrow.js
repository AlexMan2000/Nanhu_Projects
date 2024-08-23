import * as d3 from "d3"
import {nest} from "d3-collection"
import React from "react"


function Arrow(props){
    const {x,y,data,xScale,yScale,colorScale,hoveredYear,selectedCountry,hoveredCountry,
        setHoveredCountry,selectedCountryBox,clickedCountry,continent,mapping_dict} = props;

    let mapping_dict_mod = {};
    mapping_dict.forEach(mapping=>{
        mapping_dict_mod[mapping["Entity"]]=mapping["Continent"]
    })

    const setHovered=(event,country_name)=>{
        console.log(country_name);
        setHoveredCountry(country_name)
    }

    const setHoveredOut=(event,country_name)=>{
        setHoveredCountry(null)
    }
    
    const data_time = d3.extent(data,d=>d.Year);
    const time_span = data_time[1]-data_time[0];
    let nested_data = nest().key(d=>d.Entity).entries(data);

    if(clickedCountry){
        nested_data = nested_data.filter(item=>item.key===clickedCountry);
    }else{

    //选取在选中的国家范围内
    nested_data = nested_data.filter(item=>{const tmp=new Set(selectedCountryBox);return tmp.has(item.key)});
    }
    //console.log(nested_data)
    const nested_data_filtered_by_continent = continent==="World"?nested_data:nested_data.filter(data=>mapping_dict_mod[data.key]===continent);
    //console.log(nested_data_filtered_by_continent);
    colorScale.domain(nested_data_filtered_by_continent.map(d=>d.key));
    const opacity = selectedCountry||hoveredCountry? 0.2:1;
    const filteredData = nested_data_filtered_by_continent.filter(d=>d.key===selectedCountry);
    const hoveredData = nested_data_filtered_by_continent.filter(d=>d.key===hoveredCountry);
    
    return (<g className="Arrow">
        
        
        <path x={xScale(hoveredYear)} className="vertical-line" stroke="#ccc" strokeWidth="1px" opcaity={0}/>
        
        {nested_data_filtered_by_continent.map(country=>{
            return (<g key={country.key} opacity={opacity}>

        <g className="city-circles" fill={colorScale(country.key)}>
                {country.values.map(d=>{
                    return (<circle key={d.Year} cx={xScale(d.Productivity)} cy={yScale(d.Avh_worked)} r={time_span<=40?2:0}  
                    onMouseEnter={(event)=>{setHovered(event,d.Entity)}} onMouseOut={(event)=>{setHoveredOut(event,d.Entity)}} 
                />)
                })}  
                {country.values.slice(country.values.length-2,country.values.length-1).map(d=>{return (<text key={"Arrow"} 
                x={xScale(d.Productivity)+10} y={yScale(d.Avh_worked)-5} opacity={opacity} style={{fontSize:"12px"}}  
                onMouseEnter={(event)=>{setHovered(event,d.Entity)}} 
                onMouseOut={(event)=>{setHoveredOut(event,d.Entity)}}>
                    {d.Entity}
                </text>)})}
                <path key={country.key} className={"city-lines"} fill="none" stroke={colorScale(country.key)} 
                d={d3.line().x(d=>xScale(d.Productivity)).y(d=>yScale(d.Avh_worked)).curve(d3.curveLinear)(country.values)} 
                onMouseEnter={(event)=>{setHovered(event,country.Entity);}} onMouseOut={(event)=>{setHoveredOut(event,country.Entity)}} />
                
                
    
                </g> 
            </g>
            )})}
        

        //处理图例的筛选
        {filteredData.map(country=>{
            return (<g key={country.key} opacity={1}>
                <path className={"city-lines"} fill="none" stroke={colorScale(country.key)} 
                d={d3.line().x(d=>xScale(d.Productivity)).y(d=>yScale(d.Avh_worked)).curve(d3.curveLinear)(country.values)} onMouseEnter={(event)=>{setHovered(event,country.Entity)}} 
                onMouseOut={(event)=>{setHoveredOut(event,country.Entity)}} />
                
                <g className="city-circles" fill={colorScale(country.key)}>
                {country.values.map(d=>{
                    return (<circle key={d.Year} cx={xScale(d.Productivity)} cy={yScale(d.Avh_worked)} r={time_span<=40?2:0} 
                />)
                })}  
                {country.values.slice(country.values.length-2,country.values.length-1).map(d=>{return (<text x={xScale(d.Productivity)+10} y={yScale(d.Avh_worked)-5}
                 opacity={1} style={{fontSize:"12px"}}>
                    {d.Entity}
                </text>)})} 
                </g> 
            </g>
            )})}

        //处理hover的筛选
        {
            hoveredData.map(country=>{
                return (<g key={country.key} opacity={1}>
                    <path className={"city-lines"} fill="none" stroke={colorScale(country.key)} 
                    d={d3.line().x(d=>xScale(d.Productivity)).y(d=>yScale(d.Avh_worked)).curve(d3.curveLinear)(country.values)} 
                    onMouseEnter={(event)=>{setHovered(event,country.Entity)}} onMouseOut={(event)=>{setHoveredOut(event,country.Entity)}} 
                    />
                    
                    <g className="city-circles" fill={colorScale(country.key)}>
                    {country.values.map(d=>{
                        return (<circle key={d.Year} cx={xScale(d.Productivity)} cy={yScale(d.Avh_worked)} r={time_span<=40?2:0} 
                        onMouseEnter={(event)=>{setHovered(event,country.Entity)}} onMouseOut={(event)=>{setHoveredOut(event,country.Entity)}} 
                    
                    />)
                    })}  
                    {country.values.slice(country.values.length-2,country.values.length-1).map(d=>{return (<text key={"textlabel"}x={xScale(d.Productivity)+10} y={yScale(d.Avh_worked)-5} opacity={1} 
                    style={{fontSize:"12px"}} onMouseEnter={(event)=>{setHovered(event,d.Entity)}} onMouseOut={(event)=>{setHoveredOut(event,d.Entity)}} 
                    >
                        {d.Entity}
                    </text>)})} 
                    </g> 
                </g>
                )})
        }
            

          
        </g>)
}

export {Arrow}