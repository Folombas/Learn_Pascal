program YesNo;

var
  a, b: integer;

begin
  writeln('Введите два числа:');
  readln(a, b);

  if (a > 50) or (b > 50) then
    writeln('YES')
  else
    writeln('NO');
end.
