## To Compile - TODO

## Reflection
- Simplicity is gone 🦀
    - There are a thousand ways to do anything even with the pre-supplied libraries, but some are much better than others
    - I presume that the same goes for orthogonality - that there's a lot of overlap for different mechanisms depending on how you want to do it
- Maybe preservation of information?
    - Take the `File::Find` function in prolog
        - Takes in multiple lambdas which was already counterintuitive
        - More importantly, how was I supposed to know that `$File::Find::name` contained the data I was looking for??
            - Also, what on earth is that variable name jesus christ, I'm sure it makes sense in context but its a nightmare to look at from an outside perspective

## Assignment - Which was hardest
- All of them were very similar to be honest
    - In that solving the problem was either very difficult or very hard depending on whether you picked the right approach
        - Using glob in Prolog and Ruby made it easy, attempting to use other methods of file iteration (which I found easily mistakable as "the" way to approach this kind of problem in the language as an unfamiliar user) produced a nightmare hellscape
- Easiest was likely bash just because finding the solution to the 
    - Bash does not have its own functionality as extensively as the other languages (at least in my experience), and therefore coming across the "right" (simplest and best suited) solution was more straightforward
- For final answer for hardest I would say Prolog, even if only because I spent the most time there trying the alternative solution before coming across glob