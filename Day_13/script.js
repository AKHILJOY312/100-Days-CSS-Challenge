document.querySelector(".profile").addEventListener("click", () => {
  document.querySelector(".detail").classList.add("active");
});

document.querySelector(".close").addEventListener("click", () => {
  document.querySelector(".detail").classList.remove("active");
});
