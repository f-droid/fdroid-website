.PHONY: all serve-dev build-dev build-prod

SOURCES := $(shell find ../* -type f -name \*.png | grep -v --fixed-strings -e .zopfli.png -e /_site/ -e /vendor/)
ZOPFLIS = $(SOURCES:=.zopfli.png)

all: $(ZOPFLIS)

%.png.zopfli.png: %.png
	zopflipng --iterations=50 --filters=01234mepb --lossy_8bit --lossy_transparent -y $< $<.zopfli.png

serve-dev:
	bundle exec jekyll serve --config ../_config.yml,../_config_dev.yml --source .. --destination ../_site

build-dev:
	bundle exec jekyll build --config ../_config.yml,../_config_dev.yml --source .. --destination ../_site

build-prod:
	bundle exec jekyll build --source .. --destination ../_site
