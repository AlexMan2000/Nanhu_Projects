import React from 'react'
import {BottomControl} from "./components/BottomControl"
import {WorldProductivityLine} from "./components/LineChart/LineIndex"
import {WorldProductivityMap} from "./components/WorldMap/MapIndex"
import {ArrowChartLine} from "./components/ArrowChart/ArrowIndex"

function MainPage (props){
    const [view,setView] = React.useState(1);
    const [clickedCountry,setClickedCountry] = React.useState(null);
    const [nav,setNav] = React.useState(1);
    const {dataAll,mapAll,mapping_dict} = props;
    


    if (view===1){
        return (<div className="Map">
        <WorldProductivityMap dataAll={dataAll} mapAll={mapAll} mapping_dict={mapping_dict} 
        view={view} setView={setView} setClickedCountry={setClickedCountry} setNav={setNav}/>
        <BottomControl nav={nav} setNav={setNav} view={view} setView={setView} setClickedCountry={setClickedCountry}/>
    </div>)
    }else{
        return (<div className="Line">
        <WorldProductivityLine dataAll={dataAll} clickedCountry={clickedCountry}/>
        <BottomControl nav={nav} setNav={setNav} view={view} setView={setView} setClickedCountry={setClickedCountry}/>
    </div>)
    }
    
}

export {MainPage};

function MainPage1 (props){
    const [view,setView] = React.useState(1);
    const [clickedCountry,setClickedCountry] = React.useState(null);
    const [nav,setNav] = React.useState(1);
    const {dataAll,mapAll,mapping_dict} = props;
    

    if (view===1){
        return (<div className="Arrow">
        <ArrowChartLine dataAll={dataAll} mapping_dict={mapping_dict} clickedCountry={clickedCountry}/>
    </div>)
    }
    
}

export {MainPage1}
