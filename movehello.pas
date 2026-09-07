program MovingHello;
uses crt;

const
    KeyLeft     = -75;
    KeyRight    = -77;
    KeyUp       = -72;
    KeyDown     = -80;
    TheMessage  = 'Hello, World of Free Pascal';

var
    Scale: integer = 1;   { текущий масштаб текста }

{ Функция возвращает строку с дублированием каждого символа scale раз }
function ScaleMessage(msg: string; scale: integer): string;
var
    i, j: integer;
    res: string;
begin
    res := '';
    for i := 1 to length(msg) do
        for j := 1 to scale do
            res := res + msg[i];
    ScaleMessage := res
end;

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
var
    scaled: string;
begin
    scaled := ScaleMessage(msg, Scale);
    TextColor(color);
    GotoXY(x, y);
    write(scaled);
    GotoXY(1, 1)
end;

procedure HideMessage(x, y: integer; msg: string);
var
    len, i: integer;
    scaled: string;
begin
    scaled := ScaleMessage(msg, Scale);
    len := length(scaled);
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
    writeln('Выберите цвет текста (введите номер от 1 до 15):');
    writeln;
    for i := 1 to 15 do
    begin
        TextColor(i);
        write(i:3, ' ');
    end;
    writeln;
    writeln;
    TextColor(7);  { возвращаем стандартный цвет }
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

{ Центрирует сообщение, обновляя глобальные CurX и CurY }
procedure CenterMessage(var x, y: integer; msg: string);
var
    scaled: string;
begin
    scaled := ScaleMessage(msg, Scale);
    x := (ScreenWidth - length(scaled)) div 2;
    y := ScreenHeight div 2
end;

var
    CurX, CurY: integer;
    c: integer;
    msgColor: byte;
begin
    clrscr;
    msgColor := SelectColor;
    
    CenterMessage(CurX, CurY, TheMessage);
    ShowMessage(CurX, CurY, TheMessage, msgColor);
    
    while true do
    begin
        GetKey(c);
        if c > 0 then        { non-extended code; quit }
        begin
            { Если нажата '+' или '-' или 'r' – обрабатываем как специальные }
            if c = 43 then   { '+' }
            begin
                if Scale < 5 then
                begin
                    HideMessage(CurX, CurY, TheMessage);
                    Inc(Scale);
                    CenterMessage(CurX, CurY, TheMessage);
                    ShowMessage(CurX, CurY, TheMessage, msgColor)
                end
            end
            else if c = 45 then  { '-' }
            begin
                if Scale > 1 then
                begin
                    HideMessage(CurX, CurY, TheMessage);
                    Dec(Scale);
                    CenterMessage(CurX, CurY, TheMessage);
                    ShowMessage(CurX, CurY, TheMessage, msgColor)
                end
            end
            else if c = 114 then { 'r' – сброс к 1 }
            begin
                if Scale <> 1 then
                begin
                    HideMessage(CurX, CurY, TheMessage);
                    Scale := 1;
                    CenterMessage(CurX, CurY, TheMessage);
                    ShowMessage(CurX, CurY, TheMessage, msgColor)
                end
            end
            else
                break   { любая другая обычная клавиша – выход }
        end
        else
        begin
            { расширенная клавиша – стрелки }
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
    end;
    clrscr
end.
			
			
			
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
