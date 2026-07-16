# Free Pascal — Оффлайн-справочник

## Установлено на машине

| Компонент | Путь / Версия |
|-----------|---------------|
| FPC Compiler | `/usr/bin/fpc` — v3.2.2 |
| FPC исходники RTL | `/usr/lib/fpc/3.2.2/` |
| FPC исходники пакетов | `/usr/share/fpcsrc/3.2.2/packages/` |
| Man-страницы | `man fpc` |
| Build tools | gcc, make, cmake |

## Компиляция

```bash
# Простая компиляция
fpc program.pas

# С опциями
fpc -Mobjfpc -Sh program.pas    # Object Pascal mode + string handling
fpc -O2 program.pas              # Оптимизация
fpc -g program.pas               # Отладочная информация (для gdb)

# Через Makefile (из корня проекта)
make all         # Всё
make hello       # Только hello.pas
make day01       # Только Day 01
make clean       # Очистить
make run-hello   # Запустить hello
make run-day01   # Запустить все программы Day 01
```

## Основные типы данных

```pascal
var
  i: Integer;        // 4 байта, -2^31..2^31-1
  r: Real;           // 8 байта (double)
  c: Char;           // 1 байт
  b: Boolean;        // true/false
  s: string[50];     // строка до 50 символов
  s2: String;        // строка произвольной длины
```

## Операции

```pascal
+ - * /              // арифметика
div mod              // целочисленное деление, остаток
= <> < > <= >=       // сравнения
not and or           // логика
:=                   // присваивание
```

## Ввод/вывод

```pascal
writeln('Текст');                // вывод с переводом строки
write('Текст');                  // вывод без перевода
writeln(x:0:2);                  // число с 2 знаками после запятой
ReadLn(name);                     // ввод строки
ReadLn(age);                      // ввод числа
```

## Структуры управления

```pascal
// If/else
if condition then
  ...
else
  ...

// Case
case x of
  1: ...;
  2, 3: ...;
else
  ...;
end;

// For loop
for i := 1 to 10 do
  ...

// While loop
while condition do
  ...

// Repeat-until
repeat
  ...
until condition;
```

## Процедуры и функции

```pascal
procedure Greet(name: string);
begin
  writeln('Привет, ', name, '!');
end;

function Add(a, b: Integer): Integer;
begin
  Add := a + b;
end;

// Вызов
Greet('Мир');
result := Add(2, 3);
```

## Массивы

```pascal
var
  arr: array[1..10] of Integer;
  i: Integer;
begin
  for i := 1 to 10 do
    arr[i] := i * 2;
end;
```

## Полезные модули (в RTL)

```pascal
uses SysUtils;   // форматирование, преобразования
uses Math;       // математические функции
```

## Offline-документация

```bash
man fpc                          # man-страница компилятора
ls /usr/share/fpcsrc/3.2.2/     # исходники RTL для чтения
```

Если установлен `fp-docs-3.2.2`:
```bash
sudo apt-get install -y fp-docs-3.2.2
# После установки — HTML-документация в /usr/share/doc/fpc-docs/
```

## Отладка

```bash
fpc -g program.pas               # компиляция с отладкой
gdb ./program                    # запуск отладчика
```

## Makefile

```bash
make help    # показать все доступные команды
```
