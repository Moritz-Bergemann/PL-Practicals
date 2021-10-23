# Programming Languages - Final Report
*Moritz Bergemann (19759948)*
## Practical 1 - FORTRAN
### Reflection
Readability was relatively strong, though I will be biased due to my previous experience with langauges like Python or Java. There are some things that were very difficult to interpret without further knowledge, such as the syntax of the 'write' statement - what does the `(*,*)` component mean?

Parts of the loop syntax also strongly impacted readability, namely the need to use statement labels. While I 

I also struggled writing strings. I at first attempted to use the elegant 'fizzbuzz' solution that constructs the string to print piece-by-piece depending on divisibility by 5 and 3, but could not find a satisfactory way to store the string in memory to the point that I simply gave up and went with the simpler 3-condition solution.

I disliked the requirement to have 7 columns of free space at the start of each line - it really only felt like a waste of space to me, though this primarily impacts the physical act of writing the language over high-level writeability or readability. Ensuring the first 7 lines are always indented  was already frustrating in the small program we needed to write, though this is probably at least in part as modern text editors weren't designed for this kind of syntactic structure. It may also affect readability, as distinguishing which line a character in could end up difficult.

### Question - How does Fortran compare to languages you have written in previously?
While fortran was obviously different to other languages I had worked with, some parallels were immediately obvious. Braces are not used for managing scope, but tracking program structure was still easy with the provided syntax - what each syntactic word (`do`, `STOP`, etc) did was intuitive for osmeone new to the language. While I think bigger differences would have started becoming obvious had I written a more complex program (such as the lack of block structure or limiting of arrays to 3 dimensions), coding fizzbuzz in FORTRAN was largely identical to coding it in a popular modern language.

Even though there were syntactic differences, all the fundamentals were still the same - I could still intuitively figure out most syntax and logical structure (like if statements starting with 'if' and ending with 'endif', and do-loops working similar to for-loops). There's a world of difference between the challenge of learning basic FORTRAN compared to writing something like assembly.

## Practical 2 - ALGOL

## Practical 3 - ADA
## Practical 4 - Yacc and Lex
## Practical 5 - Perl, Ruby, and Bash
## Practical 6 - Smalltalk
## Practical 7 - C++
## Practical 8 - Prolog
## Practical 9 - Scheme