program qq;

var 
	a, b: integer;

begin
	write('Введите два целых числа');
	read(a, b);
	if a > b then
		begin
			writeln('Наибольшее число ',a);
			write('Наименьшее число ',b);
		end
	else
		begin
			writeln('Наибольшее число ',b);
			write('Наименьшее число ',a);
	end;
end.
