const stringDisplay = document.getElementById("string-display");
const updateStringDisplay = (s) => (stringDisplay.textContent = `"${s}"`);
updateStringDisplay(""); // set initial val

WebAssembly.instantiateStreaming(fetch("string.wasm")).then(({ instance }) => {
  const { get, set, memory, scratch } = instance.exports;
  const readString = () => {
    const ptr = get();
    const bufView = new Uint8Array(memory.buffer);
    const nullTerm = bufView.indexOf(0, ptr);
    return new TextDecoder().decode(bufView.subarray(ptr, nullTerm));
  };
  const writeString = () => {
    const str = document.getElementById("string-input").value;
    const encoded = new TextEncoder().encode(str);
    const ptr = get();
    new Uint8Array(memory.buffer).set(encoded, scratch);
    set(scratch, encoded.length);
  };

  window.setString = (str, len) => {
    writeString();
    updateStringDisplay(readString());
  };
});
