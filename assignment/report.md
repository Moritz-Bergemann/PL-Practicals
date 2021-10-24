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
For this simple practical, I found ADA to be extremely readable and writeable. Even compared to FORTRAN, all syntax was extremely intuitive - there was is no syntax in my program the purpose of which wasn't immediately obvious (aside from maybe the double brackets in `print`), unlike FORTRAN's `(*,*)` and line labels. In this way, ALGOL reminded me a lot of python - its syntax was so grammatical and obvious it became self-documenting - I thought about putting in comments to describe what I was doing, but everything was immediately obvious. The syntax's consistency also helps with this - modulo looking like an operator rather than a function (see below) helps to make Fizzbuzz's logicla expressions easier to parse.

```Fortran
    if (MOD(ii, 3) .EQ. 0 .AND. MOD(ii, 5) .EQ. 0) then
```
```Algol
    IF ii MOD 3 EQ 0 AND ii MOD 5 EQ 0
```
*Comparison of the same functionally equivalent line of FizzBuzz in Fortran (above) and ALGOL (below).*


Fizzbuzz's simplicity makes it hard to judge how easily mistakes can be made in ALGOL, but I found writing in it very intuitive. I think only needing semicolons on all but the last line of a block could lead to some hard-to-track errors, for example, but my program never had more than one line per block, so it was never an issue. I also think writeability would be much poorer in more complex code examples, as the limitations of ALGOL's simple design and limited feature-set begin to show.

## 

## Practical 3 - ADA
## Practical 4 - Yacc and Lex
## Practical 5 - Perl, Ruby, and Bash
## Practical 6 - Smalltalk
## Practical 7 - C++
## Practical 8 - Prolog
## Practical 9 - Scheme