import React from "react";
import { createRoot } from "react-dom/client";
import App from "../App";

let test = document.querySelector("#secondBody");
const root = createRoot(test.appendChild(document.createElement("div")));
root.render(<App />);
