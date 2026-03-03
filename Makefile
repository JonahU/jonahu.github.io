CC = /opt/homebrew/opt/llvm/bin/clang

counter.wasm: counter.c
	$(CC) --target=wasm32 \
		-nostdlib \
		-Wl,--no-entry \
		-Wl,--export=increment \
		-Wl,--export=decrement \
		-Wl,--export=set \
		-o counter.wasm \
		counter.c

clean:
	rm -f counter.wasm
	