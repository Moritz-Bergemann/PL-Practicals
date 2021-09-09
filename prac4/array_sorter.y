%{
#include <stdio.h>
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

%}

%token ARROPEN ARRCLOSE ARRSEP DIGIT

%%

commands: /* empty */
    |commands command
    ;

command:
    open
    |
    close
    |
    complete
    |
    sep
    |
    digit
    ;

open:
    ARROPEN
    {
        printf(" ARROPEN! ");
    }
    ;

close:
    ARRCLOSE
    {
        printf(" ARRCLOSE! ");
    }
    ;

complete:
    ARROPEN ARRCLOSE
    {
        printf(" COMPLETE ARRAY!\n ");
    }
    ;

sep:
    ARRSEP
    {
        printf(" COMMA ");
    }
    ;

digit:
    DIGIT
    {
        printf(" DIGIT ");
    }
    ;