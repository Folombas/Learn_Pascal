program Arithmetic;

var
  a, b: Integer;
  sum, diff, product: Integer;
  quotient: Real;

begin
  a := 17;
  b := 5;

  writeln('=== Арифметические операции ===');
  writeln;
  writeln('a = ', a);
  writeln('b = ', b);
  writeln;

  sum := a + b;
  writeln(a, ' + ', b, ' = ', sum);

  diff := a - b;
  writeln(a, ' - ', b, ' = ', diff);

  product := a * b;
  writeln(a, ' * ', b, ' = ', product);

  quotient := a / b;
  writeln(a, ' / ', b, ' = ', quotient:0:2);

  writeln(a, ' div ', b, ' = ', a div b);
  writeln(a, ' mod ', b, ' = ', a mod b);
end.
