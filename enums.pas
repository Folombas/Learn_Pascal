program enums;

{
  Демонстрация перечислимых типов (enumerated types) в Паскале.

  Перечислимый тип — это тип, значения которого заданы явным
  списком имён. Вместо "магических чисел" программист использует
  осмысленные идентификаторы, а компилятор проверяет, что в
  переменную попадает только одно из объявленных значений.

  Синтаксис:  type Имя = (Значение1, Значение2, ...);
}

type
	TColor = (Red, Green, Blue, Yellow, Black, White);
	TDay   = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
	TSeason = (Winter, Spring, Summer, Autumn);
	
var 
	c: TColor;
	d: TDay;
	s: TSeason;
	i: integer;
	
begin
	{ --- 1. Присваивание и вывод --- }
	c := Green;
	writeln('Color: ', c); { Free Pascal выведет 'Green' }
	
	 d := Wed;
  writeln('День: ', d);          { 'Wed' }

  s := Summer;
  writeln('Сезон: ', s);         { 'Summer' }
  writeln;
  
   { --- 2. Сравнение значений --- }
   
   if c = Green then 
   writeln('Свет зелёный - можно идти');
   
   if d = Sat then
	writeln('Сегодня суббота')
	else if d = Sun then
	 writeln('Сегодня воскресенье')
	else
		writeln('Рабочий день');
	writeln;
	
	
	 { --- 3. Порядковый номер значения (Ord) --- }
  writeln('Порядковые номера цветов:');
  for c := Red to White do
    writeln('  ', c, ' = ', Ord(c));
  writeln;
  
  { --- 4. Перебор всех значений через for --- }
  
  write('Все дни недели: ');
  for d := Mon to Sun do
	write(d, ' ');
	writeln;
	writeln;
	
	  { --- 5. Преобразование число <-> перечисление --- }
  i := Ord(Summer);
  writeln('Summer имеет номер ', i);      { 2 }
  
  
	 s := TSeason(i);                          { обратно из числа в тип }
  writeln('TSeason(', i, ') = ', s);        { 'Summer' }
  writeln;
  
    { --- 6. Что компилятор НЕ позволит --- }
  { c := 5;             -- ошибка: 5 не TColor }
  { c := Purple;        -- ошибка: Purple не объявлен }
  { d := Red;           -- ошибка: Red не TDay (разные типы) }
  { if c = Red then ... -- ок, но if c = Mon — ошибка }

  writeln('Программа завершилась без нарушений типов.');
end.


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
 
