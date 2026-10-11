const counterDisplay = document.getElementById("counter-display");
const updateCounterDisplay = (i) =>
  (counterDisplay.textContent = `Counter: ${i}`);
updateCounterDisplay(0);

WebAssembly.instantiateStreaming(fetch("wasm/counter.wasm")).then(({ instance }) => {
  const { increment, decrement, set } = instance.exports;
  window.resetCounter = () => updateCounterDisplay(set(0));
  window.incrementCounter = () => updateCounterDisplay(increment());
  window.decrementCounter = () => updateCounterDisplay(decrement());
});
