program AssignmentDemo;

var
  a, b: integer;
  isEqual: boolean;

begin
  // Присваивание с помощью :=
  a := 5;
  b := 10;
  
  writeln('a = ', a);
  writeln('b = ', b);
  
  // Сравнение с помощью =
  isEqual := (a = b);
  writeln('a = b? ', isEqual);
  
  // Меняем b
  b := 5;
  isEqual := (a = b);
  writeln('После изменения b: a = b? ', isEqual);
  
  // Сравнение прямо в условии
  if a = b then
    writeln('a и b равны')
  else
    writeln('a и b не равны');
end.
