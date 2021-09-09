%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *str)
{
    fprintf(stderr, "error: %s\n", str);
}

int yywrap()
{
    return 1;
}

main()
{
    yyparse();
}

/**
 * Builds a size-1 array to store the imported integer value
 */
int* buildArray(int firstVal)
{
    int* arr = malloc(sizeof(int));

    arr[0] = firstVal;

    return arr;
}

/**
 * Returns a new array with the given value appended to it. Frees the imported old array.
 * This is extremely inefficient, however this is C and arrays will be of 2-digit lengths 
 *  at most so it doesn't matter.
 */
int* appendArray (int* arr, int newValue) {
    int size = sizeof(arr)/sizeof(int);

    int* newArr = realloc(arr, sizeof(int) * (size + 1));

    //Make sure it didn't stack it
    assert(newArr != NULL);

    //Add new element to the end of it
    newArr[size] = newValue;

    return newArr;
}

void printArray(int* arr){
    int size = sizeof(a)/sizeof(int);
    
    printf("[ ");

    for (uint ii = 0; ii < size; ii++) 
    {
        printf("%d ", arr[ii]);
    }

    printf("]\n");
}

%}

%union {
    int intVal;
    int* arrVal;
}

%token ARROPEN ARRCLOSE ARRSEP
%token <intVal> NUMBER

%type <arrVal> sequence

%%

commands: /* empty */
    | commands command
    ;

command:
    array
    |
    sequence
    |
    num
    ;

array:
    ARROPEN sequence ARRCLOSE
    {
        printf(" complete array! ");
        printf("Array is: ");
        printArray($2);
    }
    ;

sequence: 
    NUMBER
    {
        //Build initial array
        $$ = buildArray($1);
    }
    |
    sequence ARRSEP NUMBER
    {
        //Append new value to array
        $$ = appendArray($1, $3);
    }
    ;

// num:
//     NUMBER
//     {
//         printf("Number! Value is %d", $1);

//         //Return the number
//         $$ = $1;
//     }