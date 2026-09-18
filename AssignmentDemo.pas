program AssignmentDemo;

var
  a, b: integer;
  isEqual: boolean;

begin
  write('Введите первое число (a): ');
  readln(a);
  write('Введите второе число (b): ');
  readln(b);

  writeln('a = ', a);
  writeln('b = ', b);

  // Присваивание результата сравнения
  isEqual := (a = b);
  writeln('a = b? ', isEqual);

  // Сравнение в условии
  if a = b then
    writeln('a и b равны')
  else
    writeln('a и b не равны');
end.
