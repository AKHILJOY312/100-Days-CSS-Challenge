export default class Particle {
  constructor(x, y, container) {
    this.x = x;
    this.y = y;

    this.element = document.createElement("div");
    this.element.classList.add("dot");

    container.appendChild(this.element);
  }

  render() {
    this.element.style.transform = `translate(${this.x}px, ${this.y}px)`;
  }
}
