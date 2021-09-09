%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
\[              return ARROPEN;
\]              return ARRCLOSE;
\,              return ARRSEP;
[0-9]+          return DIGIT;
\n              /* ignore end of line */;
[ \t]+          /* ignore whitespace */;
%%