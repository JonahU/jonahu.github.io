CC = /opt/homebrew/opt/llvm/bin/clang
CFLAGS = --target=wasm32 \
		-nostdlib \
		-Wl,--no-entry \
		-Wl,--export-all \
		-Wl,--allow-undefined
WASM_DIR = wasm

all: counter.wasm string.wasm

counter.wasm: $(WASM_DIR)/counter.c
	$(CC) $(CFLAGS) $(WASM_DIR)/counter.c -o $(WASM_DIR)/counter.wasm

string.wasm: $(WASM_DIR)/string.c
	$(CC) $(CFLAGS) $(WASM_DIR)/string.c -o $(WASM_DIR)/string.wasm 

clean:
	rm -f $(WASM_DIR)/*.wasm
	