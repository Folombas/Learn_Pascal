SRC_DIR := src
BIN_DIR := bin
OBJ_DIR := obj

SOURCES := $(wildcard $(SRC_DIR)/*.pas)
PROGRAMS := $(patsubst $(SRC_DIR)/%.pas,$(BIN_DIR)/%,$(SOURCES))

.PHONY: all run clean help

all: $(PROGRAMS)

$(BIN_DIR)/%: $(SRC_DIR)/%.pas
	mkdir -p $(BIN_DIR) $(OBJ_DIR)
	fpc -FE$(BIN_DIR) -FU$(OBJ_DIR) $<

run:
	@if [ -z "$(NAME)" ]; then \
		echo "Укажите имя программы: make run NAME=Maximum"; \
		exit 1; \
	fi
	@if [ ! -f "$(BIN_DIR)/$(NAME)" ]; then \
		echo "Программа $(BIN_DIR)/$(NAME) не найдена. Сначала выполните make."; \
		exit 1; \
	fi
	./$(BIN_DIR)/$(NAME)

clean:
	rm -f $(BIN_DIR)/* $(OBJ_DIR)/*

help:
	@echo "Доступные команды:"
	@echo "  make                 Собрать все программы"
	@echo "  make run NAME=Name   Собрать и запустить программу Name"
	@echo "  make clean           Удалить исполняемые и объектные файлы"
