%{
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <stdbool.h>
#include "varray.h"

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
varray* buildVArray(int firstVal)
{
    varray* arr = (varray*)malloc(sizeof(varray));
    arr->arr = (int*)malloc(sizeof(int));
    arr->len = 1;

    arr->arr[0] = firstVal;

    return arr;
}

/**
 * Returns a new array with the given value appended to it. Frees the imported old array.
 * This is extremely inefficient, however this is C and arrays will be of 2-digit lengths 
 *  at most so it doesn't matter.
 */
varray* appendVArray (varray* arr, int newValue) 
{
    arr->arr = (int*)realloc(arr->arr, sizeof(int) * (arr->len + 1));
    arr->len++;

    //Make sure it didn't stack basic library functionality
    assert(arr->arr != NULL);

    //Add new element to the end of it
    arr->arr[arr->len - 1] = newValue;

    return arr;
}

void printVArray(varray* arr)
{
    printf("[ ");

    for (uint ii = 0; ii < arr->len; ii++) 
    {
        printf("%d ", arr->arr[ii]);
    }

    printf("]\n");
}

void swap(int* arr, int i1, int i2)
{
    int temp = arr[i1];
    arr[i1] = arr[i2];
    arr[i2] = temp;
}

void bubbleSort(int* arr, int len)
{
    bool sorted = false;
    while (!sorted)
    {
        sorted = true;
        for (uint ii = 0; ii < len - 1; ii++)
        {
            if (arr[ii] > arr[ii + 1])
            {
                sorted = false;
                swap(arr, ii, ii+1);
            }
        }
    }
}

%}

%union {
    int intVal;
    struct varray* arrVal;
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
    ;

array:
    ARROPEN sequence ARRCLOSE
    {
        //Sort the array (sequence)
        bubbleSort($2->arr, $2->len);

        //Return it to the user
        printVArray($2);
    }
    ;

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