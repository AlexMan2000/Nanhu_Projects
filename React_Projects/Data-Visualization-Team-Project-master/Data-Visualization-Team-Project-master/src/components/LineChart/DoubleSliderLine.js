import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';



//定义滑块
// const useStyles = makeStyles({
//     root:{
//         width:600,
//     },
//     margin: {
//         height: theme.spacing(3),
//       },
// });
const useStyles = makeStyles((theme) => ({
    root:{
        width:600,
    },
    margin: {
        height: theme.spacing(3),
      },
  }));


function valuetext(value){
    return `${value}`;
}

function DoubleSlider(props){
    const {year,setYear,value,setValue} = props;
    const classes = useStyles();

    const handleChange = (event,newValue)=>{
        setValue(newValue);
        setYear(newValue);
    }

    return (
        <div className={"LineChartSlider"}><div className={classes.root}>
            <div className="title">
                <Typography id="range-slider" gutterBottom>Year range</Typography>
                </div>
                <div className="sliderComponents">
                <div className="yearLabel left">1950</div>
                <Slider  value={value} onChange={handleChange} 
                        min={1950}
                        max={2017}
                        valueLabelDisplay="auto"
                        aria-labelledby="range-slider"
                        getAriaValueText={valuetext} />
                <div className="yearLabel right">2017</div>
                </div>
            </div>
        </div>)
}

export {DoubleSlider}