program DeclarationsDemo;

const
	// Секция констант - объявляется в самом начале
	PI = 3.14159;
	GREETING = 'Hello, Pascal!';
	MAX_SIZE = 100;
	
type
	// Секция типов - тоже до переменных
	TColor = (Red, Green, Blue);
	TPoint = record
		X, Y: integer;
	end;
	
var
  // Секция переменных — после констант и типов
  radius: real;
  area: real;
  color: TColor;
  point: TPoint;
  counter: integer;

// Локальные переменные объявляются внутри процедуры, тоже в начале
procedure ShowInfo;
var
  localVar: integer;  // локальная переменная — только для этой процедуры
begin
  localVar := 42;
  writeln('Локальная переменная localVar = ', localVar);
end;

begin
  writeln('=== Демонстрация секций объявлений в Паскале ===');
  writeln;

  // Используем константы
  writeln('Константа GREETING: ', GREETING);
  writeln('Константа PI = ', PI:0:5);
  writeln('Константа MAX_SIZE = ', MAX_SIZE);
  writeln;

  // Используем переменные
  radius := 5.0;
  area := PI * radius * radius;
  writeln('Радиус = ', radius:0:2);
  writeln('Площадь круга = ', area:0:5);
  writeln;

  // Используем тип TColor
  color := Green;
  writeln('Цвет (порядковый номер): ', ord(color));
  writeln;

  // Используем тип TPoint (record)
  point.X := 10;
  point.Y := 20;
  writeln('Точка: X = ', point.X, ', Y = ', point.Y);
  writeln;

  // Счётчик
  counter := 0;
  counter := counter + 1;
  writeln('Счётчик = ', counter);
  writeln;

  // Вызываем процедуру с локальной переменной
  ShowInfo;

  writeln;
  writeln('=== Все объявления были в начале программы ===');
  writeln('Именно поэтому Паскаль называют языком с чётким разделением');
  writeln('на декларативную и исполнительную части.');
end.
