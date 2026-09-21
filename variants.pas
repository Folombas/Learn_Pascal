program variants;

{
  Практическая демонстрация записей и вариантных записей.

  Задача: в одной компании есть сотрудники трёх типов оплаты:
    - почасовая (ставка * часы)
    - фиксированный оклад
    - процент от продаж

  У каждого типа — свой набор параметров. Вариантная запись
  позволяет хранить всех сотрудников в одном массиве, не заводя
  три разных типа и не тратя память на неиспользуемые поля.
}

type
  TPayKind = (pkHourly, pkSalary, pkCommission);

  TEmployee = record
    Name: string[40];
    ID:   integer;
    case Kind: TPayKind of
      pkHourly:     (Rate, Hours: real);          { ставка и часы }
      pkSalary:     (Monthly: real);              { оклад }
      pkCommission: (Base, Percent, Sales: real); { оклад + % от продаж }
  end;

  TStaff = array[1..5] of TEmployee;


{ ---- Подпрограмма: считает зарплату одного сотрудника ---- }
function PayOf(const e: TEmployee): real;
begin
  case e.Kind of
    pkHourly:
      PayOf := e.Rate * e.Hours;
    pkSalary:
      PayOf := e.Monthly;
    pkCommission:
      PayOf := e.Base + e.Sales * e.Percent / 100;
  end;
end;


{ ---- Подпрограмма: печатает подробную информацию ---- }
procedure PrintEmployee(const e: TEmployee);
begin
  write(e.ID:3, '. ', e.Name);
  case e.Kind of
    pkHourly:
      writeln('  [почасовая]  ',
              e.Rate:0:2, ' * ', e.Hours:0:1, ' ч');
    pkSalary:
      writeln('  [оклад]      ', e.Monthly:0:2);
    pkCommission:
      writeln('  [процент]    оклад ', e.Base:0:2,
              ' + ', e.Percent:0:1, '% от ', e.Sales:0:2);
  end;
end;


{ ---- Основная программа ---- }
var
  staff: TStaff;
  i: integer;
  total: real;

begin
  { --- Сотрудник 1: почасовая оплата --- }
  staff[1].Name := 'Анна Иванова';
  staff[1].ID   := 101;
  staff[1].Kind := pkHourly;
  staff[1].Rate := 500.0;
  staff[1].Hours := 160.0;

  { --- Сотрудник 2: фиксированный оклад --- }
  staff[2].Name := 'Борис Петров';
  staff[2].ID   := 102;
  staff[2].Kind := pkSalary;
  staff[2].Monthly := 70000.0;

  { --- Сотрудник 3: процент от продаж --- }
  staff[3].Name := 'Вера Сидорова';
  staff[3].ID   := 103;
  staff[3].Kind := pkCommission;
  staff[3].Base := 30000.0;
  staff[3].Percent := 5.0;
  staff[3].Sales := 800000.0;

  { --- Сотрудник 4: снова почасовая --- }
  staff[4].Name := 'Глеб Кузнецов';
  staff[4].ID   := 104;
  staff[4].Kind := pkHourly;
  staff[4].Rate := 450.0;
  staff[4].Hours := 120.0;

  { --- Сотрудник 5: снова оклад --- }
  staff[5].Name := 'Дарья Морозова';
  staff[5].ID   := 105;
  staff[5].Kind := pkSalary;
  staff[5].Monthly := 85000.0;

  { --- Печать и подсчёт --- }
  writeln('=== Сотрудники ===');
  total := 0;
  for i := 1 to 5 do
  begin
    PrintEmployee(staff[i]);
    total := total + PayOf(staff[i]);
  end;

  writeln;
  writeln('Итого фонд оплаты: ', total:0:2);
  writeln;

  { --- Демонстрация: запись целиком копируется --- }
  staff[1] := staff[2];
  writeln('После копирования staff[2] в staff[1]:');
  PrintEmployee(staff[1]);

  writeln;
  writeln('Программа завершилась.');
end.
