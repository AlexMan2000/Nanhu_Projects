import * as d3 from "d3"
import {nest} from "d3-collection"
import React from "react"

function ArrowLabels(props){
    const {data,yScale,width,height,colorScale,selectedCountry,setSelectedCountry,selectedCountryBox,clickedCountry,hoveredCountry,continent,mapping_dict} = props;
    let nested_data = nest().key(d=>d.Entity).entries(data);

    let mapping_dict_mod = {};
    mapping_dict.forEach(mapping=>{
        mapping_dict_mod[mapping["Entity"]]=mapping["Continent"]
    })

    nested_data = continent==="World"?nested_data:nested_data.filter(d=>mapping_dict_mod[d.key]===continent);
    //console.log(nested_data)
    if(clickedCountry){
        nested_data = nested_data.filter(item=>item.key===clickedCountry);
    }else{

    //选取在选中的国家范围内
    nested_data = nested_data.filter(item=>{const tmp=new Set(selectedCountryBox);return tmp.has(item.key)});
    }

    colorScale.domain(nested_data.map(d=>d.key));

    const country_group = nested_data.map(d=>d.key)

    const filteredData = nested_data.filter(d=>d.key===selectedCountry);
    const hoveredData = nested_data.filter(d=>d.key===hoveredCountry);
    
    const opacity = selectedCountry||hoveredCountry? 0.2:1;

    const onMouseOver = (country,event)=>{
        setSelectedCountry(country);
    }

    const onMouseOut = (country,event)=>{
        setSelectedCountry(null);


    }

    return (<g className="legendMark">
        {nested_data.map((country,idx)=>{
            return (<g key={country.key} className="legendGroup" onMouseOver={()=>{onMouseOver(country.key)}} 
                onMouseOut={()=>{onMouseOut(country.key)}} opacity={opacity}>
                <rect x={width-30} y={idx*20} height={10} width={10} fill={colorScale(country.key)}></rect>
                <text x={width-15} y={idx*20+10} fill={colorScale(country.key)} name={country.key} >{country.key}</text>
            </g>)
        })}

        {filteredData.map((country,idx)=>{
            return (<g key={country.key} className="legendGroup" opacity={1} onMouseOver={()=>{onMouseOver(country.key)}} 
                onMouseOut={()=>{onMouseOut(country.key)}}>
                <rect x={width-30} y={country_group.indexOf(country.key)*20} height={10} width={10} fill={colorScale(country.key)}></rect>
                <text x={width-15} y={country_group.indexOf(country.key)*20+10} fill={colorScale(country.key)} name={country.key} >{country.key}</text>
            </g>)
        })}

        {hoveredData.map((country,idx)=>{
            return (<g key={country.key} className="legendGroup" opacity={1} onMouseOver={()=>{onMouseOver(country.key)}} 
                onMouseOut={()=>{onMouseOut(country.key)}}>
                <rect x={width-30} y={country_group.indexOf(country.key)*20} height={10} width={10} fill={colorScale(country.key)}></rect>
                <text x={width-15} y={country_group.indexOf(country.key)*20+10} fill={colorScale(country.key)} name={country.key} >{country.key}</text>
            </g>)
        })} 
        </g>)
}

export {ArrowLabels}