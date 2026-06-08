import Engine from "./Engine.js";
import WaveEffect from "./effects/WaveEffect.js";

const container = document.querySelector(".dots");

const engine = new Engine(container, 40);

engine.setEffect(new WaveEffect());

engine.start();
