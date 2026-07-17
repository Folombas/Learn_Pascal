program ChrDemo;

var
  n: Integer;

begin
  writeln('=== Функция CHR: число -> символ ===');
  writeln;

  { Пример 1: chr от литерала }
  writeln('chr(65)  = "', chr(65), '"');
  writeln('chr(97)  = "', chr(97), '"');
  writeln('chr(48)  = "', chr(48), '"');
  writeln('chr(32)  = "', chr(32), '"  (пробел)');
  writeln('chr(33)  = "', chr(33), '"  (!)');
  writeln;

  { Пример 2: chr от переменной }
  n := 72;
  writeln('n = ', n, ' -> chr(n) = "', chr(n), '"');
  writeln;

  { Пример 3: вывод всех заглавных букв }
  writeln('--- Заглавные буквы A .. Z ---');
  for n := ord('A') to ord('Z') do
    write(chr(n), ' ');
  writeln;
  writeln;

  { Пример 4: chr и ord как обратные функции }
  writeln('--- chr и ord: обратные функции ---');
  writeln('chr(ord("X")) = "', chr(ord('X')), '"');
  writeln('ord(chr(77))  = ', ord(chr(77)));
end.
