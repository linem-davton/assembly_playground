
SRC_DIR = src
BUILD_DIR = build
 

TARGETS = exit_ helloworld echo_stdin numbers 



# Defining full path of executables and intermediate object files that will be generated
# and referenced in the makefile
TARGETS_FILES := $(addprefix $(BUILD_DIR)/, $(TARGETS))

# by default will build all the executables
all: $(TARGETS_FILES)


# using linker to create executable from the object file
% : %.o
	ld 	$< 	-o $@

# assemble any .asm file in the src directory to object file using nasm
# $< is the first dependency, $@ is the target

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.asm
	nasm -f elf64 $< -o $@
	
.PHONY: clean
clean:
	rm -f $(BUILD_DIR)/*

# depends on exes, will rebuild and run them
.PHONY : run
run: $(TARGETS_FILES)
	$(foreach exe, $(TARGETS_FILES), ./$(exe);) 
# iterate over each executable and run it sequentially till completion