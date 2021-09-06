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

%token ARROPEN ARRCLOSE

%%

commands: /* empty */
    |commands command
    ;

command:
    one
    |
    two
    |
    three
    ;

    one:
        ARROPEN
        {
            printf("\tARROPEN!\n");
        }
        ;

    two:
        ARRCLOSE
        {
            printf("\tARRCLOSE!\n");
        }
        ;
    
    three:
        ARROPEN ARRCLOSE
        {
            printf("\tCOMPLETE ARRAY!\n");
        }