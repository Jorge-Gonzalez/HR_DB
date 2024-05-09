for match in $(grep -oP '(?<=file: ).*' front_matter/pages_front_matter.yaml); do
  touch sql_commands/"$match".sql
done
