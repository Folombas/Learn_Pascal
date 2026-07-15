program Input;

var
  name: string[50];
  age: Integer;
  celsius, fahrenheit: Real;

begin
  writeln('=== Ввод данных от пользователя ===');
  writeln;

  write('Как тебя зовут? ');
  ReadLn(name);

  write('Сколько тебе лет? ');
  ReadLn(age);

  writeln;
  writeln('Привет, ', name, '! Тебе ', age, ' лет.');

  writeln;
  writeln('--- Конвертер температуры ---');
  write('Введите температуру в градусах Цельсия: ');
  ReadLn(celsius);

  fahrenheit := celsius * 9 / 5 + 32;

  writeln(celsius:0:1, ' C = ', fahrenheit:0:1, ' F');
end.
