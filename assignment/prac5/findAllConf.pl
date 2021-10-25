use strict;
use warnings;
use File::Find;

# Found filenames to store
my @found;

my $root = "/mnt/c/Users/morit/_MyCode/PL/assignment/prac5/test_folder";
my $ii = 0;

# Call lambda on each identified file
find( { 
    wanted => sub { 
        # If file ends in '.conf'
        if ($File::Find::name =~ /^.*\.conf$/) {
            # Add to the array
            push @found, $File::Find::name; 
        }
    },  
    preprocess => sub {
        return grep { ! (-d && (! -x or ! -r)) } @_; 
    }
}, $root); 

# Print number found
my $length = @found;
print "Done, length ${length}\n";

foreach (@found) {
  print "$_\n";
}

# Alternatively
# Dir.glob("#{folder}/**/*.pdf")