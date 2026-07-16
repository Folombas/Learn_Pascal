# Free Pascal Learning Project
# Offline build system

FPC = fpc
ROOT = $(shell pwd)

.PHONY: all clean hello lessons day01 day02 help run-hello run-day01 run-day02

all: hello lessons

# --- Root project ---
hello: hello.pas
	$(FPC) $<

# --- Lessons ---
lessons: day01 day02

day01:
	cd $(ROOT)/lessons/day01 && $(FPC) 01_variables.pas
	cd $(ROOT)/lessons/day01 && $(FPC) 02_arithmetic.pas
	cd $(ROOT)/lessons/day01 && $(FPC) 03_input.pas

day02:
	cd $(ROOT)/lessons/day02 && $(FPC) 01_if_else.pas
	cd $(ROOT)/lessons/day02 && $(FPC) 02_case.pas
	cd $(ROOT)/lessons/day02 && $(FPC) 03_simple_calc.pas

# --- Utils ---
clean:
	find . -name "*.o" -delete
	find . -name "*.ppu" -delete
	find . -name "*.exe" -delete
	find . -name "*.bak" -delete
	rm -f hello

run-hello: hello
	./hello

run-day01: day01
	@for f in 01_variables 02_arithmetic 03_input; do \
		echo "--- $$f ---" && $(ROOT)/lessons/day01/$$f < /dev/null; \
	done

run-day02: day02
	@for f in 01_if_else 02_case; do \
		echo "--- $$f ---" && $(ROOT)/lessons/day02/$$f < /dev/null; \
	done
	@echo "--- 03_simple_calc (ввод: 1, 5, 3) ---"
	@echo "1" | echo "5" | echo "3" | $(ROOT)/lessons/day02/03_simple_calc || true

help:
	@echo "Free Pascal Learning Project"
	@echo ""
	@echo "Targets:"
	@echo "  make all        - Compile everything"
	@echo "  make hello      - Compile hello.pas"
	@echo "  make lessons    - Compile all lessons"
	@echo "  make day01      - Compile Day 01 lessons"
	@echo "  make clean      - Remove compiled files"
	@echo "  make run-hello  - Run hello.pas"
	@echo "  make run-day01  - Run all Day 01 programs"
	@echo "  make day02      - Compile Day 02 lessons"
	@echo "  make run-day02  - Run all Day 02 programs"
	@echo "  make help       - Show this help"
