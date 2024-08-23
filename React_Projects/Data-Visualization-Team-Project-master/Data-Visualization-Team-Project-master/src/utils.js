import * as d3 from "d3";
import * as topojson from "topojson"
import React from "react"

//加载地图数据
function useMap(jsonPath) {
    const [data, setData] = React.useState(null);
    React.useEffect(() => {
        d3.json(jsonPath).then(topoJsonData => {
            setData(
                topojson.feature(topoJsonData, topoJsonData.objects.countries),
              )});
    }, []);
    return data;
}

//加载国家产出数据
function useData(csvPath){
    const [dataAll, setData] = React.useState(null);
    React.useEffect(() => {
        d3.csv(csvPath).then(data=> {
            data.forEach(d => {
                d.timestamp = new Date(d.Year);
                d.Year = +d.Year;
                d.Avh_worked =+ d.Avh_worked;
                d.Productivity = +d.Productivity;
            });
            setData(data);
        });
    }, []);
    return dataAll;
}


//加载国家对应大洲的数据
function useMapping(csvPath){
    const [mapping,setMapping] = React.useState(null);
    React.useEffect(()=>{
        d3.csv(csvPath).then(data => {
            setMapping(data);
        });
    },[]);
    return mapping;
}

export {useMap,useData,useMapping}