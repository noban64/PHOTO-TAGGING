import React, { useState, useEffect } from "react";

export default () => {
  const [character, setCharacter] = useState(1);
  var levelImage = "#";

  async function getImage() {
    try{
        const call = fetch("https://www.testing:3000/api/v1/level/1")
        const data = await call; 
        return levelImage = data.image.json();
    }
    catch(error){ 
        console.log(error);
    }
  }

  function findCoordinate(coordinates) {}

  function imageClick() {}

  function changeCharacter(charNum) {
    let workingNumber = parseInt(charNum);
    if (
      workingNumber != 1 ||
      workingNumber != 2 ||
      workingNumber != 3 ||
      workingNumber != 4
    ) {
      console.log("You done played with the event!");
      setCharacter(1);
    } else {
      setCharacter(parseInt(workingNumber));
    }
  }
  function clickHandler(textContent = "nothing") {
    console.log(character);
    changeCharacter(textContent);
  }

  useEffect(() => {
    console.log("Using effect")
    getImage();
  }, []);
  return (
    <>
      <div id="gameContainer">
        <div id="playField">
          <div id="map">
            <img id = "playingMap" src={levelImage} alt="where's wally map" />
          </div>
          <div id="characters">
            <button onClick={() => clickHandler(1)}>Character 1</button>
            <button onClick={() => clickHandler(2)}>Character 2</button>
            <button onClick={() => clickHandler(3)}>Character 3</button>
            <button onClick={() => clickHandler(4)}>Character 4</button>
          </div>
        </div>
      </div>
    </>
  );
};

// export default Home;
