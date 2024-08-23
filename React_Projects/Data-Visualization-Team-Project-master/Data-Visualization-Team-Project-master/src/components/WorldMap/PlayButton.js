import React from 'react'

const delay=200;
const Pause = ({onPlayerClick}) => {
  return (
    <svg className="button" viewBox="0 0 60 60" onClick={onPlayerClick}>
      <polygon points="0,0 15,0 15,60 0,60" />
      <polygon points="25,0 40,0 40,60 25,60" />
    </svg>
  )
}

const Play = ({onPlayerClick}) => {
  return (
      <svg className="button" viewBox="0 0 60 60" onClick={onPlayerClick}>
        <polygon points="0,0 50,30 0,60" />
      </svg>
  )
}




function PlayButton(props){
    const {setYear,setValue} = props;
    const [state,setState] = React.useState(false);
    const [counter,setCounter] = React.useState(0);
    const timeoutRef = React.useRef(null);


    const resetTimeout = ()=>{
      if(timeoutRef.current){
        clearTimeout(timeoutRef.current);
      }
    }

    React.useEffect(()=>{
      resetTimeout();
      if (state===true){
        timeoutRef.current = setTimeout(()=>{
          setCounter((prevalue=>prevalue+1));
          setYear((prevalue)=>prevalue===2017?1950:prevalue+1);
          setValue((prevalue)=>prevalue===2017?1950:prevalue+1);
        },delay);
      }
      return ()=>{
        resetTimeout();
      }
    },[state,counter])

    const handlePlayerClick = () => {
        if (!state) {
          setState(true);
        } else {
          setState(false);
        }
      }
      
        return (
        <div className="player" >
            {state? <Pause onPlayerClick={handlePlayerClick} /> : <Play onPlayerClick={handlePlayerClick} />}
        </div>
        )

}

export {PlayButton};