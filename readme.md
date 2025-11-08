# Para instalar flex e bison

https://www.msys2.org/

Depois de instalar, na barra de pesquisa procure por Msys e abra
No terminal, digite:

cd /c/Users/maria/OneDrive/Desktop/CompiladorObsAct

pacman -Syu
pacman -Sy
pacman -S msys/flex
pacman -S msys/bison
pacman -S mingw-w64-ucrt-x86_64-gcc
gcc --version
flex --version
bison --version

Gerando arquivo executavel ->

No terminal, em CompiladorObsAct faca os comandos:

bison -d parser.y
flex lexer.l
gcc parser.tab.c lex.yy.c -o obsact.exe

Se não der erro, será criado o arquivo obsact.exe.


flex scanner.l   -> isso atualiza o arquivo lex.yy.c, que é gerado pelas regras definidas nesse scanner

o arquivo scanner.l apenas defini os tokens da gramatica, ainda não relaciona um com o outro pra gerar as regras