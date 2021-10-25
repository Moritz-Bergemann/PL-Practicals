# Programming Languages - Final Report
*Moritz Bergemann (19759948)*
## Introduction
To run any of the practicals, consult the Makefile. Each prac can be compiled/run using the command `make prac<num>`.
Some practicals must be run manually or in separate parts. If so, the make command for the prac will inform you of this.

## Practical 1 - Fortran
Readability was relatively strong, though I will be biased due to my previous experience with langauges like Python or Java. There are some things that were very difficult to interpret without further knowledge, such as the syntax of the 'write' statement - what does the `(*,*)` component mean?

Parts of the loop syntax also strongly impacted readability, namely the need to use statement labels. While I 

I also struggled writing strings. I at first attempted to use the elegant 'fizzbuzz' solution that constructs the string to print piece-by-piece depending on divisibility by 5 and 3, but could not find a satisfactory way to store the string in memory to the point that I simply gave up and went with the simpler 3-condition solution.

I disliked the requirement to have 7 columns of free space at the start of each line - it really only felt like a waste of space to me, though this primarily impacts the physical act of writing the language over high-level writeability or readability. Ensuring the first 7 lines are always indented  was already frustrating in the small program we needed to write, though this is probably at least in part as modern text editors weren't designed for this kind of syntactic structure. It may also affect readability, as distinguishing which line a character in could end up difficult.

### Question - How does Fortran compare to languages you have written in previously?
While fortran was obviously different to other languages I had worked with, some parallels were immediately obvious. Braces are not used for managing scope, but tracking program structure was still easy with the provided syntax - what each syntactic word (`do`, `STOP`, etc) did was intuitive for osmeone new to the language. While I think bigger differences would have started becoming obvious had I written a more complex program (such as the lack of block structure or limiting of arrays to 3 dimensions), coding fizzbuzz in Fortran was largely identical to coding it in a popular modern language.

Even though there were syntactic differences, all the fundamentals were still the same - I could still intuitively figure out most syntax and logical structure (like if statements starting with 'if' and ending with 'endif', and do-loops working similar to for-loops). There's a world of difference between the challenge of learning basic Fortran compared to writing something like assembly.

## Practical 2 - ALGOL
For this simple practical, I found ADA to be extremely readable and writeable. Even compared to Fortran, all syntax was extremely intuitive - there was is no syntax in my program the purpose of which wasn't immediately obvious (aside from maybe the double brackets in `print`), unlike Fortran's `(*,*)` and line labels. In this way, ALGOL reminded me a lot of python - its syntax was so grammatical and obvious it became self-documenting - I thought about putting in comments to describe what I was doing, but everything was immediately obvious. The syntax's consistency also helps with this - modulo looking like an operator rather than a function (see below) helps to make Fizzbuzz's logicla expressions easier to parse.

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
ADA was the most challenging traditional language to complete the weekly practical with. I think this is down to its extreme complexity compared to other language. As discussed in the lectures, ADA can be considered an engineering trade-off, and this is apparent here. Compared to Fortran or ALGOL, ADA's complexity results makes writing large applications much easier and more effective, though small applications (such as bubble-sort) become much more verbose. Bubble sort is more complicated than fizzbuzz, but even so - my ALGOL program from practical 3 was 15 lines, while my ADA program is 43 lines.

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

ADA's overall syntax was very reminiscent of Fortran, which was largely fine for readability and writeability. I liked ADA's structure for the for loop and the way it interacted with the pre-defined types. Being able to select the range of all elements in the array using almost mathematical '...' notation was very intuitive.
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
Yacc and lex was probably the most challenging practical, which I am blaming on its counterintuitive and confusing syntax combined with its completely different system of logic and purpose. The interaction between Yacc and Lex was not intuitive to me - it took me a while to understand how Lex would parse input text into a set of tokens, which could then be used within Lex, and what components of each program related to the other (such as the use of `yylval`). Many parts of the syntax, such as that tokens had to be specifically denoted in Yacc via `%token` were also very unintuitive to me (though this could have been due to my lazy reading of the documentation). 

