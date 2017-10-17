SOURCES := $(shell find ../* -type f -name \*.png | grep -v --fixed-strings -e .zopfli.png -e /_site/ -e /vendor/)
ZOPFLIS = $(SOURCES:=.zopfli.png)

all: $(ZOPFLIS)

%.png.zopfli.png: %.png
	zopflipng --iterations=50 --filters=01234mepb --lossy_8bit --lossy_transparent -y $< $<.zopfli.png
