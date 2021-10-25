# Programming Languages - Final Report
*Moritz Bergemann (19759948)*
## Introduction
To run any of the practicals, consult the Makefile. Each prac can be compiled/run using the command `make prac<num>`.
Some practicals must be run manually or in separate parts. If so, the make command for the prac will inform you of this.

#### Note on Testing
For all fizzbuzz questions - I ran the first 100 iterations of fizzbuzz, and verified the program output matched the expected result for fizzbuzz.

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
Since there is only one function, the static and dynamic chains will simply consist of a single activation record with my function in it.
```
--------
| MAIN | 
--------
```

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

#### Testing
I tested the following arrays, and got the expected results (empty array not tested since ADA did not seem to support empty sets)
```
Input: [5 3 1 6 5 53 24 12 1 0]
Output: [0 1 1 3 5 5 6 12 24 53]

Input: [5 4 3 2 1]
Output: [1 2 3 4 5]

Input: [1 2 3 4 5]
Output: [1 2 3 4 5]

Input: [1 1]
Output: [1 1]
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

#### Testing
I performed the following testing, and got the expected results:
```
Input: [5, 3, 1, 6, 5, 53, 24, 12, 1, 0]
Output: [0, 1, 1, 3, 5, 5, 6, 12, 24, 53]

Input: [5, 4, 3, 2, 1]
Output: [1, 2, 3, 4, 5]

Input: [1, 2, 3, 4, 5]
Output: [1, 2, 3, 4, 5]

Input: [1, 1]
Output: [1, 1]
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

#### Testing
I used the folder `prac5/test_folder` for testing. Perl and ruby correctly identified the 9 .conf files, though the bash program failed to identify `test_folder/folder1/folder1A/1A.conf`, which I assume must be a feature of the `find` implementation.

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
When I first started the C++ practical, I immediately felt at home - this was the programming style that I was used to. That was until I made an off-by-one error in my quicksort implementation and one of my Book objects was promptly replaced by the letter 'a'. Where did the 'a' come from? I guess we'll never know. But I would definitely consider that a reliability problem. Pointer errors can be insidious - in my case it was obvious to spot - trying to invoke a function on the letter 'a' didn't yield the best results - but in other cases it may not be, and end up causing an error far, far down the line.

C++ completely breaks many of the programming principles covered throughout the lectures, and this slightly larger practical helps make the issues clear. Restricted aliasing is essentially non-existent - a pointer on the heap can be passed anywhere. Some issues I ran into I still don't understand. I initially attempted to use `vector`s instead of arrays as they allow for easy accessing of array size - I found, however, that whenever I modified the elements of the vector inside a function, those changes would not carry through to outside the function. I didn't find a solution to this, so I ultimately switched back to arrays. I'm usually very excited to try out new features of a programming language, but found myself sticking to my C-like approaches here, using malloc, free, and arrays wherever possible. Perhaps this is as I did not find the new features C++ introduces very intuitive. The language as a whole feels like major components have been developed as an afterthought, such as the implementation of objects as struct-like pointers to functions. Overall, I found C++'s syntax disagreeable. Writing code in C++ doesn't feel as 'safe' as it does in a language like Java or Python - it feels as if at any moment I could be destroying a low-level component of the language I have no understanding of, which to me seems the ultimate argument against reliability. I'm sure its possible to write highly reliable, safe code in C++ - it's just that doing the exact opposite by accident feels equally posible.

#### Testing
I tested the following inputs, and got the expected results:
```
Input: Book 12, Book 35, Book 456, Book 53, Book 5311, Book 1531, Book -1, Book 4242, Book 12, Book 11
Result: Book -1, Book 11, Book 12, Book 12, Book 35, Book 53, Book 456, Book 1531, Book 4242, Book 5311

Input: Book 1, Book 2, Book 3, Book 4, Book 5, Book 6, Book 7, Book 8, Book 9, Book 10
Result: Book 1, Book 2, Book 3, Book 4, Book 5, Book 6, Book 7, Book 8, Book 9, Book 10


Input: Book 10, Book 9, Book 8, Book 7, Book 6, Book 5, Book 4, Book 3, Book 2, Book 1
Result: Book 1, Book 2, Book 3, Book 4, Book 5, Book 6, Book 7, Book 8, Book 9, Book 10


Input: Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1
Result: Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1, Book 1
```

### Question - Compare how you have implmented objects in C++ with how you implement them in Java. What does this tell you about how objects work in C++?
In C++, objects are implemented very similar to structs in C. In fact, it almost seems you can see how objects are implemented as extensions to this concept. An object is a set of fields and function pointers, just as a struct in C can be. These functions are then defined later, separately to the object, almost as if the object truly only did store pointers to the function. Compare this to java, where all object code must reside within the object itself, unless it resides in another object, providing a clearer link between an object and its methods. The same goes for using objects - in C++, they are still treated as pointers to memory locations which must be dereferenced. This is of course also true in Java, and I wouldn't be surprised if the two language's implementations of objects aren't too different at the low level, though Java attempts to abstract out this parallel, while C++ makes it a core component of the language.

It's clear that C++ is 'object-supporting' while Java is 'object-oriented'. In Java, no code can exist without an object - everything is inherently bound to an object space, and all that happens consists of objects or classes interacting with each other. In C++, code can be written without objects. The world consists of procedures running operations on memory, into which objects can be inserted later if they are useful.

