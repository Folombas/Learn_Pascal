program Variables;

var
  age: Integer;
  height: Real;
  name: string[50];
  isStudent: Boolean;

begin
  age := 20;
  height := 1.75;
  name := 'Алексей';
  isStudent := True;

  writeln('=== Переменные и типы данных ===');
  writeln;
  writeln('Имя: ', name);
  writeln('Возраст: ', age);
  writeln('Рост: ', height:0:2, ' м');
  writeln('Студент: ', isStudent);
  writeln;

  writeln('Размер Integer: ', SizeOf(age), ' байт');
  writeln('Размер Real: ', SizeOf(height), ' байт');
  writeln('Размер Boolean: ', SizeOf(isStudent), ' байт');
end.
