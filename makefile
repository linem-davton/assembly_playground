
SRC_DIR = src
BUILD_DIR = build

exit_.o: $(SRC_DIR)/exit_.asm
	nasm -f elf64 $< -o $(BUILD_DIR)/exit_.o
	
exit_: exit_.o
	ld $(BUILD_DIR)/exit_.o -o $(BUILD_DIR)/exit_

.PHONY: clean
clean:
	rm -f build/*