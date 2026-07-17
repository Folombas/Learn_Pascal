program CaesarCipher;

{ Шифр Цезаря: сдвиг каждого символа на shift позиций вперёд.
  Использует ord для получения числового значения символа
  и chr для обратного преобразования. }

var
  shift: Integer;
  i: Integer;
  c: Char;
  text: String;

begin
  writeln('=== Практика: Шифр Цезаря ===');
  writeln;

  { Пример 1: зашифровка одной строки }
  shift := 3;
  text := 'HELLO WORLD';
  write('Оригинал:  ', text);
  writeln;
  write('Сдвиг +', shift, ':   ');

  for i := 1 to Length(text) do
  begin
    c := text[i];

    if (c >= 'A') and (c <= 'Z') then
      write(chr(ord('A') + (ord(c) - ord('A') + shift) mod 26))
    else
      write(c);
  end;
  writeln;
  writeln;

  { Пример 2: дешифровка (обратный сдвиг) }
  shift := 3;
  text := 'KHOOR ZRUOG';
  write('Зашифровано: ', text);
  writeln;
  write('Сдвиг -', shift, ':   ');

  for i := 1 to Length(text) do
  begin
    c := text[i];

    if (c >= 'A') and (c <= 'Z') then
      write(chr(ord('A') + (ord(c) - ord('A') - shift + 26) mod 26))
    else
      write(c);
  end;
  writeln;
  writeln;

  { Пример 3: сдвиг строчных букв }
  shift := 5;
  text := 'pascal is fun';
  write('Оригинал:  ', text);
  writeln;
  write('Сдвиг +', shift, ':   ');

  for i := 1 to Length(text) do
  begin
    c := text[i];

    if (c >= 'a') and (c <= 'z') then
      write(chr(ord('a') + (ord(c) - ord('a') + shift) mod 26))
    else
      write(c);
  end;
  writeln;
end.
