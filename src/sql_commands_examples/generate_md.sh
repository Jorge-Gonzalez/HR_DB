#!/bin/bash
# Script to generate markdown files from sql scripts.
# Jorge Gonzalez (https://github.com/jorgegonzalez)

find "sql_commands/" -name "*.sql" -type f | while read -r sql_file; do

  # Run the sql script and save the query results.

  filename=$(basename -s .sql -- "$sql_file")
  results_file=markdown/"$filename".txt
  psql -h localhost -d HR1 -U admin -f "$sql_file" -o "$results_file" -F\|
    
  # Format the query results to conform to the markdown table.
  
  sed -i 's/\+/|/g' "$results_file"
  sed -i 's/^ *\(\S\)/|\1/g' "$results_file"
  sed -i 's/^|---/|--/' "$results_file"
  sed -i 's/^|\(([0-9]\+ rows\?)\)/\1/' "$results_file"
  
  # Create a markdown file and add the front matter
  
  markdown_file=markdown/"$filename".md
  sed -n '/file: '"$filename"'/,/---/p' front_matter/pages_front_matter.yaml |
    sed '1c\---' |
    sed '$a\\n' > "$markdown_file"
  
  # Merge each sql script with its results, and append them to the md file.

  awk '
    BEGIN {
      RS = "\n\n"
    }
    FNR == NR {
      a[FNR] = $0
      next
    } {
      printf "```sql\n%s\n```\n\n%s\n\n", a[FNR], $0
    }
  ' "$sql_file" "$results_file" >> "$markdown_file"

  rm "$results_file"
  
done

