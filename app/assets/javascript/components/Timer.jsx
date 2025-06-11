import React ,{useEffect, useState} from "react";

export default () => {
const [timer, setTimer] = useState(0);
function incrementTimer() {
    newTimer = timer+1 
    setTimer(newTimer)
}

useEffect(() => {

    const key = setInterval(() => { 
   incrementTimer()},1000 
    )


    return () => {
        clearInterval(key);
    }
})

return(
 <div>{timer}</div>
) 
}