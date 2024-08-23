import React from 'react'
import ReactDOM from "react-dom"
import {useData,useMap,useMapping} from "./utils"
import {csvUrl,mapUrl,mappingUrl} from "./static_files/constants"
import {MainPage} from "./SwitchingViews"
import {MainPage1} from "./SwitchingViews"
import "./index.css"

const AllView = ()=>{
    const dataAll = useData(csvUrl);
    const mapAll = useMap(mapUrl);
    const mapping_dict = useMapping(mappingUrl);
    if (!mapAll || ! dataAll ||!mapping_dict) {
        return <pre>Loading...</pre>
    };
    
    return (<div>
        <h5 style={{"fontSize": "50px", "lineHeight": 1, "overflow-y": "visible"}}>What about the work around the world?</h5>
        <h6 style={{"fontSize": "20px", "lineHeight": 2, "overflow-y": "visible"}}>
        Work is a central part of our lives. It is something we do almost every day. Because it is so central, looking closely at how much time we spend working can tell us a lot about our lives and the societies we live in.

How much do people around the world work? In many countries today, people work much less than in the past 150 years. Working less means being able to spend time becoming more educated, or simply enjoying leisure time. This is substantial progress, but there are still huge inequalities across and within countries, and progress still to make.

Here we present the data on working hours. We explore how it differs across countries and over time and how these differences matter for people’s lives.</h6>

        <div className = "AppView">
        <MainPage dataAll={dataAll} mapAll={mapAll} mapping_dict={mapping_dict}/>
        </div>
        <div className="AppView1">
        <MainPage1 dataAll={dataAll} mapAll={mapAll} mapping_dict={mapping_dict}/>
        </div>
    </div>)
    
}

ReactDOM.render( <AllView />, document.getElementById('root'));
