prac1: prac1/fizzbuzz
	./prac1/fizzbuzz

prac2:
	a68g prac2/fizzbuzz.a68

prac3: prac3/bubbleSort
	./bubbleSort

prac4: prac4/array_sorter
	./prac4/array_sorter

prac5:
	echo "Run either prac5-pl, prac5-rb, or prac5-sh"

prac5-pl:
	perl prac5/findAllConf.pl

prac5-rb:
	ruby prac5/findAllConf.rb

prac5-sh:
	sh ./prac5/findAllConf.sh

prac6:
	gst ./prac6/fizzbuzz.st

prac7:
	echo "TODO"

prac8:
	echo "TODO"

prac9:
	echo "Run `scheme`, then run `(load "prac9/cocktail_sort.scm")`, then run `(cocktail-sort <your list>)`"

prac1/fizzbuzz:
	f77 prac1/fizzbuzz.f -o prac1/fizzbuzz

prac3/bubbleSort: 
	gnatmake bubbleSort.adb -o prac3/bubbleSort

prac4/array_sorter:
	gcc prac4/lex.yy.c prac4/y.tab.c -o prac4/array_sorter

prac4/lex.yy.c:
	lex prac4/array_sorter.l

prac4/y.tab.c:
	yacc -d prac4/array_sorter.y

clean:
	echo "TODO"