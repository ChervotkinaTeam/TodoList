# ToDoList 

**ToDoListApp** - это простое приложение, в котором возможно отмечать выполнение пердустановленных задач.
Задачи разделяются на простые и сложные, просроченные задачи отмечаются розовым цветом.

В проекте используются следующие шаблоны проектирования:
- Decorator
- Adapter
- DI
- CleanSwift

## Подключение SwiftLint через HomeBrew

Данный проект использует SwiftLint для того, чтобы команда писала в общем стиле. Чтобы подключить SwiftLint следуйте следующим правилам:

- в терминале напишите команду: brew install swiftlint
- Создайте новый скипт в проекте в Build Phases и перетащите его до компиляции 
- Скопируйте и вставьте следуйщий скрипт: 

- export PATH="$PATH:/opt/homebrew/bin"
if which swiftlint > /dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi

## Getting Started

```
cd ~/Developer
git clone https://github.com/some/TodoList.git
cd ./TodoList
xed .
```
## Features

- Отображение списка задач с разбиением на секции по критерию выполненности.
- Поддержка двух типов задач: обычных и важных.
- У важных задач есть 3 варианта приоритета: высокий, средний и низкий.
- Задачи сортируются по приоритету.
- Возможность менять состояние выполненности задач.
- Подсветка просроченных задач.

## Требования

- Написано на Swift 5;
- Поддерживается версия iOS 14;
- Зависимостей от сторонних библиотек нет;
- Необходим Xcode 14 или выше.
