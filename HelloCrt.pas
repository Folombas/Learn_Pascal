program HelloCrt;
uses crt;
const
  TheMessage = 'Hello, World Programming of Free Pascal';
var
  x, y, dx, dy, i: integer;
  color: byte;
begin
  clrscr;
  x := (ScreenWidth - length(TheMessage)) div 2;
  y := ScreenHeight div 2;
  dx := 1;
  dy := 1;
  color := 1;

  while not KeyPressed do
  begin
    { Затираем предыдущее сообщение }
    GotoXY(x, y);
    for i := 1 to length(TheMessage) do
      write(' ');

    { Обновляем координаты }
    x := x + dx;
    y := y + dy;

    { Отражение от границ по горизонтали }
    if x + length(TheMessage) > ScreenWidth then
    begin
      dx := -dx;
      x := ScreenWidth - length(TheMessage);
    end
    else if x < 1 then
    begin
      dx := -dx;
      x := 1;
    end;

    { Отражение от границ по вертикали }
    if y > ScreenHeight then
    begin
      dy := -dy;
      y := ScreenHeight;
    end
    else if y < 1 then
    begin
      dy := -dy;
      y := 1;
    end;

    { Выводим сообщение новым цветом }
    TextColor(color);
    GotoXY(x, y);
    write(TheMessage);
    GotoXY(1, 1);

    delay(200);
    color := color + 1;
    if color > 15 then color := 1;
  end;

  ReadKey;
  clrscr
end.
