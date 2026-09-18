program AssignmentDemo;

var
  a, b: integer;
  choice: integer;
  isEqual: boolean;
  again: char;

begin
  writeln('========================================');
  writeln('   Демонстрация присваивания и сравнения');
  writeln('========================================');
  writeln;

  repeat
    writeln('Введите первое число (a): ');
    readln(a);
    writeln('Введите второе число (b): ');
    readln(b);
    writeln;

    writeln('--- Демонстрация оператора присваивания := ---');
    writeln('Переменной isEqual присваиваем результат сравнения a = b');
    isEqual := (a = b);
    writeln('isEqual = ', isEqual);
    writeln;

    writeln('--- Демонстрация операторов сравнения ---');
    writeln('1. a = b   -> ', a = b);
    writeln('2. a <> b  -> ', a <> b);
    writeln('3. a < b   -> ', a < b);
    writeln('4. a > b   -> ', a > b);
    writeln('5. a <= b  -> ', a <= b);
    writeln('6. a >= b  -> ', a >= b);
    writeln;

    writeln('--- Условный оператор if ---');
    if a = b then
      writeln('a и b равны')
    else if a > b then
      writeln('a больше b')
    else
      writeln('a меньше b');
    writeln;

    write('Хотите попробовать снова? (y/n): ');
    readln(again);
    writeln;
  until (again = 'n') or (again = 'N');

  writeln('Спасибо за использование программы!');
  writeln('Помните: := — это присваивание, = — это сравнение.');
end.
