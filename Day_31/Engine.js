import Particle from "./Particle.js";

export default class Engine {
  constructor(container, count) {
    this.container = container;
    this.particles = [];
    this.effect = null;

    for (let i = 0; i < count; i++) {
      this.particles.push(new Particle(0, 0, container));
    }
  }

  setEffect(effect) {
    this.effect = effect;
  }

  start() {
    const animate = (time) => {
      if (this.effect) {
        this.effect.update(this.particles, time);
      }

      this.particles.forEach((particle) => particle.render());

      requestAnimationFrame(animate);
    };

    requestAnimationFrame(animate);
  }
}
