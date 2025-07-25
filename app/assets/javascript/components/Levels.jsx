import React, { useState, useEffect, useRef } from "react";
import { useParams, useNavigate } from "react-router-dom";
import Timer from "./Timer";

export default () => {
  const [winIssued, setWinIssued] = useState(false);
  const [character, setCharacter] = useState(new Array(4).fill(false));
  const [grid, setGrid] = useState([]);
  const { id } = useParams();
  const [levelImage, setLevelImage] = useState("#");
  const [coordinates, setCoordinates] = useState([]);
  const [score, setScore] = useState(0);
  const [eventDisabled, setEventDisabled] = useState(false);
  const [playerName, setPlayerName] = useState("Anonymous");
  const levelRef = useRef(null);
  const mapRef = useRef(null);
  const playingFieldRef = useRef(null);
  //
  function debug() {
    console.log("--------------------");
    console.log("--------DEBUG----");
    console.log(grid);
    console.log(coordinates);
    console.log(coordinates.length);
    console.log(score);
    console.log(character);
    console.log("------EODEBUG----");
    console.log("--------------------");
  }
  //
  async function getData() {
    const url = "http://testing:3000/api/v1/data/" + id;
    try {
      const call = await fetch(url);
      const data = await call.json();

      applyCoordinates(data.coordinates);
      setLevelImage(data.url);
    } catch (error) {
      console.log(error);
    }
  }

  async function winCall() {
    // WIP POSSIBLY SUBMIT WIN TO API CALL ?
    const url = "http://testing:3000/api/v1/data/" + id + "/win";
    try {
      const body = {
        player_name: playerName,
      };
      const token = document.querySelector('meta[name="csrf-token"]');
      await fetch(url, {
        method: "POST",
        headers: {
          "X-CSRF-TOKEN": token["content"],
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      })
        .then((response) => {
          if (response.ok) {
            return response;
          }
          throw new Error("Network response was not OK?!?!?");
        })
        .then((response) => {
          window.location.replace("/scoreboard");
        });
    } catch (error) {
      console.error(error);
    }
  }
  function incrementScore() {
    setScore(score + 1);
  }
  function applyCoordinates(coordinateSet) {
    newCoordinates = coordinateSet.map((newCord) => {
      return newCord;
    });
    setCoordinates(newCoordinates);
  }
  function adjustCoordinates(matchedCoordinate) {
    setCoordinates(
      coordinates.filter((currentCoordinate) => {
        return currentCoordinate.character_id != matchedCoordinate.character_id;
      })
    );
  }
  function verifyCoordinate(clickedCoordinate = [1, 1]) {
    mappedCords = coordinates.map((coord) => {
      return [coord.x_cord, coord.y_cord];
    });

    let coordinateMatch = coordinates.find((value) => {
      if (
        JSON.stringify([value.x_cord, value.y_cord]) ==
        JSON.stringify(clickedCoordinate)
      ) {
        return value;
      }
    });

    if (coordinateMatch != null) {
      adjustCoordinates(coordinateMatch);
      manageCharacterState(coordinateMatch.character_id - 1);
      incrementScore();
    }
  }

  function imageClickHandler(position) {
    verifyCoordinate(position);
  }

  function updateGrid(gridUpdate) {
    setGrid([...grid, gridUpdate]);
  }

  function checkGamestate() {
    if (score >= 4 && winIssued == false) {
      setWinIssued(true);
      deactivateGame();
      winScene();
    }
  }
  function makeplayArea() {
    let levelHeight = Math.round(levelRef.current.clientHeight / 30);
    let levelWidth = Math.round(levelRef.current.clientWidth / 30);
    let emptyArray = new Array(levelHeight).fill([]);
    var heightAccumulator = 0;

    setGrid(
      emptyArray.map(() => {
        var widthAccumulator = 0;
        let halfGrid = new Array(levelWidth).fill(heightAccumulator);
        let fullGrid = halfGrid.map((subArray) => {
          subArray = [widthAccumulator, heightAccumulator];
          widthAccumulator += 1;
          return subArray;
        });
        heightAccumulator += 1;
        return fullGrid;
      })
    );
  }

  function deactivateGame() {
    setEventDisabled(!eventDisabled);
  }
  function winScene() {
    let name =
      window.prompt("Congratulations!\nWhat is your name?") || "Anonymous";
    setPlayerName(name);
  }

  function manageCharacterState(charNum) {
    nextCharacter = character;
    nextCharacter[charNum] = !nextCharacter[charNum];
    setCharacter(nextCharacter);
  }
  function clickHandler(textContent = "nothing") {
    changeCharacter(textContent);
    //
    verifyCoordinate();
  }

  // getting level data/posting win submit
  useEffect(() => {
    getData();
    if (winIssued == true) {
      winCall();
    }
  }, [winIssued]);

  checkGamestate();
  return (
    <>
      <Timer />
      <div id="gameContainer">
        <div id="playField">
          <div id="map" ref={mapRef}>
            <div id="clickMap">
              {grid.map((column) => (
                <div key={column} className="grid-Column">
                  {column.map((coordinates) => (
                    <div
                      key={coordinates}
                      className="grid-Row"
                      ref={playingFieldRef}
                      onClick={() => {
                        if (!eventDisabled) {
                          imageClickHandler(coordinates);
                        }
                      }}
                    ></div>
                  ))}
                </div>
              ))}
            </div>
            <img
              id="playingMap"
              ref={levelRef}
              onLoad={makeplayArea}
              src={levelImage}
              alt="where's wally map"
            />
          </div>
        </div>
        <div id="characters">
          <button>
            {character[0] == false ? (
              "Character 1"
            ) : (
              <strike> Character 1</strike>
            )}
          </button>
          <button>
            {character[1] == false ? (
              "Character 2"
            ) : (
              <strike> Character 2</strike>
            )}
          </button>
          <button>
            {character[2] == false ? (
              "Character 3"
            ) : (
              <strike> Character 3</strike>
            )}
          </button>
          <button>
            {character[3] == false ? (
              "Character 4"
            ) : (
              <strike> Character 4</strike>
            )}
          </button>
        </div>
      </div>
    </>
  );
};
