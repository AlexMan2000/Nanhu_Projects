import * as d3 from "d3"

function ToolTipMap(props){
    const{dataAll,mapAll,position,setPosition,selectedCountry,setSelectedCountry,year,continent} = props;

    let barData = dataAll.filter(d=>d.Entity===selectedCountry.country);
    barData = barData.filter(d=>d.Year>=year-20&&d.Year<=year)
    const currentLength = barData.filter(d=>d.Year===year).length;
    const barLength = barData.length;
    //用0填充之前空缺的年份
    if(barData.length<20){
        for(let i=0;i<20-barLength;i++){
          barData.unshift({Entity:selectedCountry.country,Year:year-20+i,Productivity:0})}

    }

    const currentBar = barData.slice(-1)[0];

    const heightPercentage = (barData,productivity)=>{
        
        const maxProductivity = d3.max(barData,d=>d.Productivity)
        return productivity/maxProductivity*100;
    }

    if(position){
        if (barLength===0||currentLength===0){
            return (<div className="ToolTip" style={{left:position.x, top:position.y}}>
                    <h3>{selectedCountry.country}</h3>
                    <div>
                        <p>{`No data for ${year}`}</p>
                        </div>
                
                    </div>)
        }else{
            return(<div className="ToolTip" style={{left:position.x, top:position.y}}>
                    <h3 style={{"padding": "0.3em", "margin": "0px", "font-weight": "normal", "font-size": "1em"}}>{selectedCountry.country}</h3>
                    <div style={{margin: "0px",padding: "0.3em"}}>
                        <div className="map-tooltip">
                            <div className="trend">
                                <div className="plot">
                                    <div className="spark-bars">
                                        {barData.slice(0,-1).map(bar=>{
                                            return (<div key={bar.Year} className="bar-wrapper">
                                            
                                                    <div className="bar normal"
                                                    style={{height:heightPercentage(barData,bar.Productivity).toString()+"%"}}
                                                    ></div>
                                                </div>)
                                        })}
                                        <div key={year} className="bar-wrapper">
                                            <div className="bar current" 
                                            style={{height:heightPercentage(barData,currentBar.Productivity).toString()+"%"}}></div>
                                            </div>
                                        </div>
                                    
                                    
                                    </div>
                                <div className="value">
                                    <div className="time-series-value current">
                                        <span className="count">
                                            <span>
                                                {selectedCountry.value==="No data" ? `No data` : selectedCountry.value.toFixed(2).toString()+"$/h"}
                                                </span>
                                            </span>
                                        <span className="date">
                                            {year}
                                            </span>
                                        
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <p style={{"margin":"0px", "padding": "0.3em 0.9em", "font-size": "13px", "opacity": "0.6"}}>{"Click for change over time"}</p>
                        </div>
                </div>)
            }
    }else{
            return <div></div>
        }
}


export {ToolTipMap}