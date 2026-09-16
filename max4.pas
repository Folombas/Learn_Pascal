program max4;

var
 a,b,c,d,M:integer;
 
begin
	writeln('Введите четыре целых числа: ');
	read(a,b,c,d);
	M:=a;
	if b>M then
		M:=b;
	if c>M then
		M:=c;
	if d>M then
		M:=d;
	writeln('Наибольшее число: ', M);
end.
