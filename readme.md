# Para instalar flex e bison

https://www.msys2.org/

Depois de instalar, na barra de pesquisa procure por Msys e abra
No terminal, digite:

pacman -Syu
pacman -Sy
pacman -S msys/flex
pacman -S msys/bison
flex --version
bison --version


cd /c/Users/maria/OneDrive/Desktop/CompiladorObsAct


flex scanner.l   -> isso atualiza o arquivo lex.yy.c, que é gerado pelas regras definidas nesse scanner

o arquivo scanner.l apenas defini os tokens da gramatica, ainda não relaciona um com o outro pra gerar as regras