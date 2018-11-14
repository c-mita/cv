BUILD_DIR ?= build
SUB_DIR = subs

$(BUILD_DIR)/%.pdf : $(BUILD_DIR)/%.tex
	pdflatex -output-directory $(BUILD_DIR) $(BUILD_DIR)/$*

$(BUILD_DIR)/%.tex: $(SUB_DIR)/%.sed cv.tex
	mkdir -p $(BUILD_DIR)
	sed -f $^ > $@

example.pdf: $(BUILD_DIR)/example.pdf
	cp $(BUILD_DIR)/example.pdf ./example.pdf

.PHONY: example
example: example.pdf

.PHONY: main
main: $(BUILD_DIR)/main.pdf

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
