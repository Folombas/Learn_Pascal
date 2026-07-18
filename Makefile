# Free Pascal Learning Project
# Offline build system

FPC = fpc
ROOT = $(shell pwd)

.PHONY: all clean hello lessons day01 day02 day03 day04 help run-hello run-day01 run-day02 run-day03 run-day04

all: hello lessons

# --- Root project ---
hello: hello.pas
	$(FPC) $<

# --- Lessons ---
lessons: day01 day02 day03 day04

day01:
	cd $(ROOT)/lessons/day01 && $(FPC) 01_variables.pas
	cd $(ROOT)/lessons/day01 && $(FPC) 02_arithmetic.pas
	cd $(ROOT)/lessons/day01 && $(FPC) 03_input.pas

day02:
	cd $(ROOT)/lessons/day02 && $(FPC) 01_if_else.pas
	cd $(ROOT)/lessons/day02 && $(FPC) 02_case.pas
	cd $(ROOT)/lessons/day02 && $(FPC) 03_simple_calc.pas

day03:
	cd $(ROOT)/lessons/day03 && $(FPC) 01_ord.pas
	cd $(ROOT)/lessons/day03 && $(FPC) 02_chr.pas
	cd $(ROOT)/lessons/day03 && $(FPC) 03_caesar.pas

day04:
	cd $(ROOT)/lessons/day04 && $(FPC) 01_ascii_table.pas
	cd $(ROOT)/lessons/day04 && $(FPC) 02_case_converter.pas
	cd $(ROOT)/lessons/day04 && $(FPC) 03_rot13.pas
	cd $(ROOT)/lessons/day04 && $(FPC) 04_char_stats.pas

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

run-day03: day03
	@for f in 01_ord 02_chr 03_caesar; do \
		echo "--- $$f ---" && $(ROOT)/lessons/day03/$$f; \
	done

run-day04: day04
	@for f in 01_ascii_table 02_case_converter 03_rot13 04_char_stats; do \
		echo "--- $$f ---" && $(ROOT)/lessons/day04/$$f; \
	done

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
	@echo "  make day03      - Compile Day 03 lessons"
	@echo "  make run-day03  - Run all Day 03 programs"
	@echo "  make day04      - Compile Day 04 lessons"
	@echo "  make run-day04  - Run all Day 04 programs"
	@echo "  make help       - Show this help"
