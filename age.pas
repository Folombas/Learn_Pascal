program age;

{
  Считает полное число лет по дате рождения и текущей дате.

  Пользователь вводит:
    - день, месяц и год рождения
    - день, месяц и год сегодняшней даты

  Программа выводит, сколько полных лет исполнилось
  на сегодняшний день.
}

var
	bDay, bMonth, bYear: integer;	{ дата рождения }
	tDay, tMonth, tYear: integer;	{ сегодняшняя дата }
	years: integer;
	
begin
	writeln('=== Расчёт полного возраста ===');
	writeln;
	

  { --- Ввод даты рождения --- }
  writeln('Введите дату рождения:');
  write('  день:  ');  readln(bDay);
  write('  месяц: ');  readln(bMonth);
  write('  год:   ');  readln(bYear);
  writeln;

  { --- Ввод сегодняшней даты --- }
  writeln('Введите сегодняшнюю дату:');
  write('  день:  ');  readln(tDay);
  write('  месяц: ');  readln(tMonth);
  write('  год:   ');  readln(tYear);
  writeln;

  { --- Основной расчёт --- }
  { Сначала считаем разницу по годам }
  years := tYear - bYear;

  { Если день рождения в этом году ещё не наступил — вычитаем 1 }
  if (tMonth < bMonth) or ((tMonth = bMonth) and (tDay < bDay)) then
    years := years - 1;

  { --- Вывод --- }
  writeln('Дата рождения:  ', bDay, '.', bMonth, '.', bYear);
  writeln('Сегодня:        ', tDay, '.', tMonth, '.', tYear);
  writeln;
  writeln('Полных лет: ', years);
end.
	
