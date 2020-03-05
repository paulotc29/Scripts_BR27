#!/bin/bash


#SCRIT GIT 


menu(){

echo '----------------------------------------------'
echo '                    MENU                      '
echo '----------------------------------------------'
echo 
echo "Escolha uma opção"
echo 
echo "1-Configurar um novo repositorio"
echo "2-Adicionar um novo arquivo"
echo "3-Atualizar um arquivo"
echo "4-Romover um arquivo"
echo "5-Listar aquivos disponiveis"
echo "6-Sair"
echo
echo -n "Digite a opção desejada:"
read opcao

case $opcao in

1) new_repository ;;
2) new_file ;;
3) update_file ;;
4) remove_file ;;
5) list_files ;;
6) exit ;;
*) 'Opção invalida.' ; echo; menu;;


esac 
}

## criar repositorio
new_repository(){
echo 
echo "Crie um diretorio na plataforma git, antes de continuar"
echo
echo "Digite o nome do diretorio criado no git"
read diretorio

#echo "Digite o nome da pasta a ser utilizada no computador"
#read pasta

sudo echo "#"$diretorio >> README.md
git init
git add README.md
git commit -m "first commit"

echo 
echo "Cole o link do repositorio:"
read link

git remote add origin $link
git push -f origin master

menu
}

## criar arquivo
new_file(){
echo 
echo "Digite o nome do aquivo para backup:"
read arquivo
git add $arquivo
echo 
echo "Digite uma mensagem de uptate:"
read update 
echo

git commit -m '$update'

git push -f origin master

menu
}

## atualizar aquivo
update_file(){

echo 
echo "Digite o nome do aquivo para backup:"
read arquivo
git add $arquivo
echo 
echo "Digite uma mensagem de uptate:"
read update 
echo

git commit -m '$update'

git push -f origin master

menu	
}

#remover arquivo

remove_file(){

echo 
echo "Digite o nome do aquivo ser removido:"
read arquivo
git rm -f $arquivo
echo 
echo "Digite uma mensagem de uptate:"
read update 
echo

git commit -m '$update'

git push -f origin master


menu
}


list_files(){

echo 
ls
echo

menu	
}

exit(){
if [[ exit ]]; then
echo 'Saiu do programa...'
echo
fi
}

menu
