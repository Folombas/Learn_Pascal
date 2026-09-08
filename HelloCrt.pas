program HelloCrt;
uses crt;
const
  TheMessage = 'Hello, World Programming of Free Pascal';
var
  x, y: integer;
  color: byte;
begin
  clrscr;
  x := (ScreenWidth - length(TheMessage)) div 2;
  y := ScreenHeight div 2;

  color := 1;
  while not KeyPressed do
  begin
    TextColor(color);
    GotoXY(x, y);
    write(TheMessage);
    GotoXY(1, 1);
    delay(200);
    Inc(color);
    if color > 15 then
      color := 1;
  end;

  ReadKey;   { очистка буфера клавиш }
  clrscr
end.
