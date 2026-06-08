class DNAEffect extends Effect {
  update(particles, time) {
    particles.forEach((particle, i) => {
      particle.x = 100 + 50 * Math.sin(time * 0.005 + i * 0.4);

      particle.y = i * 15;
    });
  }
}
