import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import InputLabel from '@material-ui/core/InputLabel';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';

//自定义选择器组件
const useStylesSelect = makeStyles((theme) => ({
    button: {
        display: 'block',
        marginTop: theme.spacing(2),
    },
    formControl: {
        margin: theme.spacing(1),
        minWidth: 120,
    },
    }))

function SelectBox(props){
        const classes = useStylesSelect();
        const [continentIn,setContinentIn] = React.useState("");
        const [open,setOpen] = React.useState(false);
        const {continent,setContinent}=props;

        const handleChange=(event)=>{
            setContinentIn(event.target.value);
            setContinent(event.target.value);
        }

        const handleClose=()=>{
            setOpen(false);
        }

        const handleOpen=()=>{
            setOpen(true);
        }


        return (<div className="SelectBox">
            <FormControl className = {classes.formControl}>
                <InputLabel id="open-select-label">Continent</InputLabel>
                <Select
                    labelId="controlled-open-select-label"
                    id="controlled-open-select-label"
                    open={open}
                    onClose={handleClose}
                    onOpen={handleOpen}
                    value={continentIn}
                    onChange={handleChange}>
                    <MenuItem value={"World"}>World</MenuItem>
                    <MenuItem value={"Africa"}>Africa</MenuItem>
                    <MenuItem value={"North America"}>North America</MenuItem>
                    <MenuItem value={"South America"}>South America</MenuItem>
                    <MenuItem value={"Asia"}>Asia</MenuItem>
                    <MenuItem value={"Europe"}>Europe</MenuItem>
                    <MenuItem value={"Oceania"}>Oceania</MenuItem>
                    </Select>
                </FormControl>
            
            </div>)
    }

export {SelectBox}