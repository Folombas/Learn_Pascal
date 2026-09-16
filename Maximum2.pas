program Maximum2;

var a, b, M: integer;

begin
	writeln('Введите два целых числа');
	read(a, b);
	M := a;
	if b > a then
		M := b;
	writeln('Наибольшее число ', M);
end.
