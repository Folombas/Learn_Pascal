# Рабочий процесс: написание и запуск программ на Free Pascal

Учебный репозиторий с плоской структурой — все `.pas` файлы лежат в корне.
Git отслеживает только исходники, артефакты компиляции игнорируются.

---

## 1. Перейти в репозиторий

    cd ~/projects/Pascal/Learn_Pascal

## 2. Создать новый файл с программой

    nano hello.pas

Минимальный шаблон программы:

    program hello;

    begin
      writeln('Привет, Паскаль!');
    end.

Сохранить в nano: `Ctrl+O`, затем `Enter`. Выйти: `Ctrl+X`.

## 3. Скомпилировать

    fpc hello.pas

Появится исполняемый файл `hello` (без расширения),
а также артефакты `hello.o` и `hello.ppu` — они игнорируются Git.

## 4. Запустить

    ./hello

## 5. Закоммитить исходник

    git add hello.pas
    git commit -m "hello.pas"
    git push

---

## Полный цикл

    cd ~/projects/Pascal/Learn_Pascal
    nano hello.pas
    fpc hello.pas
    ./hello
    git add hello.pas
    git commit -m "hello.pas"
    git push

---

## Что коммитим, а что нет

| Файл               | В Git? | Почему                                |
|--------------------|--------|---------------------------------------|
| `hello.pas`        | да     | Исходник                              |
| `hello` (бинарник) | нет    | Создаётся компилятором                |
| `hello.o`          | нет    | Объектный файл FPC                    |
| `hello.ppu`        | нет    | Скомпилированный модуль FPC           |
| `.gitignore`       | да     | Настройки репозитория                 |
| `WORKFLOW.md`      | да     | Эта инструкция                        |

---

## Псевдоним для ускорения (опционально)

Добавить в `~/.bashrc`:

    alias prun='fpc $1.pas && ./$1'

Затем `source ~/.bashrc`, и вместо трёх команд:

    prun hello

---

## Полезные команды Git

    git status
    git log --oneline
    git diff
    git pull

---

## Горячие клавиши nano

| Клавиши  | Действие        |
|----------|-----------------|
| Ctrl+O   | сохранить       |
| Ctrl+X   | выйти           |
| Ctrl+K   | вырезать строку |
| Ctrl+U   | вставить        |
| Ctrl+W   | поиск           |

