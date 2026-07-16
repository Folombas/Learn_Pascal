program CaseStatement;

var
  dayOfWeek: Integer;
  month: Integer;
  grade: Char;

begin
  writeln('=== Оператор case ===');
  writeln;

  { Пример 1: день недели по номеру }
  dayOfWeek := 3;
  writeln('Номер дня: ', dayOfWeek);

  case dayOfWeek of
    1: writeln(' -> Понедельник');
    2: writeln(' -> Вторник');
    3: writeln(' -> Среда');
    4: writeln(' -> Четверг');
    5: writeln(' -> Пятница');
    6: writeln(' -> Суббота');
    7: writeln(' -> Воскресенье');
  else
    writeln(' -> Неверный номер дня');
  end;
  writeln;

  { Пример 2: количество дней в месяце }
  month := 2;
  writeln('Месяц: ', month);

  case month of
    1, 3, 5, 7, 8, 10, 12:
      writeln(' -> 31 день');
    4, 6, 9, 11:
      writeln(' -> 30 дней');
    2:
      writeln(' -> 28 или 29 дней');
  else
    writeln(' -> Неверный номер месяца');
  end;
  writeln;

  { Пример 3: символы }
  grade := 'B';
  writeln('Оценка: ', grade);

  case grade of
    'A': writeln(' -> Отлично (5)');
    'B': writeln(' -> Хорошо (4)');
    'C': writeln(' -> Удовлетворительно (3)');
    'D': writeln(' -> Плохо (2)');
    'F': writeln(' -> Не сдано (1)');
  else
    writeln(' -> Неизвестная оценка');
  end;
end.
