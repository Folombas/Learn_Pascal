program nested_text;

{
  Практическая демонстрация вложенных процедур и функций.

  Задача: проанализировать строку текста и посчитать:
    - количество букв
    - количество цифр
    - количество пробелов
    - количество прочих символов

  Внешняя процедура Analyze принимает строку, а вся работа
  разбита на три вложенные процедуры. Каждая вложенная видит
  строку s и счётчики внешней — не нужно передавать их параметрами.
}

{ ============================================================
  Внешняя процедура: анализ строки
  ============================================================ }
procedure Analyze(const s: string);
var
  { Локальные переменные внешней процедуры — видны вложенным }
  letters, digits, spaces, others: integer;

  { --- Вложенная процедура 1: классификация одного символа --- }
  procedure ClassifyChar(c: char);
  begin
    if c in ['A'..'Z', 'a'..'z', 'А'..'Я', 'а'..'я'] then
      Inc(letters)
    else if c in ['0'..'9'] then
      Inc(digits)
    else if c = ' ' then
      Inc(spaces)
    else
      Inc(others);
  end;

  { --- Вложенная процедура 2: проход по всей строке --- }
  procedure ScanString;
  var
    i: integer;
  begin
    for i := 1 to Length(s) do
      ClassifyChar(s[i]);   { вложенная вызывает вложенную }
  end;

  { --- Вложенная процедура 3: печать отчёта --- }
  procedure PrintReport;
  begin
    writeln('Строка: "', s, '"');
    writeln('  букв:    ', letters);
    writeln('  цифр:    ', digits);
    writeln('  пробелов:', spaces);
    writeln('  прочих:  ', others);
    writeln('  всего:   ', Length(s));
  end;

{ --- Тело внешней процедуры --- }
begin
  letters := 0;
  digits  := 0;
  spaces  := 0;
  others  := 0;

  ScanString;     { проходим и классифицируем }
  PrintReport;    { печатаем результат }
end;


{ ============================================================
  Внешняя функция: количество слов в строке
  ============================================================ }
function WordCount(const s: string): integer;
var
  inWord: boolean;

  { Вложенная процедура: обрабатывает один символ }
  procedure Step(c: char);
  begin
    if c = ' ' then
      inWord := false
    else if not inWord then
    begin
      inWord := true;
      Inc(Result);      { Result виден вложенной — это результат WordCount }
    end;
  end;

var
  i: integer;
begin
  Result := 0;
  inWord := false;
  for i := 1 to Length(s) do
    Step(s[i]);
end;


{ ============================================================
  Основная программа
  ============================================================ }
var
  test1, test2, test3: string;

begin
  test1 := 'Hello, world! 2026';
  test2 := 'Pascal is great';
  test3 := '   ';

  writeln('=== 1. Анализ символов ===');
  Analyze(test1);
  writeln;
  Analyze(test2);
  writeln;
  Analyze(test3);
  writeln;

  writeln('=== 2. Подсчёт слов ===');
  writeln('WordCount("', test1, '") = ', WordCount(test1));
  writeln('WordCount("', test2, '") = ', WordCount(test2));
  writeln('WordCount("', test3, '") = ', WordCount(test3));
  writeln;

  writeln('Программа завершилась.');
end.
