SRC_FOLDER := src

REPL_SOURCES := $(shell find $(SRC_FOLDER)/repl/ -name "*.c")

OUT_FOLDER := build

CFLAGS := -g -Wall

$(OUT_FOLDER):
	mkdir $(OUT_FOLDER)

repl: $(REPL_SOURCES) $(OUT_FOLDER)
	gcc $(CFLAGS) $(REPL_SOURCES) -o $(OUT_FOLDER)/piaui-repl