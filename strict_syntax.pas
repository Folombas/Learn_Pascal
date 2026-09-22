program strict_syntax

{
  Демонстрация читаемого и строгого синтаксиса Паскаля.

  В Паскале программа имеет ЖЁСТКУЮ структуру:
    program <имя>;      — заголовок программы
    uses  ...;          — подключаемые модули
    const ...;          — константы
    type  ...;          — типы
    var   ...;          — переменные
    <подпрограммы>;     — процедуры и функции
    begin ... end.      — тело программы

  Каждый раздел обязателен по смыслу, а не по прихоти компилятора:
  он документирует намерения программиста и делает код
  самодокументированным. Именно поэтому Паскаль десятилетиями
  изучают в школах и вузах.
}

{ ============================================================
  Раздел const: именованные константы вместо «магических чисел»
  ============================================================ }
  
const
	MAX_STUDENTS = 5;
	PASS_SCORE = 60;
	TITLE		= '=== Ведомость студентов ===';
	

{ ============================================================
  Раздел type: собственные типы — код говорит сам за себя
  ============================================================ }
  
type	
	TScore = 0..100;	{ поддиапозон: оценка от 0 до 100 }
	TGrade = (Excellent, Good,		{ перечисление: буквенные оценки }
				Satisfactory, Fail); 
				
TStudent = record		{ запись: имя + балл }
	Name: string[30];
	Score: TScore;
end;

{ ============================================================
  Раздел var: все переменные объявлены заранее
  ============================================================ }
  
var
	students: array[1..MAX_STUDENTS] of TStudent;
	i: integer;
	passed, failed: integer;
	

{ ============================================================
  Подпрограмма: перевод балла в оценку
  ============================================================ }
function GradeOf(score: TScore): TGrade;
begin
  if score >= 90 then
    GradeOf := Excellent
  else if score >= 75 then
    GradeOf := Good
  else if score >= PASS_SCORE then
    GradeOf := Satisfactory
  else
    GradeOf := Fail;
end;


{ ============================================================
  Подпрограмма: печать оценки по-русски
  ============================================================ }
function GradeName(g: TGrade): string;
begin
  case g of
    Excellent:    GradeName := 'отлично';
    Good:         GradeName := 'хорошо';
    Satisfactory: GradeName := 'удовлетворительно';
    Fail:         GradeName := 'неудовлетворительно';
  end;
end;


{ ============================================================
  Тело основной программы
  ============================================================ }
begin
  { --- Заполнение массива студентов --- }
  students[1].Name := 'Анна';     students[1].Score := 95;
  students[2].Name := 'Борис';    students[2].Score := 82;
  students[3].Name := 'Вера';     students[3].Score := 67;
  students[4].Name := 'Глеб';     students[4].Score := 45;
  students[5].Name := 'Дарья';    students[5].Score := 100;

  { --- Печать ведомости --- }
  writeln(TITLE);
  writeln;

  passed := 0;
  failed := 0;

  for i := 1 to MAX_STUDENTS do
  begin
    write(i, '. ', students[i].Name:10);
    write('  балл: ', students[i].Score:3);
    write('  оценка: ', GradeName(GradeOf(students[i].Score)));

    if students[i].Score >= PASS_SCORE then
    begin
      writeln('  [зачёт]');
      Inc(passed);
    end
    else
    begin
      writeln('  [незачёт]');
      Inc(failed);
    end;
  end;

  { --- Итоги --- }
  writeln;
  writeln('Сдали:     ', passed);
  writeln('Не сдали:  ', failed);
  writeln('Всего:     ', MAX_STUDENTS);

  writeln;
  writeln('Программа завершилась.');
end.


























