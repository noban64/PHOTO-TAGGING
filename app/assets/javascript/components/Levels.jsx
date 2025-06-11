import React, { useState, useEffect,useRef } from "react";
import {useParams} from "react-router-dom"

export default () => {
  const [character, setCharacter] = useState(1);
  const [grid, setGrid] = useState([])
  const {id} = useParams()
  const [levelImage,setLevelImage] = useState("#");
  const [coordinates, setCoordinates] = useState([]);
  const levelRef = useRef(null)
  const mapRef = useRef(null)


  // async function getData() {
  //     const url = ("http://testing:3000/api/v1/data/" + id);
  //   try{
  //       const call = await fetch(url);
  //       const data = await call; 
  //       
  //       console.log(call)
  //       console.log(data);
  //      setCoordinates(data.coords.json());
  //      setLevelImage(data.url.json());
  //       
  //   }
  //   catch(error){ 
  //       console.log(error);
  //   }
  // }

  function verifyCoordinate(coordinates) {}

  function imageClickHandler(position) {
    console.log("you have clicked" + JSON.stringify(position))
  }
  function imageClick() {}

  function updateGrid(gridUpdate) { 
    setGrid([...grid, gridUpdate])
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
+
    // 
    verifyCoordinate();
  }

  useEffect(() => {
    console.log("Using effect")
    async function getImage() {
      const url = ("http://testing:3000/api/v1/data/" + id);
    try{
        const call = await fetch(url);
        const data = await call.json(); 
        console.log(data.url);
        setLevelImage(data.url);
    }
    catch(error){ 
        console.log(error);
    }
  }

    getImage();
    console.log(levelImage)
  }, []);

  ///testing
  console.log(grid)

  //endoftesting
  return (
    <>
      <div id="gameContainer">
        <div id="playField">
          <div id="map" ref={mapRef}>

            <div id="clickMap">
            {
            grid.map((column) => (
              <div key={column} className="grid-Column"> 
              {column.map((coordinates) => ( 

                 <div key={coordinates} className="grid-Row" onClick={
                   () => imageClickHandler(coordinates)}
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
          </div>
      </div>
    </>
  );
};

// export default Home;
