import React, { useState, useEffect,useRef } from "react";
import {useParams} from "react-router-dom"
import Timer from "./Timer";

export default () => {
  const [character, setCharacter] = useState(1);
  const [grid, setGrid] = useState([])
  const {id} = useParams()
  const [levelImage,setLevelImage] = useState("#");
  const [coordinates, setCoordinates] = useState([]);
  const [score, setScore] = useState(0);
  const [eventDisabled, setEventDisabled] = useState(false);
  const levelRef = useRef(null);
  const mapRef = useRef(null);
  const playingFieldRef = useRef(null);


  async function getData() {
      const url = ("http://testing:3000/api/v1/data/" + id);
    try{
        const call = await fetch(url);
        const data = await call.json(); 

        applyCoordinates(data);
        setLevelImage(data.url);
        
    }
    catch(error){ 
        console.log(error);
    }
  }

  async function submitData(information) {
      const url = ("http://testing:3000/api/v1/data/" + id);
    try{
        const call = await fetch(url);
        const data = await call.json(); 

        applyCoordinates(data);
        setLevelImage(data.url);
        
    }
    catch(error){ 
        console.log(error);
    }
  }
function incrementScore(){ 
  setScore(score + 1);
}
  function applyCoordinates(coordinateSet) {  
    console.log(coordinateSet)
    newCoordinates = coordinateSet.coordinates.map((newCord) => {
      return newCord
    });
    setCoordinates(newCoordinates)
  }
  function verifyCoordinate(clickedCoordinate = [1,1]) {
    console.log(clickedCoordinate)
    mappedCords = coordinates.map((coord) => {
    return [coord.x_cord,coord.y_cord]
  })
    if (JSON.stringify(mappedCords).includes(JSON.stringify(clickedCoordinate))) {
      console.log("You found the character!")
      incrementScore();
    }
    else {
      console.log("Try again!")
    }

  }

  function imageClickHandler(position) {
    console.log("you have clicked" + JSON.stringify(position))
    checkGamestate();
    verifyCoordinate(position);
    }
  function imageClick() {}

  function updateGrid(gridUpdate) { 
    setGrid([...grid, gridUpdate])
  }

  function checkGamestate() { 
    if (score > 4) { 
      console.log("you win!")
      deactivateGame()
      winScene();
    }
  }
  function scoreboardCreation() { 

  }
  function makeplayArea() { 
    let levelHeight = Math.round(levelRef.current.clientHeight/10);
    let levelWidth = Math.round(levelRef.current.clientWidth/10);
    let emptyArray = new Array(levelHeight).fill([]);
    var heightAccumulator = 0;

    setGrid(emptyArray.map(() => {
    var widthAccumulator = 0;       
      let halfGrid = new Array(levelWidth).fill(heightAccumulator);
      let fullGrid = halfGrid.map((subArray) => {
        subArray = [widthAccumulator, heightAccumulator];
        widthAccumulator += 1;
        return subArray;
      });
      heightAccumulator+=1;
      return fullGrid;
  
    }))
  }

  function deactivateGame() { 
    console.log("deactivategamefunciton")
    console.log(playingFieldRef)
    setEventDisabled(!eventDisabled)
    console.log(eventDisabled);
    console.log("endofdeactivategamefunciton")
  }
  function winScene(){ 
    let name = window.prompt("Congratulations!\nWhat is your name?") || "Anonymous"

    console.log(name);
    return (
      <iframe src="" frameborder="0"></iframe>
    ) 
  }

  function submitWin() {
    useEffect(() => {
      console.log("SUBMIT WIN EFFECT")
 
      console.log("END OF SUBMIT WIN EFFECT")
    }, []);
  
  }

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
    // 
    verifyCoordinate();
  }

  useEffect(() => {
    console.log("Using effect")
    getData();
    console.log(levelImage)
  }, []);

  ///testing
  console.log(grid)
  console.log(coordinates)
  //endoftesting
  return (
    <>
    <Timer />
      <div id="gameContainer">
        <div id="playField">
          <div id="map" ref={mapRef}>

            <div id="clickMap" >
            {
            grid.map((column) => (
              <div key={column} className="grid-Column" > 
              {column.map((coordinates) => ( 

                 <div key={coordinates} className="grid-Row"  ref={playingFieldRef} onClick={
                   () => {  
                    if (!eventDisabled) { imageClickHandler(coordinates)} }}
                   >

                   </div> 
              ))}
              </div> 
            ))}
            </div>
            <img id = "playingMap" ref={levelRef}  onLoad={makeplayArea} src={levelImage} alt="where's wally map" />

          </div>
        </div>
          <div id="characters">
            <button onClick={() => clickHandler(1)}>Character 1</button>
            <button onClick={() => clickHandler(2)}>Character 2</button>
            <button onClick={() => clickHandler(3)}>Character 3</button>
            <button onClick={() => clickHandler(4)}>Character 4</button>
            <button onClick={() => {winScene();deactivateGame();}}>Win (TEST BUTTON)</button>
          </div>
      </div>
    </>
  );
};

// export default Home;
