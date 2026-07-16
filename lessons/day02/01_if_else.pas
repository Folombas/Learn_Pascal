program IfElse;

var
  age: Integer;
  temperature: Real;
  score: Integer;

begin
  writeln('=== Условные операторы: if / then / else ===');
  writeln;

  { Пример 1: простая проверка возраста }
  age := 17;
  writeln('Возраст: ', age);

  if age >= 18 then
    writeln(' -> Вы совершеннолетний')
  else
    writeln(' -> Вы несовершеннолетний');
  writeln;

  { Пример 2: проверка температуры }
  temperature := -5.3;
  writeln('Температура: ', temperature:0:1, ' C');

  if temperature > 0 then
    writeln(' -> На улице плюс')
  else if temperature = 0 then
    writeln(' -> На улице ноль')
  else
    writeln(' -> На улице минус');
  writeln;

  { Пример 3: оценка по баллам }
  score := 75;
  writeln('Баллы: ', score);

  if score >= 90 then
    writeln(' -> Оценка: отлично')
  else if score >= 70 then
    writeln(' -> Оценка: хорошо')
  else if score >= 50 then
    writeln(' -> Оценка: удовлетворительно')
  else
    writeln(' -> Оценка: плохо');
  writeln;

  { Пример 4: составные условия (and, or, not) }
  writeln('--- Составные условия ---');
  age := 25;
  writeln('Возраст: ', age);

  if (age >= 18) and (age <= 65) then
    writeln(' -> Трудоспособный возраст')
  else
    writeln(' -> Не трудоспособный возраст');

  if (age < 12) or (age > 65) then
    writeln(' -> Есть льготы на проезд')
  else
    writeln(' -> Льгот на проезд нет');

  if not (score < 50) then
    writeln(' -> Экзамен сдан (score = ', score, ')');
end.
