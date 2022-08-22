import React from "react";
import { createRoot } from "react-dom/client";
import Greeting from "./components/Greeting.jsx";

const container = document.querySelector('#greeting');
const root = createRoot(container);
root.render(<Greeting />);
