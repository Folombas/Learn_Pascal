program HelloCrt;
uses crt;
const
  TheMessage = 'Hello, World Programming of Free Pascal';
var
  x, y, i: integer;
  color: byte;
begin
  clrscr;
  randomize;
  color := random(15) + 1;          { случайный цвет от 1 до 15 }
  TextColor(color);

  x := (ScreenWidth - length(TheMessage)) div 2;
  y := ScreenHeight div 2;

  { Рисуем рамку вокруг сообщения }
  GotoXY(x - 2, y - 1);
  write('+');
  for i := 1 to length(TheMessage) + 2 do
    write('-');
  write('+');

  GotoXY(x - 2, y);
  write('|');
  GotoXY(x + length(TheMessage) + 1, y);
  write('|');

  GotoXY(x - 2, y + 1);
  write('+');
  for i := 1 to length(TheMessage) + 2 do
    write('-');
  write('+');

  { Выводим само сообщение }
  GotoXY(x, y);
  write(TheMessage);

  GotoXY(1, 1);
  ReadKey;          { ожидание нажатия любой клавиши }
  clrscr
end.
