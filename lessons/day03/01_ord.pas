program OrdDemo;

var
  c: Char;

begin
  writeln('=== Функция ORD: символ -> число ===');
  writeln;

  { Пример 1: ord от литерала символа }
  writeln('ord("A") = ', ord('A'));
  writeln('ord("Z") = ', ord('Z'));
  writeln('ord("a") = ', ord('a'));
  writeln('ord("0") = ', ord('0'));
  writeln('ord(" ") = ', ord(' '));
  writeln;

  { Пример 2: ord от переменной }
  c := 'B';
  writeln('c = "', c, '" -> ord(c) = ', ord(c));
  writeln;

  { Пример 3: ord от числовых символов }
  writeln('--- Числовые символы "0" .. "9" ---');
  for c := '0' to '9' do
    writeln('  ord("', c, '") = ', ord(c));
  writeln;

  { Пример 4: ord и арифметика }
  writeln('--- Вычисления с ord ---');
  writeln('ord("A") + 1 = ', ord('A') + 1, ' (это "', chr(ord('A') + 1), '")');
  writeln('ord("z") - ord("a") = ', ord('z') - ord('a'), ' (разница регистра)');
end.
