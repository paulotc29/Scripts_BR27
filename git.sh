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
echo "5-Romover uma pasta"
echo "6-Listar aquivos disponiveis"
echo "7-Sair"
echo
echo -n "Digite a opção desejada:"
read opcao

case $opcao in

1) new_repository ;;
2) new_file ;;
3) update_file ;;
4) remove_file ;;
5) remove_pasta ;;
6) list_files ;;
7) exit ;;
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
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!  ATENÇÃO -> O arquivo a ser removido também será excluído da pasta atual. !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
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

remove_pasta(){

echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!  ATENÇÃO -> A pasta a ser removida também será excluída da pasta atual, junto com os arquivos. !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo
 
echo "Digite o nome da pasta ser removido:"
read pasta
git rm -r $pasta
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
