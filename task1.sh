#!/bin/bash
directory_pass()
{
	for file in "$1"/*; do
		if [[ -f "$file" ]]; then
			filename=$(basename -- "$file")
			if [[ -e "$2"/"$filename" ]]; then
				co=1
				while [ -e "$2"/"$co-$filename" ]; do
					((co++))
				done
				new_filename="$co-$filename"
			else
				new_filename="$filename"
	      		 fi
                        		cp "$file" "$2/$new_filename"
                		else
                        		directory_pass "$file" "$2" $co
                		fi
        	done
}
input_dir="$1"
output_dir="$2"
directory_pass "$input_dir" "$output_dir"