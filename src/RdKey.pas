program RdKey;
uses crt;

procedure GetKey(var code: integer);
var
  c: char;
begin
  c := ReadKey;
  if c = #0 then
  begin
    c := ReadKey;
    code := -ord(c)   { расширенный код – отрицательный }
  end
  else
    code := ord(c)
end;

var
  code: integer;
begin
  repeat
    GetKey(code);
    if code < 0 then
      writeln('Extended: ', -code)   { выводим скан-код без минуса }
    else
      if (code >= 32) and (code <= 126) then
        writeln(code, ' (', chr(code), ')')
      else
        writeln(code, ' (?)')
  until code = ord(' ')   { выход по пробелу }
end.
