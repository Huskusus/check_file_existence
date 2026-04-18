#!/bin/bash

set -e

source_file="$1"

if [ -z "$source_file" ]; then
	echo "Вы ввели пустое значение"
	exit 1
fi

if [ -f "$source_file" ]; then
	echo "Файл '$source_file' существует"
	echo "Размер файла: $(stat -c %s "$source_file" 2>/dev/null || echo 'неизвестно') байт"
	echo "Время последнего изменения: $(stat -c %y "$source_file" 2>/dev/null || echo 'неизвестно')"
	exit 0 
else
	echo "Файл '$source_file' НЕ существует"
	echo "Создание файла '$source_file'..."
	touch "$source_file"
	echo "Успешно"
fi
