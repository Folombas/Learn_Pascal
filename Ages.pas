program Ages;

var
  a, b, v: integer;

begin
  read(a, b, v);

  if a > b then
    if a > v then write('Антон старше всех');

  if b > a then
    if b > v then write('Борис старше всех');

  if v > a then
    if v > b then write('Виктор старше всех');

  if a = b then
    if a = v then write('Одного возраста')
end.