Thankfully, I didn't encounter any reduce/reduce or other logical errors during development. I initially thought these errors would be much more insidious and difficult to detect, though I found it relatively easy to keep in mind that only a single definition could apply to any lex character set/yacc rule non-terminal character set. I can see how this would become challenging in larger programs though as chaining multiple definitions makes it harder to intuit what any matching input could look like.

Regarding Yacc specifically - I believe the fundamental BNF-like structure is extremely writeable and readable. The logic of the program can be easily followed, and the few existing operations are highly orthogonal. All the complexities added by Yacc, however, only reduce readability, writeability, and reliability. Information about data types is one example - take my below definition of `sequence`. At its most basic, I think the code is very intuitive; A `sequence` is either a number, or an existing `sequence` with a separator and number added it. However, so much is not immediately obvious. What is the type of `NUMBER`? What do the functions return, and how can this be used later? It seems to me that, especially as things get more complex, this web of data type relationships will become increasingly hard to follow as so little is immediately shown to the user.

```c
sequence: 
    NUMBER
    {
        //Build initial array using numeric value
        $$ = buildVArray($1);
    }
    |
    sequence ARRSEP NUMBER
    {
        //Append new value to array
        $$ = appendVArray($1, $3);
    }
    ;
```

The fundamentals of Lex were much more intuitive. A pattern is defined, and then a token to return is defined. Writeable and readable. Things only become complicated, as usual, when Yacc is introduced. Even though it is fundamentally C, the syntax for assigning specific values in Lex for use in Yacc was very confusing, and agin dependant on knowledge of the makeup of the separate Yacc program.
```c
yylval.intVal = atoi(yytext);
return(NUMBER);
```

### Question - If you were building a compiler, how do you think you would implment a symbol table?
For a given scope, I would implement the symbol table as a hash table. Aside from adding variables to the symbol table, the primary thing the table is used for is looking up symbol names to see if they have been defined, to perform type checking, or to determine its scope. All of these usages require searching the table for the name, which is fastest with a hash table, which I believe would be worth the minor per-variable memory overhead of the hash table.
For managing symbol tables at different scopes, I would implement a tree-like recursive data structure (something akin to the composite pattern for storign containers inside containers) to denote the symbol tables at different scopes. A new scope X inside scope Y could simply be represented by adding scope X inside scope Y, along with its symbol table. Global memory would be stored in the symbol table at the root of this tree. This approach permits simplicity and flexibilty.

## Practical 5 - Perl, Ruby, and Bash
Overall, these practicals were some of the easiest to write (barring my initial Perl approach), and I think all 3 perform the purpose being tested - writing quick functionality to automate a task - very well. The interpreted nature means the code that had to be written for each was minimal - writeability was prioritised over readability. So much of the implementations of different functionality was abstracted away for maximum convenience from the end-user's perspective. For the small scope of these practicals, all three languages perform fantastically. I think this simplicity may make it harder to write both larger programs () and more specific programs (where the specific functionality desired has not been created in an abstracted way, and the language's more limited basic features must be used instead).
#### Perl
Perl failed at simplicity and orthogonality. Basic operations are technically simple to understand, but there are too many of them. I found a thousand ways to do anything even with the pre-supplied libraries, but some are much better than others. Case in point - my perl script for finding all `.conf` files initially used `find` - it was the first result in my research, and what I assumed was the promoted solution for such a problem. However, after much troubleshooting, my solution ended up looking like this:
```perl
# Call lambda on each identified file
find( { 
    wanted => sub { 
        # If file ends in '.conf'
        if ($File::Find::name =~ /^.*\.conf$/) {
            # Add to the array
            push @found, $File::Find::name; 
        }
    },  
    preprocess => sub {
        return grep { ! (-d && (! -x or ! -r)) } @_; 
    }
}, $root); 
```
Not only is there so much syntax in these lines to make it near-impossible to find out what was going on, this was also not the best solution to the problem! I later (partially helped by Ruby) identified `Dir.glob` made the same functionality look like this:
```perl
Dir.glob("#{folder}/**/*.pdf")
```

