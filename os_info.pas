{$mode objfpc}{$H+}
program os_info;

// Демонстрация определения операционной системы в Паскале.
//
// Два подхода:
//   1) на этапе компиляции — условные директивы компилятора;
//   2) во время выполнения — TOSVersion из модуля SysUtils.
//
// Внимание: НЕ пишите {$IFDEF} внутри { } комментариев — FPC
// воспринимает такие фрагменты как реальные директивы.

uses
  SysUtils;

function CompiledForOS: string;
begin
  {$IFDEF WINDOWS}
    CompiledForOS := 'Windows';
  {$ELSE}
    {$IFDEF LINUX}
      CompiledForOS := 'Linux';
    {$ELSE}
      {$IFDEF DARWIN}
        CompiledForOS := 'macOS (Darwin)';
      {$ELSE}
        {$IFDEF FREEBSD}
          CompiledForOS := 'FreeBSD';
        {$ELSE}
          CompiledForOS := 'другая ОС';
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  {$IFDEF UNIX}
    CompiledForOS := CompiledForOS + ' (Unix-семейство)';
  {$ENDIF}
end;

function CompiledBitness: string;
begin
  {$IFDEF CPU64}
    CompiledBitness := '64 бита';
  {$ELSE}
    CompiledBitness := '32 бита';
  {$ENDIF}
end;

procedure PrintRuntimeOS;
begin
  writeln('  Name:      ', TOSVersion.Name);
  writeln('  Full:      ', TOSVersion.ToString);
  writeln('  Major:     ', TOSVersion.Major);
  writeln('  Minor:     ', TOSVersion.Minor);
  writeln('  Revision:  ', TOSVersion.Revision);
  writeln('  Build:     ', TOSVersion.Build);
  writeln('  Bitness:   ', TOSVersion.Bitness);
end;

begin
  writeln('=== 1. Информация, встроенная при компиляции ===');
  writeln('  ОС:         ', CompiledForOS);
  writeln('  Разряд:     ', CompiledBitness);
  writeln('  FPC:        ', {$I %FPCVERSION%});
  writeln('  Target CPU: ', {$I %FPCTARGETCPU%});
  writeln('  Target OS:  ', {$I %FPCTARGETOS%});
  writeln;

  writeln('=== 2. Информация, полученная при запуске ===');
  PrintRuntimeOS;
  writeln;

  writeln('=== 3. Пользователь и каталоги ===');
  writeln('  USER:  ', GetEnvironmentVariable('USER'));
  writeln('  HOME:  ', GetEnvironmentVariable('HOME'));
  writeln('  PWD:   ', GetCurrentDir);

  writeln;
  writeln('Программа завершилась.');
end.
