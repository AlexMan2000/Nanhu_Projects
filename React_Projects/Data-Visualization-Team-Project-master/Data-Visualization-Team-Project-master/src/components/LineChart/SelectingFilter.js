import React from 'react';
import Button from '@material-ui/core/Button';
import {CheckBoxAll} from "./CheckBox"

function SelectingFilter(props){
    const {data,selectedCountryBox,setSelectedCountryBox} = props;
    const [open,setOpen] = React.useState(-1);


    return (<div className={"SelectingFilter"}>
        <div className="ButtonFilter">
            <Button variant="contained" color="primary" onClick={()=>{setOpen(-open)}}>{open===-1?"Add Country":"Close"}</Button></div>
        <CheckBoxAll data={data} selectedCountryBox={selectedCountryBox} 
        setSelectedCountryBox={setSelectedCountryBox} open={open} 
        />
        </div>)
}

export {SelectingFilter}