program AsciiTable;

{$mode delphi}

{ Печатает таблицу ASCII-кодов от 32 до 127.
  Используем chr для преобразования кода в символ,
  чтобы наглядно увидеть, какому символу соответствует каждый код. }

var
  code: Integer;

begin
  writeln('=== Таблица ASCII (коды 32..127) ===');
  writeln;
  writeln('Код   Символ   Код   Символ   Код   Символ   Код   Символ');
  writeln('---   ------   ---   ------   ---   ------   ---   ------');

  for code := 32 to 127 do
  begin
    write(code:4, '   ', chr(code):6, '   ');
    if (code - 32) mod 4 = 3 then
      writeln;
  end;
end.
