program PascalUniqueness;
{$mode objfpc}{$H+}
{ Демонстрация уникальных возможностей Free Pascal,
  отличающих его от современных промышленных языков }

uses crt, sysutils;

type
  { 1. Множества — родной тип языка Pascal }
  TDigit = 0..9;
  TDigitSet = set of TDigit;

  { 2. Перечисления — с ord/succ/pred и сравнением }
  TDay = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);

  { 3. Поддиапазоны — контроль выхода за границы }
  TMonth = 1..12;

  { 4. Вариантная запись — union с тегом }
  TValueKind = (vkInt, vkReal, vkStr);
  TValue = record
    case Kind: TValueKind of
      vkInt:  (i: longint);
      vkReal: (r: real);
      vkStr:  (s: string[20]);
  end;

  { 5. Битовая упаковка — то, что в C делают вручную }
  TBitFlags = bitpacked record
    flag1: 0..1;
    flag2: 0..3;
    flag3: 0..15;
  end;

var
  counter: integer;

{ 1. Множества: +, *, -, in, <= }
procedure SetDemo;
var
  s1, s2: TDigitSet;
  d: TDigit;
begin
  s1 := [1, 3, 5, 7, 9];
  s2 := [2, 3, 5, 7];
  writeln('  s1 = [1,3,5,7,9], s2 = [2,3,5,7]');
  write('  s1 + s2 = ');
  for d := 0 to 9 do if d in (s1 + s2) then write(d, ' ');
  writeln;
  write('  s1 * s2 = ');
  for d := 0 to 9 do if d in (s1 * s2) then write(d, ' ');
  writeln;
  write('  s1 - s2 = ');
  for d := 0 to 9 do if d in (s1 - s2) then write(d, ' ');
  writeln;
  writeln('  7 in s1      = ', 7 in s1);
  writeln('  [3,5] <= s1  = ', [3, 5] <= s1)
end;

{ 2. Case по диапазонам — уникальная фича }
procedure CaseDemo(x: integer);
begin
  case x of
    1..9:     writeln('  ', x, ' — однозначное');
    10..99:   writeln('  ', x, ' — двузначное');
    100..999: writeln('  ', x, ' — трёхзначное');
  else
    writeln('  ', x, ' — слишком большое')
  end
end;

{ 3. Вложенные процедуры с доступом к внешним переменным }
procedure Outer;
var
  x: integer;
  procedure Inner;
  begin
    inc(x);
    inc(counter)
  end;
begin
  x := 10;
  Inner; Inner; Inner;
  writeln('  x после трёх вызовов Inner = ', x)
end;

{ 4. Absolute — наложение разных типов на одну память }
procedure AbsoluteDemo;
var
  value: longint;
  bytes: array[0..3] of byte absolute value;
  i: integer;
begin
  value := $01020304;
  writeln('  value = $', IntToHex(value, 8));
  write('  байты по порядку: ');
  for i := 0 to 3 do
    write(IntToHex(bytes[i], 2), ' ');
  writeln
end;

{ 5. Перечисления: ord, succ, pred, сравнение }
procedure EnumDemo;
var
  d: TDay;
begin
  write('  Дни недели: ');
  for d := Mon to Sun do
    write(d, ' ');
  writeln;
  writeln('  ord(Wed)    = ', ord(Wed));
  writeln('  succ(Fri)   = ', succ(Fri));
  writeln('  pred(Sun)   = ', pred(Sun));
  if Wed < Fri then
    writeln('  Wed < Fri — перечисления сравнимы!')
end;

{ 6. Поддиапазоны — контроль диапазона }
procedure SubrangeDemo;
var
  m: TMonth;
begin
  m := 6;
  writeln('  Месяц = ', m, ' (тип TMonth = 1..12)');
  writeln('  m := 13 вызовет Range Check Error при {$R+}')
end;

{ 7. Variant record — union с тегом }
procedure VariantDemo;
var
  v: TValue;
begin
  v.Kind := vkInt;
  v.i := 42;
  writeln('  Kind=vkInt,  i = ', v.i);

  v.Kind := vkReal;
  v.r := 3.14;
  writeln('  Kind=vkReal, r = ', v.r:0:2);

  v.Kind := vkStr;
  v.s := 'Привет, Pascal!';
  writeln('  Kind=vkStr,  s = ', v.s)
end;

{ 8. Битовая упаковка }
procedure BitpackDemo;
var
  flags: TBitFlags;
begin
  flags.flag1 := 1;
  flags.flag2 := 3;
  flags.flag3 := 15;
  writeln('  sizeof(TBitFlags) = ', sizeof(TBitFlags), ' байт (всего 1 байт!)');
  writeln('  flag1=1, flag2=3, flag3=15 — всё упаковано в один байт')
end;

{ ===== Основная программа ===== }
begin
  clrscr;
  writeln('=== УНИКАЛЬНЫЕ ЧЕРТЫ FREE PASCAL ===');
  writeln('(которых нет или почти нет в C, Java, Python, Go)');
  writeln;

  writeln('1. Встроенные множества (set of 0..9):');
  SetDemo;
  writeln;

  writeln('2. Case по диапазонам (1..9, 10..99):');
  CaseDemo(5);
  CaseDemo(42);
  CaseDemo(777);
  writeln;

  writeln('3. Вложенные процедуры (статические замыкания):');
  counter := 0;
  Outer;
  writeln('  глобальный counter = ', counter);
  writeln;

  writeln('4. Absolute — наложение типов на память:');
  AbsoluteDemo;
  writeln;

  writeln('5. Перечисления с ord/succ/pred/сравнением:');
  EnumDemo;
  writeln;

  writeln('6. Поддиапазоны (subrange):');
  SubrangeDemo;
  writeln;

  writeln('7. Variant record — union с тегом:');
  VariantDemo;
  writeln;

  writeln('8. Битовая упаковка (bitpacked record):');
  BitpackDemo;
  writeln;

  writeln('=== Нажмите Enter для выхода ===');
  readln
end.
