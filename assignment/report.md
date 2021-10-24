# Programming Languages - Final Report
*Moritz Bergemann (19759948)*
## Practical 1 - FORTRAN
Readability was relatively strong, though I will be biased due to my previous experience with langauges like Python or Java. There are some things that were very difficult to interpret without further knowledge, such as the syntax of the 'write' statement - what does the `(*,*)` component mean?

Parts of the loop syntax also strongly impacted readability, namely the need to use statement labels. While I 

I also struggled writing strings. I at first attempted to use the elegant 'fizzbuzz' solution that constructs the string to print piece-by-piece depending on divisibility by 5 and 3, but could not find a satisfactory way to store the string in memory to the point that I simply gave up and went with the simpler 3-condition solution.

I disliked the requirement to have 7 columns of free space at the start of each line - it really only felt like a waste of space to me, though this primarily impacts the physical act of writing the language over high-level writeability or readability. Ensuring the first 7 lines are always indented  was already frustrating in the small program we needed to write, though this is probably at least in part as modern text editors weren't designed for this kind of syntactic structure. It may also affect readability, as distinguishing which line a character in could end up difficult.

### Question - How does Fortran compare to languages you have written in previously?
While fortran was obviously different to other languages I had worked with, some parallels were immediately obvious. Braces are not used for managing scope, but tracking program structure was still easy with the provided syntax - what each syntactic word (`do`, `STOP`, etc) did was intuitive for osmeone new to the language. While I think bigger differences would have started becoming obvious had I written a more complex program (such as the lack of block structure or limiting of arrays to 3 dimensions), coding fizzbuzz in FORTRAN was largely identical to coding it in a popular modern language.

Even though there were syntactic differences, all the fundamentals were still the same - I could still intuitively figure out most syntax and logical structure (like if statements starting with 'if' and ending with 'endif', and do-loops working similar to for-loops). There's a world of difference between the challenge of learning basic FORTRAN compared to writing something like assembly.

## Practical 2 - ALGOL
For this simple practical, I found ADA to be extremely readable and writeable. Even compared to FORTRAN, all syntax was extremely intuitive - there was is no syntax in my program the purpose of which wasn't immediately obvious (aside from maybe the double brackets in `print`), unlike FORTRAN's `(*,*)` and line labels. In this way, ALGOL reminded me a lot of python - its syntax was so grammatical and obvious it became self-documenting - I thought about putting in comments to describe what I was doing, but everything was immediately obvious. The syntax's consistency also helps with this - modulo looking like an operator rather than a function (see below) helps to make Fizzbuzz's logicla expressions easier to parse.

```Fortran
    if (MOD(ii, 3) .EQ. 0 .AND. MOD(ii, 5) .EQ. 0) then
```
```Algol
    IF ii MOD 3 EQ 0 AND ii MOD 5 EQ 0
```
*Comparison of the same functionally equivalent line of FizzBuzz in Fortran (above) and ALGOL (below).*


Fizzbuzz's simplicity makes it hard to judge how easily mistakes can be made in ALGOL, but I found writing in it very intuitive. I think only needing semicolons on all but the last line of a block could lead to some hard-to-track errors, for example, but my program never had more than one line per block, so it was never an issue. I also think writeability would be much poorer in more complex code examples, as the limitations of ALGOL's simple design and limited feature-set begin to show.

### Question - Assume your program pauses when it prints out fizzbuzz. Draw the stack with all activation records, and both static and dynamic chains, at this point.
***TODO!!!!!!!!!***


## Practical 3 - ADA
ADA was the most challenging traditional language to complete the weekly practical with. I think this is down to its extreme complexity compared to other language. As discussed in the lectures, ADA can be considered an engineering trade-off, and this is apparent here. Compared to FORTRAN or ALGOL, ADA's complexity results makes writing large applications much easier and more effective, though small applications (such as bubble-sort) become much more verbose. Bubble sort is more complicated than fizzbuzz, but even so - my ALGOL program from practical 3 was 15 lines, while my ADA program is 43 lines.

I dislike having to declare all types used by the program at the beginning. While you could argue this would improve readability in larger programs as the entire scope of a given module can be known from the start, I found in this small program it resulted constant needless and confusing cross-checking as I tried to remember what the variables I had declared actually were.
```ada
    -- Types
    type Array_Size is range 0 .. 9;
    type Array_Values is range 0 .. 1000;
    type Array_Type is array (Array_Size) of Array_Values;

    -- Variables
    Sorted: Boolean := False;
    New_Number: Integer := 123;
    Temp: Array_Values;
    My_Array: Array_Type := (5, 3, 1, 6, 5, 53, 24, 12, 1, 0);
```

ADA was discussed in the lecture as bringing many paradigm improvements to programming languages, though few of them are relevant in bubble sort. For example, ADA supports strong labelling and orthogonal pass-types for functions - bubblesort only has a single function (in my implementation with no parameters). 

ADA's overall syntax was very reminiscent of FORTRAN, which was largely fine for readability and writeability. I liked ADA's structure for the for loop and the way it interacted with the pre-defined types. Being able to select the range of all elements in the array using almost mathematical '...' notation was very intuitive.
```ada
for jj in Array_Size'First .. Array_Size'Last - 1 loop
```

### Question - Compare your implementation of bubble sort with an implementation in C (you may have written one, if not, there are plenty on the internet you can look at). What similarities and differences are there?
I used the following C bubble sort implementation for comparison (source: https://www.geeksforgeeks.org/bubble-sort/)
```c
// C program for implementation of Bubble sort
#include <stdio.h>
 
void swap(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}
 
// A function to implement bubble sort
void bubbleSort(int arr[], int n)
{
   int i, j;
   for (i = 0; i < n-1; i++)     
 
       // Last i elements are already in place  
       for (j = 0; j < n-i-1; j++)
           if (arr[j] > arr[j+1])
              swap(&arr[j], &arr[j+1]);
}
```
The parallels between implementations in both languages are immediately apparent. In terms of overall structure the two are almost identical (barring different strategies to perform bubblesort) except for the use of different symbols for some syntax (e.g. ADA's `()` for array access vs C's `[]`). It would almost be possible to transpile from language to the other by swapping individual pieces of syntax. If looking at older versions of C, both even require declaration of variables at the start!
When using good indentation practises, I would say ADA is more readable than C in terms of basic syntax, especially for someone unfamiliar with either language (the point of `if` & `end` if is a lot clearer than `if {` and `}`, for instance). The main difference is Ada's requirement to declare types at the start, which I think is needlessly overcomplicated for a program of this scope, harming simplicity as there are more concepts that must be understood to perform/understand the task.

## Practical 4 - Yacc and Lex
Yacc and lex was probably the most challenging practical, which I am blaming on its counterintuitive and confusing syntax.
### Question - 
## Practical 5 - Perl, Rubokf nejofqin eFQfqoe [ fqqe FU eQefqQeqwy, and Bash
### Question - 
## Practical 6 - Smalltalk
### Question - 
## Practical 7 - C++
### Question - 
## Practical 8 - Prolog
### Question - 
## Practical 9 - Scheme
### Question - 