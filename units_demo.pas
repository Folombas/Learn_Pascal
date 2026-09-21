program units_demo;

{
  Демонстрация использования модуля mathutils.

  Программа подключает модуль через uses и получает доступ
  ко всему, что объявлено в его секции interface.
}

uses
  mathutils;   { подключаем наш модуль }

var
  a, b: TPoint;
  r: real;
  n, m: integer;

begin
  writeln('=== 1. Степени ===');
  writeln('Square(7)   = ', Square(7):0:2);
  writeln('Cube(3)     = ', Cube(3):0:2);
  writeln;

  writeln('=== 2. Чётность ===');
  writeln('IsEven(10)  = ', IsEven(10));
  writeln('IsEven(7)   = ', IsEven(7));
  writeln;

  writeln('=== 3. НОД ===');
  n := 48; m := 36;
  writeln('Gcd(', n, ', ', m, ') = ', Gcd(n, m));
  writeln('Gcd(1071, 462) = ', Gcd(1071, 462));
  writeln;

  writeln('=== 4. Работа с точками ===');
  a.X := 1.0;  a.Y := 2.0;
  b.X := 4.0;  b.Y := 6.0;
  write('Точка A: '); PrintPoint(a);
  write('Точка B: '); PrintPoint(b);
  writeln('Расстояние A->B = ', Distance(a, b):0:3);
  writeln;

  writeln('=== 5. Площадь круга ===');
  r := 5.0;
  writeln('CircleArea(', r:0:1, ') = ', CircleArea(r):0:3);
  writeln;

  writeln('Программа завершилась.');
end.
