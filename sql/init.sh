FILES=" 
	abilities.sql
	sets.sql
	races.sql
	rarities.sql
	characters.sql
	types.sql
	cards.sql
	users.sql
	collections.sql
	card2abilities.sql
"
for file in $FILES; do
	echo "[INSTALLING $file]"
	cat $file | mysql -u$1 -p$2 -Dhsdb
done

