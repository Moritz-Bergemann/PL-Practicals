## To Compile
``sh
gnatmake bubbleSort.adb; ./bubbleSort
``

## Reflection
- Declaring all variables at the beginning is something I disliked (as I do in older versions of C). I think it makes much more sense to declare variables as they become relevant, otherwise there can be a large disconnect between declaration and usage that can be confusing.
    - The ability to initialise variables at the time of declaration was helpful, but I can see how it would become confusing as one must constantly look back to the top of the function to find the initial value
- Being required to declare data types at the top of the function was a completely foreign concept
    - To me this again seems needlessly counterintuitive for broad applications (e.g. iterating through an array by iterating through a that must be equal to the array size)
        - This could also just have been my misuse of the programming principle 
    - I do see the value for some applications though (having a specific type for all the values that an ID value can take on for example, which may be a subset of int, is very intutiive)
    - I would say reduces readability 
- I know ADA supports good labelling but not apparent in small program such as this

## Weekly Question - Bubblesort in C vs in ADA
- Used: https://www.geeksforgeeks.org/bubble-sort/
- The parallels between both language's implementations are immediately apparent
    - In overall structure the two are almost identical except for the use of different symbols for some syntax
        - E.g. ADA's '()' for array access vs C's '[]'
            - ADA's 
    - You could almost transpile the entire function by swapping symbols
    - When using good indentation practises, I would say ADA is more readable than C in terms of basic syntax, especially for someone unfamiliar with the langauge (if & end if are a lot clearer than if { and })
- If looking at older versions of C, both even require declaration of variables at the start
- Main difference is Ada's requirement to declare types at the start, which I think is needlessly overcomplicated for a program of this scope, which harms simplicity (more concepts that need to be understood)