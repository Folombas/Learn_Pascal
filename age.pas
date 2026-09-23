{$mode objfpc}{$H+}
program age;

{
  Считает полное число лет по дате рождения и текущей дате.

  Даты вводятся одной строкой в формате ДД.ММ.ГГГГ,
  например: 30.11.1987
}

uses
  SysUtils;

type
  TDate = record
    Day, Month, Year: integer;
  end;

{ --- Разбор строки вида "ДД.ММ.ГГГГ" --- }
function ParseDate(const s: string; var d: TDate): boolean;
var
  parts: TStringArray;
begin
  ParseDate := false;
  parts := s.Split(['.', '/', '-']);
  if Length(parts) <> 3 then
    Exit;
  try
    d.Day   := StrToInt(Trim(parts[0]));
    d.Month := StrToInt(Trim(parts[1]));
    d.Year  := StrToInt(Trim(parts[2]));
    ParseDate := true;
  except
    ParseDate := false;
  end;
end;

{ --- Проверка корректности даты --- }
function IsValidDate(const d: TDate): boolean;
begin
  IsValidDate := (d.Day >= 1) and (d.Day <= 31) and
                 (d.Month >= 1) and (d.Month <= 12) and
                 (d.Year >= 1900) and (d.Year <= 2100);
end;

var
  b, t: TDate;
  s: string;
  years: integer;

begin
  writeln('=== Расчёт полного возраста ===');
  writeln;

  { --- Ввод даты рождения --- }
  repeat
    write('Введите дату рождения (ДД.ММ.ГГГГ): ');
    readln(s);
    if not ParseDate(s, b) then
      writeln('  Ошибка формата. Пример: 30.11.1987');
  until ParseDate(s, b) and IsValidDate(b);
  writeln;

  { --- Ввод сегодняшней даты --- }
  repeat
    write('Введите сегодняшнюю дату (ДД.ММ.ГГГГ): ');
    readln(s);
    if not ParseDate(s, t) then
      writeln('  Ошибка формата. Пример: 23.09.2026');
  until ParseDate(s, t) and IsValidDate(t);
  writeln;

  { --- Расчёт --- }
  years := t.Year - b.Year;
  if (t.Month < b.Month) or ((t.Month = b.Month) and (t.Day < b.Day)) then
    years := years - 1;

  { --- Вывод --- }
  writeln('Дата рождения: ', b.Day, '.', b.Month, '.', b.Year);
  writeln('Сегодня:       ', t.Day, '.', t.Month, '.', t.Year);
  writeln;
  writeln('Полных лет: ', years);
end.
