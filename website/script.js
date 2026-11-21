// Greet based on the visitor's local time
const greeting = document.getElementById("greeting");
const hour = new Date().getHours();

if (hour < 12) greeting.textContent = "Good morning, and hello";
else if (hour < 18) greeting.textContent = "Good afternoon, and hello";
else greeting.textContent = "Good evening, and hello";

// Button interaction
const button = document.getElementById("waveBtn");
const reply = document.getElementById("reply");
let count = 0;

button.addEventListener("click", () => {
  count++;
  reply.textContent =
    count === 1
      ? "Nice to meet you! 👋"
      : `You've said hi ${count} times. Thank you!`;
});