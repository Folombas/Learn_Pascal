program basicCode;

uses SysUtils;

var
  c: char;
  n: integer;
  s: string;

begin
  Write('Введите символ: ');
  Readln(s);

  while (s <> '') and (s[1] = ' ') do
    Delete(s, 1, 1);

  if s = '' then
  begin
    Writeln('Символ не введён.');
    Halt;
  end;

  c := s[1];
  n := Ord(c);
  Writeln('Код символа ', c, ' = ', n);

  Writeln;

  Write('Введите код символа: ');
  Readln(s);
  n := StrToInt(s);

  c := Chr(n);
  Writeln('Символ с кодом ', n, ' = ', c);
end.

