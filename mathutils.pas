unit mathutils;

{
  Демонстрационный модуль с математическими утилитами.

  Структура модуля:
    interface    — то, что видно снаружи (имена, типы, подписи)
    implementation — тела подпрограмм (скрыты от пользователя)

  Пользователь модуля видит только interface и не знает,
  КАК реализованы функции. Это и есть инкапсуляция.
}

interface

{ --- Публичные константы --- }
const
  PI_APPROX = 3.14159265358979;

{ --- Публичные типы --- }
type
  TPoint = record
    X, Y: real;
  end;

{ --- Публичные функции --- }
function Square(x: real): real;
function Cube(x: real): real;
function IsEven(n: integer): boolean;
function Gcd(a, b: integer): integer;
function Distance(const p1, p2: TPoint): real;
function CircleArea(r: real): real;

{ --- Публичная процедура --- }
procedure PrintPoint(const p: TPoint);

implementation

{ --- Реализация: скрыта от пользователя --- }

function Square(x: real): real;
begin
  Square := x * x;
end;

function Cube(x: real): real;
begin
  Cube := x * x * x;
end;

function IsEven(n: integer): boolean;
begin
  IsEven := (n mod 2 = 0);
end;

function Gcd(a, b: integer): integer;
var
  t: integer;
begin
  a := Abs(a);
  b := Abs(b);
  while b <> 0 do
  begin
    t := b;
    b := a mod b;
    a := t;
  end;
  Gcd := a;
end;

function Distance(const p1, p2: TPoint): real;
begin
  Distance := Sqrt(Square(p2.X - p1.X) + Square(p2.Y - p1.Y));
end;

function CircleArea(r: real): real;
begin
  CircleArea := PI_APPROX * Square(r);
end;

procedure PrintPoint(const p: TPoint);
begin
  writeln('(', p.X:0:2, '; ', p.Y:0:2, ')');
end;

end.
