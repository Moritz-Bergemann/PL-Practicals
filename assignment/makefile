.PHONY: prac1 prac2 prac3 prac4 prac5 prac5-pl prac5-rb prac5-sh prac6 prac7 prac8 prac9 clean

prac1: prac1/fizzbuzz
	./prac1/fizzbuzz

prac2: prac2/fizzbuzz.a68
	a68g prac2/fizzbuzz.a68

prac3: prac3/bubbleSort
	./prac3/bubbleSort

prac4: prac4/array_sorter
	./prac4/array_sorter

prac5:
	echo "Run either prac5-pl, prac5-rb, or prac5-sh"

prac5-pl: prac5/findAllConf.pl
	perl prac5/findAllConf.pl

prac5-rb: prac5/findAllConf.rb
	ruby prac5/findAllConf.rb

prac5-sh: prac5/findAllConf.sh
	sh prac5/findAllConf.sh

prac6: prac6/fizzbuzz.st
	gst prac6/fizzbuzz.st

prac7: prac7/booksort
	./prac7/booksort

prac7/booksort: prac7/booksort.cpp prac7/book.cpp
	g++ -g -Wall -o prac7/booksort prac7/booksort.cpp prac7/book.cpp

prac8:
	prolog --consult-file prac8/fizzbuzz.pl --query-goal 'fizzbuzz(0)'

prac9:
	echo "Testing on random sequence (-36, 86, 23, -93, -52, -100, 91, -16, -63, -11, 62, -35, 7, 8, 13, -99, -61, -28, -76, -62, -38, 100, -41, 66)"; \
	scheme --load prac9/cocktail_sort.scm --eval "(cocktail-sort '(-36 86 23 -93 -52 -100 91 -16 -63 -11 62 -35 7 8 13 -99 -61 -28 -76 -62 -38 100 -41 66))"

prac1/fizzbuzz: prac1/fizzbuzz.f
	f77 prac1/fizzbuzz.f -o prac1/fizzbuzz

prac3/bubbleSort: prac3/bubbleSort.adb
	gnatmake prac3/bubbleSort.adb -o prac3/bubbleSort

prac4/array_sorter: prac4/lex.yy.c prac4/y.tab.c
	gcc prac4/lex.yy.c prac4/y.tab.c -o prac4/array_sorter

# CD used to avoid (possibly WSL-caused lex bug with -o)
prac4/lex.yy.c: prac4/array_sorter.l
	cd ./prac4; \
	lex array_sorter.l

prac4/y.tab.c: prac4/array_sorter.y
	yacc -d prac4/array_sorter.y -o prac4/y.tab.c

clean:
	rm -f prac1/fizzbuzz 
	rm -f prac3/bubbleSort prac3/bubbleSort.o prac3/bubbleSort.ali 
	rm -f prac4/array_sorter prac4/lex.yy.c prac4/y.tab.c prac4/y.tab.h
	rm -f prac7/booksort