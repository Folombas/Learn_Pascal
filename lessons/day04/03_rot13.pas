program Rot13;

{$mode delphi}

{ ROT13 — шифр с фиксированным сдвигом 13.
  Особенность: применение ROT13 дважды возвращает исходный текст,
  потому что 13 + 13 = 26 (полный алфавит).
  Используем ord и chr для сдвига символов. }

var
  text: String;
  result: String;
  i: Integer;

function Rot13Char(c: Char): Char;
begin
  if (c >= 'A') and (c <= 'Z') then
    Rot13Char := chr(ord('A') + (ord(c) - ord('A') + 13) mod 26)
  else if (c >= 'a') and (c <= 'z') then
    Rot13Char := chr(ord('a') + (ord(c) - ord('a') + 13) mod 26)
  else
    Rot13Char := c;
end;

function Rot13Str(s: String): String;
var
  r: String;
  j: Integer;
begin
  r := '';
  for j := 1 to Length(s) do
    r := r + Rot13Char(s[j]);
  Rot13Str := r;
end;

begin
  writeln('=== ROT13: шифр с обратимым сдвигом ===');
  writeln;

  text := 'Hello, Pascal!';
  result := Rot13Str(text);
  writeln('Исходный:    ', text);
  writeln('ROT13:       ', result);
  writeln('ROT13 дважды:', Rot13Str(result));
  writeln;

  text := 'Free Pascal — отличный язык!';
  result := Rot13Str(text);
  writeln('Исходный:    ', text);
  writeln('ROT13:       ', result);
  writeln('ROT13 дважды:', Rot13Str(result));
  writeln;

  { Покажем сдвиг для каждой буквы }
  writeln('--- Сдвиг букв A..Z на 13 ---');
  write('Исходный: ');
  for i := ord('A') to ord('Z') do
    write(chr(i));
  writeln;
  write('ROT13:    ');
  for i := ord('A') to ord('Z') do
    write(Rot13Char(chr(i)));
  writeln;
end.
