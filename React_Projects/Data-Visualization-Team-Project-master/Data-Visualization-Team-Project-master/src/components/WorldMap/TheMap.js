import React from "react"
import * as d3 from "d3"

// 画可交互式地图
function TheMap(props) {
    const { mapAll, width, height, dataAll, color,selectedCountry,setSelectedCountry,
        selectedInterval,setPosition,year,continent,mapping_dict,setView,setClickedCountry,setNav} = props;

    let mapping_dict_mod = {};
    mapping_dict.forEach(mapping=>{
        mapping_dict_mod[mapping["Entity"]]=mapping["Continent"]
    })

    const mapFeatures = continent==="World"? mapAll.features:mapAll.features.filter(feature=>mapping_dict_mod[feature.properties.name]===continent);
    const mapFeaturesUnfiltered = continent==="World"?[]:mapAll.features.filter(feature=>mapping_dict_mod[feature.properties.name]!==continent);

    const map = mapAll;
    
    //筛选出当年的数据
    const data = dataAll.filter(d=>d.Year===year);
   
    //所有国家的地图
    const allCountry = map.features.map(d=>d.properties.name);

    //所有有数据的国家的数据
    const dataCountry = data.map(d=>d.Entity)

    //寻找当年没有数据的国家
    const tmp = new Set(dataCountry);
    const nullCountry = new Set(allCountry.filter(d=>!tmp.has(d)));

    //定义映射规则
    const projection = d3.geoEqualEarth().fitSize([width,height],map);

    //初始化边界图形
    const path = d3.geoPath(projection);
    
    //定义legend过滤器,获得对应legend区间的国家数据
    const filteredData = data.filter(d=>(d.Productivity>=(selectedInterval.length===0? null:+selectedInterval[0]))
                                                       &&(d.Productivity<=(selectedInterval.length===0? null:+selectedInterval[1]===50?100:+selectedInterval[1])))


    //定义country过滤器
    const filteredCountry = data.filter(d=>d.Entity===selectedCountry.country);

    //定义透明度映射函数
    const opacity = (selectedCountry.country || selectedInterval.length>0) ? 0.5:1;

    const onMouseOver = (event,country,value)=>{
        setSelectedCountry({country:country,
                            value:value});
        setPosition({x:event.pageX,
                     y:event.pageY-400})
        console.log(event.pageX,event.pageY);
        
    }
    console.log()
    const onMouseOut = ()=>{
        setSelectedCountry({country:null,value:null});
        setPosition(null);
    }

    //返回地图的细节
    return <g className="WorldMap">
        <path className={'sphere'} d={path({type: 'Sphere'})} />
        //画出所有的国家的颜色
        {mapFeatures.map( feature => {
            const country = data.filter( d => d.Entity === feature.properties.name);
            if (country[0]){
                return <g key={feature.properties.name+"boundary"} >
                <path onMouseOver={(event)=>{onMouseOver(event,feature.properties.name,country[0].Productivity);}}
                onMouseOut={()=>{onMouseOut(null)}} onClick={()=>{setView(0);setClickedCountry(country[0].Entity);setNav(0)}} className={"boundary"} 
                d={path(feature)} 
                style={{fill: color(country[0].Productivity)}}
                strokeWidth="0.3667128884810221"
                stroke="#333" opacity={opacity}
                /></g>}
            else {
                return <g key={feature.properties.name+"boundary"} >
                <path onMouseOver={(event)=>{onMouseOver(event,feature.properties.name,"No data");}}
                onMouseOut={()=>{onMouseOut(null)}} className={"boundary"} 
                d={path(feature)} style={{fill: "#eee"}} strokeWidth="0.3667128884810221"
                stroke="#aaa" opacity={opacity}
                />
                </g>
                }
        })}

        //画出所有未被filter的国家
        {mapFeaturesUnfiltered.map( feature => {
            const country = data.filter( d => d.Entity === feature.properties.name);
            if (country[0]){
                return <g key={feature.properties.name+"boundary"} >
                <path  className={"boundaryUnfilter"} 
                d={path(feature)} 
                style={{fill: "#fff"}}
                strokeWidth="0.3667128884810221"
                stroke="#aaa" opacity={opacity}
                /></g>}
            else {
                return <g key={feature.properties.name+"boundaryUnfilter"} >
                <path  className={"boundary"} 
                d={path(feature)} style={{fill: "#fff"}} strokeWidth="0.3667128884810221"
                stroke="#aaa" opacity={opacity}
                />
                </g>
                }
        })}


        //返回选中图例所对应的数据区域
        {mapFeatures.map( feature => {
            const country = filteredData.filter( d=> d.Entity === feature.properties.name);
            if(country[0]){
                return (<g key={feature.properties.name+"boundarySelect"}><path className={"boundary"}
                d={path(feature)} strokeWidth="1.5" stroke="#333" style={{fill:color(country[0].Productivity)}}
                onMouseOver={()=>{}} onMouseOut={()=>{}}/></g>)
            }else{
                return <g key={feature.properties.name+"boudarySelect"}></g>
            }
        })}


        //返回选中country所对应的区域
        {mapFeatures.map( feature => {
            const country = filteredCountry.filter( d=> d.Entity === feature.properties.name);
            if(country[0]){
                return (<g key={feature.properties.name+"boundarySelect"}><path  className={"boundary"}
                d={path(feature)} opacity={1} strokeWidth="1.5" stroke="#333" 
                style={{fill:color(country[0].Productivity)}} /></g>)

            }else{
                if(selectedCountry.country===feature.properties.name){
                    return (<g key={feature.properties.name+"boundarySelect"}><path  className={"boundary"}
                d={path(feature)} opacity={1} strokeWidth="1.5" stroke="#333" 
                style={{fill:"#eee"}}/></g>)
                }else{
                return (<g key={feature.properties.name+"boundarySelect"}></g>)}
            }
        })}
        

        //返回图例选中的null的国家
        {mapFeatures.map(feature =>{
            if(selectedInterval==="null"&&nullCountry.has(feature.properties.name)){
                return(<g key={feature.properties.name+"boundarySelect"}>
                    <path className={"boundary"} d={path(feature)} opacity={1}
                    strokeWidth="1.5" stroke="#333" fill={"#eee"}/>
                    </g>)
            }else{
                return (<g key={feature.properties.name+"boundarySelect"}></g>)
            }
        })}

    </g>
}

export {TheMap};