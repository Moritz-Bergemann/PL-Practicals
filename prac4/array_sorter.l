%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
open            return ARROPEN;
close           return ARRCLOSE;
\n              /* ignore end of line */;
[ \t]+          /* ignore whitespace */;
%%