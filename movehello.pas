program MovingHello;
uses crt;

const
    KeyLeft     = -75;
    KeyRight    = -77;
    KeyUp       = -72;
    KeyDown     = -80;
    KeyEscape   = 27;
    TheMessage  = 'Hello, World of Free Pascal';

procedure GetKey(var code: integer);
var
    c: char;
begin
    c := ReadKey;
    if c = #0 then
    begin
        c := ReadKey;
        code := -ord(c)
    end
    else
    begin
        code := ord(c)
    end
end;

procedure ShowMessage(x, y: integer; msg: string; color: byte);
begin
    TextColor(color);
    GotoXY(x, y);
    write(msg);
    GotoXY(1, 1)
end;

procedure HideMessage(x, y: integer; msg: string);
var
    len, i: integer;
begin
    len := length(msg);
    GotoXY(x, y);
    for i := 1 to len do
        write(' ');
    GotoXY(1, 1)
end;

procedure MoveMessage(var x, y: integer; msg: string; dx, dy: integer; color: byte);
begin
    HideMessage(x, y, msg);
    x := x + dx;
    y := y + dy;
    ShowMessage(x, y, msg, color)
end;

procedure ShowColorPalette;
var
    i: integer;
begin
    clrscr;
    writeln('Выберите начальный цвет текста (введите номер от 1 до 15):');
    writeln;
    for i := 1 to 15 do
    begin
        TextColor(i);
        write(i:3, ' ');
    end;
    writeln;
    writeln;
    TextColor(7);
    writeln('Ваш выбор: ');
end;

function SelectColor: byte;
var
    color: integer;
begin
    repeat
        ShowColorPalette;
        readln(color);
    until (color >= 1) and (color <= 15);
    SelectColor := color;
    clrscr
end;

var
    CurX, CurY: integer;
    c: integer;
    msgColor: byte;
begin
    clrscr;
    msgColor := SelectColor;

    CurX := (ScreenWidth - length(TheMessage)) div 2;
    CurY := ScreenHeight div 2;
    ShowMessage(CurX, CurY, TheMessage, msgColor);

    while true do
    begin
        GetKey(c);
        if c = KeyEscape then
            break
        else if c = 32 then  { пробел – сменить цвет }
        begin
            msgColor := (msgColor mod 15) + 1;  { циклически 1..15 }
            ShowMessage(CurX, CurY, TheMessage, msgColor)  { перерисовать текущее сообщение новым цветом }
        end
        else if c < 0 then  { расширенная клавиша }
        begin
            case c of
                KeyLeft:
                    MoveMessage(CurX, CurY, TheMessage, -1, 0, msgColor);
                KeyRight:
                    MoveMessage(CurX, CurY, TheMessage, 1, 0, msgColor);
                KeyUp:
                    MoveMessage(CurX, CurY, TheMessage, 0, -1, msgColor);
                KeyDown:
                    MoveMessage(CurX, CurY, TheMessage, 0, 1, msgColor)
            end
        end
        { иначе игнорируем другие обычные клавиши }
    end;
    clrscr
end.
	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
