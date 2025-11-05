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
