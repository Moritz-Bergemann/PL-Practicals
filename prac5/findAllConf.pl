use strict;
use warnings;
use File::Find;

# Found filenames to store
my @found;

my $root = "/";
my $ii = 0;
# find( 
#     {
#         # look through files
#         wanted => sub { 
#             if ($File::Find::name =~ /^.*\.conf$/) {
#                 push @found, $File::Find::name; 
#                 print "Uhm\n";#$ii;
#                 $ii++;
#             }
#         },
#         preprocess => {
#             return grep { ! (-d && (! -x or ! -r)) } @_; 
#         }
#     },
#     $root
# );

find( { 
    wanted => sub { 
        if ($File::Find::name =~ /^.*\.conf$/) {
            push @found, $File::Find::name; 
            print "$File::Find::name\n";
        }
    },  
    preprocess => sub {
        # print "--> Reading: $File::Find::dir\n";         
        return grep { ! (-d && (! -x or ! -r)) } @_; 
    }
}, $root); 

# Print number found
my $length = @found;
print "Done, length " + $length + "\n";

foreach (@found) {
  print "$_\n";
}

# Alternatively
# Dir.glob("#{folder}/**/*.pdf")