## Practical 8 - Prolog
Ignoring biases from my past programming experience, Prolog is the most simple and intuitive language I've used as part of this unit. Counterintuitively, I think it's also the one where I understand the details of the underlying system (propositional logic) the least, though the basic concept is extremely intuitive. Conditions chained using the 'and' (`,`) symbol will run in sequence as long as all are true, while conditions chained using the 'or' (`;`) symbol will be checked until one is true. Without needing any prior knowledge of programming, the basic concepts and the ability to follow a basic program like fizzbuzz can be explained in minutes. All other aspects of readability are supported too: operators are highly orthogonal(there is one obvious way to do a given thing) and the syntax design is simple and follows the logical predicate format closely. 

I found prolog's rules very similar to functions in other languages - one related thing can easily be abstracted out into a rule. This lead to some of the most modular code I have ever written, supporting both readability and writeability through abstraction. For example, checking whether something matches the 'fizz' condition (divisible by 3) is so intuitively split into its own rule that I essentially did it without thinking, abstracting this condition out of my other considerations. I do think prolog might not be very scaleable for traditional applications - situations where large amounts of data need to be stored or accessed might not fit very well with this syntax. However, for specific applications and for simple ones like this, Prolog excels.
```Prolog
# How easily the different conditions of fizzbuzz can be split into their own, modular rules.
is_fizz(X) :- 0 is X mod 3.
is_buzz(X) :- 0 is X mod 5.
is_fizzbuzz(X) :- is_fizz(X), is_buzz(X).
```

### Question - Was fizz buzz easier or harder to implement in Prolog? Why or why not?
I found fizzbuzz much easier to implement in prolog than in any other language we have used. Splitting up the problem into a series of rules which can then simply be run was incredibly intuitive. This could just be because fizzbuzz is especially well-suited to a language like Prolog, however - the game is essentially just a series of divisibility conditions, after all, and conditions are what Prolog was designed around.
The one issue I did have was that the program I wrote was hard-coded to run for 100 iterations. I couldn't find an easy way to import the number of iterations fizzbuzz should run into the program, since it seems the base case needs to be hard-coded. This might not be an issue for most traditional applications of prolog where base-cases are expected to be hard-coded and the interpretable nature of the program makes adjusting rules very easy, though it definitely doesn't fit the modular, 'black-box' nature of traditional languages when it comes to functions.

## Practical 9 - Scheme
Besides Yacc and Lex, Scheme was the most challenging language to work with. But while Yacc & Lex were challenging because I struggled to understand the syntax and rules of the language, Scheme was challenging because I struggled to imagine how the given algorithm was even possible in a language with these rules. How on earth do you implement bubble/cocktail sort, one of the most iterative and variable-based algorithms I can think of, in a language without variables or iteration? Pretty confusingly, as it turns out.
While I initially thought scheme was terrible for readability, writeability, and reliability, I've come around to parts of it. Recursively looping through lists is actually intuitive in most situations given a good understanding of recursion, as it allows you to easily abstract away the rest of the problem to the next iteration. Cocktail-shaker sort was actually a big exception to this though. Bubblesort was is bad enough itself, to sort the next part of the array, the first element needs to be temporarily removed and then added back on later. For Cocktail-sort, sorting also needed to be done on the way back though, leading to this beauty of a line:
```scheme
(sort-first(cons (car (sort-first list)) (cocktail-sort-run (cdr (sort-first list)))))
```
I was also horrified by the performance implications of the same recursive call (`(sort-first list)`) multiple times due to a lack of variables to store the result, though I realised that Scheme's principle of having the same function call with the same parameters always return the same result could easily counteract this through caching. I'm not sure if Scheme actually performs this, but I think more benefits to functional programming like this will reveal themselves with further use. In general having access to variables definitely felt more like a hindrance than a benefit in most scenarios, though this may largely be as I am not used to the concept.
For surface-level readability, the amount of brackets in Scheme is egregious. This also affects short-term reliability, as it's incredibily easy to forget a set of brackets somewhere and left with a difficult-to-trace error.
```scheme
; The double-bracketing in 'cond' statements is especially hard to follow
(cond
    ((sorted list)
        list
    ) 
    ((not (sorted list))
        (cocktail-sort (cocktail-sort-run list))
    ) 
)
```

#### Testing
I tested the following inputs, and got the expected results:
```
Input: (4, 1, 3, 2, 82, 4, 2, 1378, 474, 2, 2, 18, 5, 5812)
Output:

Input: (-36, 86, 23, -93, -52, -100, 91, -16, -63, -11, 62, -35, 7, 8, 13, -99, -61, -28, -76, -62, -38, 100, -41, 66)
Output:

Input: (1, 2, 3, 4, 5)
Output: (1, 2, 3, 4, 5)

Input: ()
Output: ()
```

### Question - Investigate how scheme performs file IO. Does this break regularity? Why or why not?
FileIO in scheme is done through 'ports'. A port can be opened a function call (such as `call-with-input-file`), from which further function calls will then read/write files, often one character at a time.
It can be argued that this method breaks regularity in two ways:
First, the concept of side-effects - Scheme, as a functional langauge, generally avoids having functions have any effect other than the returning of a value. Writing to a file, however, is not just returning a value, and is therefore a side-effect, breaking regularity if this is considered a regular rule.
Second, a key concept in scheme is that a function called with the same parameters will always return the same result. However, when reading from an IO port where each function call returns the next character in a file, for instance, each subsequent call will have a different result, breaking the regularity of this rule.