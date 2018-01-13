#author: rodccosta
#/bin/bash
cat $2 | while read password
do
	result=$(steghide extract -sf $1 -p $password 2>&1 | grep "wrote" | wc -l )
	if [ $result == 1 ]
	then
		echo "the file password is $password"
		exit 0
	fi
done
