export default class WaveEffect {
  constructor(amplitude = 50, speed = 0.005, wave = Math.sin) {
    this.amplitude = amplitude;
    this.speed = speed;
    this.wave = wave;
  }

  update(particles, time) {
    particles.forEach((particle, i) => {
      const phase = i * 0.3;

      particle.x = this.amplitude * this.wave(time * this.speed + phase);

      particle.y = i * 18;
    });
  }
}
