CC = /opt/homebrew/opt/llvm/bin/clang
CFLAGS = --target=wasm32 \
		-nostdlib \
		-Wl,--no-entry \
		-Wl,--export-all \
		-Wl,--allow-undefined

all: counter.wasm string.wasm

counter.wasm: counter.c
	$(CC) $(CFLAGS) -o counter.wasm counter.c

string.wasm: string.c
	$(CC) $(CFLAGS) -o string.wasm string.c

clean:
	rm -f counter.wasm string.wasm
	