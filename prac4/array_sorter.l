%{
#include <stdlib.h>
#include <stdint.h>
#include "y.tab.h"
%}
%%
\[              return ARROPEN;
\]              return ARRCLOSE;
\,              return ARRSEP;
[0-9]+          {
                    yylval = atoi(yytext);
                    return(NUMBER);
                }
\n              /* ignore end of line */;
[ \t]+          /* ignore whitespace */;
%%