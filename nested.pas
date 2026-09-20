program nested;

{
  Демонстрация вложенных процедур и функций в Паскале.

  В Паскале подпрограмму можно объявить внутри другой подпрограммы.
  Вложенная подпрограмма "видит" переменные и параметры внешней —
  это удобно для декомпозиции задачи и сокрытия деталей реализации:
  снаружи видна только внешняя подпрограмма, а её "кишки" спрятаны.

  Синтаксис:
    procedure Внешняя;
      procedure Вложенная;   { объявление внутри }
      begin ... end;
    begin ... Вложенная; ... end;
}

{ ============================================================
  Пример 1. Вложенная функция: сумма цифр числа
  ============================================================ }
function DigitSum(n: integer): integer;
  { Вложенная процедура: обрабатывает одну цифру }
  procedure AddDigit(d: integer);
  begin
    { Вложенная видит переменную Result внешней функции! }
    Result := Result + d;
  end;

var
  x: integer;
begin
  Result := 0;
  x := Abs(n);
  while x > 0 do
  begin
    AddDigit(x mod 10);   { вызов вложенной процедуры }
    x := x div 10;
  end;
end;


{ ============================================================
  Пример 2. Вложенная функция: проверка числа на простоту
  ============================================================ }
function IsPrime(n: integer): boolean;
  { Вложенная функция: проверяет делимость на d }
  function Divides(d: integer): boolean;
  begin
    Divides := (n mod d = 0);   { n — параметр внешней функции, виден }
  end;

var
  d: integer;
begin
  if n < 2 then
  begin
    IsPrime := false;
    Exit;
  end;
  d := 2;
  while d * d <= n do
  begin
    if Divides(d) then
    begin
      IsPrime := false;
      Exit;
    end;
    d := d + 1;
  end;
  IsPrime := true;
end;


{ ============================================================
  Пример 3. Вложенная процедура, использующая локальную переменную
  внешней процедуры (а не только параметр)
  ============================================================ }
procedure PrintTable(n: integer);
var
  { Локальная переменная внешней процедуры }
  line: integer;

  { Вложенная процедура печатает одну строку таблицы }
  procedure PrintRow(k: integer);
  begin
    { k — параметр вложенной, line — переменная внешней }
    writeln(k:3, ' x ', n:3, ' = ', (k * n):5,
            '   (строка ', line, ')');
  end;

begin
  for line := 1 to 5 do
    PrintRow(line);
end;


{ ============================================================
  Основная программа
  ============================================================ }
var
  num: integer;

begin
  writeln('=== 1. Сумма цифр числа ===');
  num := 12345;
  writeln('DigitSum(', num, ') = ', DigitSum(num));
  writeln;

  writeln('=== 2. Проверка на простоту ===');
  writeln('IsPrime(1)  = ', IsPrime(1));
  writeln('IsPrime(2)  = ', IsPrime(2));
  writeln('IsPrime(17) = ', IsPrime(17));
  writeln('IsPrime(21) = ', IsPrime(21));
  writeln('IsPrime(97) = ', IsPrime(97));
  writeln;

  writeln('=== 3. Таблица умножения на 3 ===');
  PrintTable(3);

  writeln;
  writeln('Программа завершилась.');
end.
