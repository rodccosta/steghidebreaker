#author: rodccosta
#/bin/bash
len=$#
if [ $len -eq 1 ]
then
        echo -e "\033[31mDicionário não informado \033[0m"
fi
if [ $len -lt 2 ]
then
        echo -e "\033[31mNúmero de parâmetros inválido \033[0m"
        echo "Forma de uso:"
        echo "./steghidebreaker.sh nome_do_arquivo dicionario.txt"
        exit 0
fi
cat $2 | while read password
do
	result=$(steghide extract -sf $1 -p $password 2>&1 | grep "wrote" | wc -l )
	if [ $result == 1 ]
	then
		echo "the file password is $password"
		exit 0
	fi
done
