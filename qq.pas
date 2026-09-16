program qq;

var 
	a, b: integer;

begin
	writeln('Введите два целых числа:');
	read(a, b);
	if a > b then
		begin
			writeln('Наибольшее число ',a);
			writeln('Наименьшее число ',b);
		end
	else
		begin
			writeln('Наибольшее число ',b);
			writeln('Наименьшее число ',a);
	end;
end.
