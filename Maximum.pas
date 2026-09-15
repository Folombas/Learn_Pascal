program Maximum;

var a, b, M: integer;

begin
	writeln('Введите два целых числа');
	read(a, b);
	if a > b then
		M := a
	else
		M := b;
	writeln('Наибольшее число ', M);
end.
