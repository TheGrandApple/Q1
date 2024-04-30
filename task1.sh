#!/bin/bash
directory_pass()
{
	for file in "$1"/*; do # проходимся по всем элементам папки
		if [[ -f "$file" ]]; then # проверяем, является ли элемет файлом 
			filename=$(basename -- "$file") # выделяем имя файла
			if [[ -e "$2"/"$filename" ]]; then # проверяем, существует ли файл с таким именем в выходной директоиии
				co=1 
				while [[ -e "$2"/"$co-$filename" ]]; do # увеличивем индекс, пока не найдем такой, что позволит создать уникальное название
					((co++))
				done
				new_filename="$co-$filename" # сохраняем новое имя файла
			else
				new_filename="$filename" # для единообразия кода сохраняем новое имя файла, даже если его не пришлось менять
	      		 fi
                        		cp "$file" "$2/$new_filename" # копируем файл, дав ему новое название 
                		else
                        		directory_pass "$file" "$2" # если элемент - папка, то запускаем функцию рекурсивно
                		fi
        	done
}
input_dir="$1"
output_dir="$2"
directory_pass "$input_dir" "$output_dir" # запускаем рекурсивную функцию
