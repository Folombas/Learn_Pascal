program CaseConverter;

{$mode delphi}

{ Перевод строки в верхний и нижний регистр
  без использования UpCase / стандартных функций.
  Работаем через ord и chr: разница между 'A' и 'a' равна 32. }

var
  original: String;
  upper: String;
  lower: String;
  i: Integer;
  c: Char;
  code: Integer;

begin
  writeln('=== Перевод регистра через ord и chr ===');
  writeln;

  original := 'Hello, Pascal World! 123';
  writeln('Оригинал:   ', original);
  writeln;

  { --- В верхний регистр --- }
  upper := '';
  for i := 1 to Length(original) do
  begin
    c := original[i];
    code := ord(c);

    { Если символ в диапазоне 'a'..'z', вычитаем 32 }
    if (code >= ord('a')) and (code <= ord('z')) then
      upper := upper + chr(code - 32)
    else
      upper := upper + c;
  end;
  writeln('Верхний:    ', upper);
  writeln;

  { --- В нижний регистр --- }
  lower := '';
  for i := 1 to Length(original) do
  begin
    c := original[i];
    code := ord(c);

    { Если символ в диапазоне 'A'..'Z', прибавляем 32 }
    if (code >= ord('A')) and (code <= ord('Z')) then
      lower := lower + chr(code + 32)
    else
      lower := lower + c;
  end;
  writeln('Нижний:     ', lower);
  writeln;

  { --- Показать разницу кодов --- }
  writeln('--- Почему 32? ---');
  writeln('ord("A") = ', ord('A'), ', ord("a") = ', ord('a'),
          ', разница = ', ord('a') - ord('A'));
  writeln('ord("B") = ', ord('B'), ', ord("b") = ', ord('b'),
          ', разница = ', ord('b') - ord('B'));
end.
