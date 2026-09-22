program os_info;

{
  Демонстрация определения операционной системы в Паскале.

  Есть два принципиально разных подхода:

  1. НА ЭТАПЕ КОМПИЛЯЦИИ — через условные директивы {$IFDEF}.
     Компилятор Free Pascal сам определяет ОС и подставляет
     нужные символы. Код для Windows и Linux может отличаться
     прямо в исходнике.

  2. ВО ВРЕМЯ ВЫПОЛНЕНИЯ — через модуль SysUtils и запись
     TOSVersion. Программа в момент запуска узнаёт, на какой
     системе она работает, и печатает подробную информацию.
}

uses
  SysUtils;   { здесь живёт TOSVersion и функции для работы с ОС }

{ ============================================================
  Функция: имя ОС, определённое НА ЭТАПЕ КОМПИЛЯЦИИ.
  ============================================================ }
function CompiledForOS: string;
begin
  {$IFDEF WINDOWS}
    CompiledForOS := 'Windows';
  {$ENDIF}
  {$IFDEF LINUX}
    CompiledForOS := 'Linux';
  {$ENDIF}
  {$IFDEF DARWIN}
    CompiledForOS := 'macOS (Darwin)';
  {$ENDIF}
  {$IFDEF FREEBSD}
    CompiledForOS := 'FreeBSD';
  {$ENDIF}
  {$IFDEF ANDROID}
    CompiledForOS := 'Android';
  {$ENDIF}
  {$IFDEF UNIX}
    { этот символ определён для всех Unix-подобных систем }
    CompiledForOS := CompiledForOS + ' (Unix-семейство)';
  {$ENDIF}
  if CompiledForOS = '' then
    CompiledForOS := 'неизвестная ОС';
end;

{ ============================================================
  Функция: разрядность, определённая при компиляции.
  ============================================================ }
function CompiledBitness: string;
begin
  {$IFDEF CPU64}
    CompiledBitness := '64 бита';
  {$ELSE}
    CompiledBitness := '32 бита';
  {$ENDIF}
end;

{ ============================================================
  Процедура: печатает сведения об ОС ВО ВРЕМЯ ВЫПОЛНЕНИЯ.
  ============================================================ }
procedure PrintRuntimeOS;
begin
  writeln('Операционная система во время выполнения:');
  writeln('  Название:         ', TOSVersion.Name);
  writeln('  Версия:           ', TOSVersion.ToString);
  writeln('  Мажорная версия:  ', TOSVersion.Major);
  writeln('  Минорная версия:  ', TOSVersion.Minor);
  writeln('  Сборка:           ', TOSVersion.Build);
  writeln('  Разрядность:      ', TOSVersion.Bitness, ' бит');
  writeln;

  { --- Расшифровка кода платформы --- }
  write('  Платформа:        ');
  case TOSVersion.Platform of
    pfWindows:  writeln('Windows');
    pfLinux:    writeln('Linux');
    pfDarwin:   writeln('macOS');
    pfFreeBSD:  writeln('FreeBSD');
    pfNetBSD:   writeln('NetBSD');
    pfOpenBSD:  writeln('OpenBSD');
    pfSunOS:    writeln('Solaris (SunOS)');
    pfHaiku:    writeln('Haiku');
    pfAndroid:  writeln('Android');
    pfiOS:      writeln('iOS');
  else
    writeln('неизвестная платформа');
  end;
end;

{ ============================================================
  Основная программа.
  ============================================================ }
begin
  writeln('=== 1. Информация, встроенная при компиляции ===');
  writeln('  Компилировано для ОС: ', CompiledForOS);
  writeln('  Разрядность:          ', CompiledBitness);
  writeln('  Компилятор:           Free Pascal ',
          {$I %FPCVERSION%});
  writeln('  Целевая платформа:    ',
          {$I %FPCTARGETCPU%}, '-',
          {$I %FPCTARGETOS%});
  writeln;

  writeln('=== 2. Информация, полученная при запуске ===');
  PrintRuntimeOS;

  writeln('=== 3. Пользователь и каталоги ===');
  writeln('  Имя пользователя: ', GetEnvironmentVariable('USER'));
  writeln('  Домашний каталог: ', GetEnvironmentVariable('HOME'));
  writeln('  Текущий каталог:  ', GetCurrentDir);

  writeln;
  writeln('Программа завершилась.');
end.
