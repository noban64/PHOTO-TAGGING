import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home.jsx";
import Levels from "../components/Levels.jsx";
import Scoreboard from "../components/Scoreboard.jsx";
import About from "../components/About.jsx";
import ErrorPage from "../components/ErrorPage.jsx";

export default (
  <Router>
    <Routes>
      <Route path="/" element={<Home />} ErrorBoundary={<ErrorPage />} />
      <Route
        path="/level/:id"
        element={<Levels />}
        ErrorBoundary={<ErrorPage />}
      />
      <Route
        path="/scoreboard"
        element={<Scoreboard />}
        ErrorBoundary={<ErrorPage />}
      />
      <Route path="/about" element={<About />} ErrorBoundary={<ErrorPage />} />
    </Routes>
  </Router>
);
