import React, { useEffect, useState } from "react";

export default () => {
  const [second, setSecond] = useState(0);
  const [minute, setMinute] = useState(0);
  const [hour, setHour] = useState(0);
  function incrementTimer() {
    newTimer = second + 1;
    if (newTimer >= 60) {
      newTimer = 0;
      minuteTimer = minute + 1;

      if (minuteTimer >= 60) {
        minuteTimer = 0;
        hourTimer = hour + 1;
        setHour(hourTimer);
      }
      setMinute(minuteTimer);
    }
    setSecond(newTimer);
  }

  useEffect(() => {
    const key = setInterval(() => {
      incrementTimer();
    }, 1000);

    return () => {
      clearInterval(key);
    };
  });
  function format(n) {
    return n > 9 ? "" + n : "0" + n;
  }
  return (
    <div id="timer">
      {format(hour)}:{format(minute)}:{format(second)}
    </div>
  );
};
