import React from 'react';
import * as d3 from "d3-collection"
import { makeStyles } from '@material-ui/core/styles';
import {defaultCountries} from "../../static_files/constants"
import FormLabel from '@material-ui/core/FormLabel';
import FormControl from '@material-ui/core/FormControl';
import FormGroup from '@material-ui/core/FormGroup';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import FormHelperText from '@material-ui/core/FormHelperText';
import Checkbox from '@material-ui/core/Checkbox';


//定义多选框
const useStylesCheckbox = makeStyles((theme) => ({
   root: {
       display: 'flex',
   },
   formControl: {
       margin: theme.spacing(3),
   },
   }))

function CheckBoxAll(props){

       const {data,setSelectedCountryBox,open}=props;

       const allCountry = d3.nest().key(d=>d.Entity).entries(data);
       const allCountryList = allCountry.map(d=>d.key);

       const defaultCountryList = new Set(defaultCountries);

       //设置选中的初始值
       let defaultmapping = {};
       allCountryList.forEach(country=>{
           if(defaultCountryList.has(country)){
               defaultmapping[country]=true}else{
               defaultmapping[country]=false
               }});


       //设置selectbox的样式和内部事件函数
       const classes = useStylesCheckbox();

       const [state,setState] = React.useState(
       defaultmapping)

       //设置事件回调函数
       const handleChange = (event)=>{
       const selectedState = {...state,[event.target.name]:event.target.checked};
       let filteredCountries = [];
       for(let key in selectedState){
       if(selectedState[key]===true){
       filteredCountries.push(key)
       }
       }
       setState(selectedState);
       setSelectedCountryBox(filteredCountries);
       }

       return (
       <div className={"LineChartSelectBox"} style={{"opacity":open===-1?"0":"0.95","zIndex":open===-1?"-1":"1"}}><div className={classes.root}>
       <FormControl component="fieldset" className={classes.formControl}>
       <FormLabel component="legend">Countries Available</FormLabel>
       <FormGroup>
       {allCountryList.map(country=><FormControlLabel key={Math.random().toString()+country+"ToSelect"} control={<Checkbox checked={state[country]}/>} 
       onChange={handleChange} name={country} label={country}/>)}
       </FormGroup>
       <FormHelperText>Click to add more countries to the chart</FormHelperText>
       </FormControl>
       <FormControl  component="fieldset" className={classes.formControl}>
       <FormLabel component="legend">SelectedCountries</FormLabel>
       <FormGroup>
       {allCountryList.map(country=>{
       if(state[country]===true){
       return(<FormControlLabel key={Math.random().toString()+country+"Selected"}control={<Checkbox checked={state[country]}/>} 
       onChange={handleChange} name={country} label={country}/>)}
       else{
       return <div key={Math.random()}></div>
       }

       })}
       </FormGroup>
       <FormHelperText>Click to unselect</FormHelperText>
       </FormControl>
       </div></div>)
}

export {CheckBoxAll}