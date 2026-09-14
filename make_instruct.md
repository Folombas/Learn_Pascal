# Инструкция по использованию Makefile

## Описание

Этот Makefile предназначен для автоматизации компиляции Pascal-программ с использованием компилятора **FPC** (Free Pascal Compiler).

## Структура проекта

Learn_Pascal/
├── src/          # Исходные файлы Pascal (.pas)
├── bin/          # Скомпилированные исполняемые файлы
├── obj/          # Объектные файлы и временные данные компиляции
├── Makefile      # Этот файл
└── ...

## Доступные команды

### 1. `make` или `make all`

Компилирует **все** программы из директории `src/`.

```bash
make

Что происходит:

Создаются директории bin/ и obj/ (если их нет)
Все файлы *.pas из папки src/ компилируются
Исполняемые файлы сохраняются в bin/
Объектные файлы сохраняются в obj/

Пример:

bash

sasha@linux-mint:~/projects/Pascal/Learn\_Pascal\$ make
mkdir -p bin obj
fpc -FEbin -FUobj src/Maximum.pas
fpc -FEbin -FUobj src/Calculator.pas

2. make run NAME=ProgramName
Компилирует (если нужно) и запускает конкретную программу.

bash


make run NAME=Maximum
Что происходит:

Проверяется наличие исполняемого файла в bin/
Если файл не найден, выдаётся ошибка с подсказкой
Если файл существует, программа запускается

Примеры:

bash


# Запустить программу Maximum
make run NAME=Maximum

# Запустить программу Calculator
make run NAME=Calculator

Ошибки:

bash


# Если не указано имя программы
make run
# Ошибка: Укажите имя программы: make run NAME=Maximum

# Если программа не скомпилирована
make run NAME=NonExistent
# Ошибка: Программа bin/NonExistent не найдена. Сначала выполните make.

3. make clean
Удаляет все скомпилированные файлы.

bash


make clean
Что удаляется:

Все файлы из bin/ (исполняемые программы)
Все файлы из obj/ (объектные файлы)
Пример:

bash


sasha@linux-mint:~/projects/Pascal/Learn\_Pascal\$ make clean
rm -f bin/* obj/*

4. make help
Выводит справку по всем доступным командам.

bash


make help
Вывод:



Доступные команды:
  make                 Собрать все программы
  make run NAME=Name   Собрать и запустить программу Name
  make clean           Удалить исполняемые и объектные файлы
  
Примеры использования
Сценарий 1: Первый запуск проекта
bash


# Компилируем все программы
make

# Запускаем одну из них
make run NAME=Maximum
Сценарий 2: Добавили новый файл src/NewProgram.pas
bash


# Makefile автоматически найдёт новый файл и скомпилирует его
make

# Запускаем новую программу
make run NAME=NewProgram
Сценарий 3: Очистка и пересборка
bash


# Удаляем все скомпилированные файлы
make clean

# Заново компилируем всё
make
Важные моменты
⚠️ Имя программы чувствительно к регистру:

bash


make run NAME=maximum  # Работает, если файл src/maximum.pas
make run NAME=Maximum  # Ошибка, если файл src/maximum.pas
✅ Makefile автоматически:

Создаёт нужные директории
Находит все .pas файлы в src/
Компилирует только изменённые файлы (при повторном запуске make)
📝 Параметры компилятора FPC:

-FE — директория для исполняемых файлов
-FU — директория для объектных файлов
Требования
FPC (Free Pascal Compiler) установлен и доступен в PATH
make установлен
Файлы Pascal в src/ должны иметь расширение .pas
bash


# Проверить наличие FPC
fpc -v

# Проверить наличие make
make --version