Preservation of information was also arguably affected. I found it very challenging to understand how many basic functions were meant to be used, such as the `File::Find` function. If not for online examples, how should I have known `$File::Find::name` contained the filename I was looking for?
#### Ruby
I found Ruby much easier to work with than Perl, though this may be due the wisdom I had gained trying to understand the latter. Ruby also has a `Glob` function, so finding a solution here was easy. Like I mentioned previously, end-user related functionality has been abstracted out to the point of making common operations like this trivial.
```ruby
result = Dir.glob("#{root}/**/*.conf");
```
#### Bash
Writing in bash felt very similar to writing in Perl and Ruby, though syntax was different. Instead of functionality being abstracted out to different libraries, it is instead abstracted to different shell programs (such as `find`). I found bash to be more orthogonal than Ruby or Perl - it seemed like to one thing, there was a straightforward built-in shell program to use for this specific task - in our case `find`. Bash's error messages were terrible though - even for something as simple as variable assignment I struggled to identify what was going wrong.
```sh
find $root -name '*.conf' -type f
```

## Question - Which of these languages was hardest to write this program in, and why?
All three languages had the same problem to some extent - the difficulty of solving the problem completely depended on whether you picked the right approach out of many options. However, Perl was absolutely the worst offender for this, as I mentioned earlier - even for a simple program like this there were still a number of approaches. Therefore, I found bash to be hardest to write in. Ruby seemed to have fewer available approaches, and I found it much easier to identify a strong one (`glob`) through research. Bash had the same benefits - it was easy to identify `find` as the best solution to the problem.

## Practical 6 - Smalltalk
I found Smalltalk to be one of the simplest and most enjoyable languages to work with so far. While the syntax design initially seemed somewhat confusing and contrarian, I actually ended up finding it very intuitive due to its consistency. Everything is treated as an object, and therefore variables/literals are always the subject of a statement, with the applied functionality being passed to them (see below).
```st
"The 'printNl' functionality is passed to the string 'hello world!'"
'hello world!' printNl

"In the same way, the function to run if the expression '(x \\ 15 == 0)' is true is passed to the expression itself"
(x \\ 15 == 0)
    ifTrue: [
        'fizzbuzz' displayNl.
    ]
```
All syntax follows this same logic - while I initially found the loop syntax confusing, it made more sense once I thought of it as the iterator receiving a function to run at each iteration. 
For a small program such as this, I found Smalltalk highly readable and writeable, and think this would also scale to larger programs due to its consistency and orthogonality.

## Assignment Question - Compare smalltalk to fortran/algol fizzbuzz implementation
- Smalltalk's syntax is very different to fortran or algol 
    - Compared to fortran-ada difference, this is much stronger - fundamental syntax structure is different 
- Though smalltalk's syntax is different, it actually makes more sense to me and I think would make more sense to beginners especially
  - Strong consistency
  - High orthogonality - every piece of syntax/operator has one function with very little overlap (at least in this function)
    - Much more syntax to remember in fortran and algol (especially fortran)
      - Much less boilerplate code

### Question - How does your implementation of fizz buzz here compare with the implementations you wrote in Fortran and Algol in terms of readability and writeability?
Smalltalk's syntax is somewhat different in structure to Fortran and ALGOL - it's definitely a larger gap to both than there is between Fortran and ALGOL. The main difference is the focus on variables rather than functionality - though I think this is equally readable and writeable. In fact, in terms of most programming principles, I would consider all three languages to be similar in writeability and readability: 
- All three are highly simple - though Smalltalk is slightly more verbose, it is no harder to understand. Fortran may lose slightly in this respect due to its requirement to declare all values at the beginning, separate to their usage, and the presentation of the mathematical modulo operator as a function.
- I consider Smalltalk the msot orthogonal - besides its strage loop syntax which I don't fully understand, there is a small number of operators that must be understood for most operations. Square brackets indicate functions, and things in brackets are isolated (e.g. the boolean statements), for example.
- There is more syntax to remember in Fortran and ALGOL, especially Fortran, supporting both writeability and readability
- Other aspects, such as type checking and data types, are difficult to comment on as they didn't really become relevant in fizzbuzz.

## Practical 7 - C++


### Question - 
## Practical 8 - Prolog
### Question - 
## Practical 9 - Scheme
### Question - 