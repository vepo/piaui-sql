SRC_FOLDER := src

REPL_SOURCES := $(shell find $(SRC_FOLDER)/repl/ -name "*.c")

OUT_FOLDER := bin

CFLAGS := -g -Wall

$(OUT_FOLDER):
	mkdir -p $(OUT_FOLDER)

piaui-repl: $(REPL_SOURCES) $(OUT_FOLDER)
	gcc $(CFLAGS) $(REPL_SOURCES) -o piaui

build: piaui-repl

rspec-install:
	apt install ruby
	gem install rspec
	gem install bundler
	bundle install --path .bundle

test: piaui-repl
	bundle exec rspec

clean:
	rm -f piaui test.db
	rm -rf $(OUT_FOLDER)
	rm -rf .bundle Gemfile.lock