lex array_sorter.l
yacc -d array_sorter.y
gcc lex.yy.c y.tab.c -o array_sorter