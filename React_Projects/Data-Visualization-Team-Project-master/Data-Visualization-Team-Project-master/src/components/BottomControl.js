import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import LanguageIcon from '@material-ui/icons/Language';
import MultilineChartIcon from '@material-ui/icons/MultilineChart';


const useStylesNavigation = makeStyles({
    root:{
        width:500
    }
});

function BottomControl(props){
    const classes = useStylesNavigation();
    // const [value,setValue] = React.useState(1);
    const {nav,setNav,setView,setClickedCountry} = props;


    return (<div className={"NavigationBar"}>
        <BottomNavigation
            value={nav}
            onChange={(event,newValue)=>{
                setNav(newValue);
                setView(newValue);
                setClickedCountry(null);
            }}
            showLabels
            className={classes.root}>
            <BottomNavigationAction label="LineChart" icon={<MultilineChartIcon/>}/>
            <BottomNavigationAction label="Map" icon={<LanguageIcon/>}/>
        </BottomNavigation>
        
        </div>)
}

export {BottomControl}