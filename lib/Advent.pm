package Advent;
use strict;
use warnings FATAL => 'all';
use Module::Load;
use Try::Tiny;

# In order to let us dynamically call subs (instead of methods)
no strict 'refs';

if ( @ARGV < 2 ) {
    print "Please provide the day and puzzle number as arguments\n";
    print "Example for Day 3, puzzle 2: ./advent.pl 3 2\n";
    exit 1;
}
elsif ( $ARGV[1] > 2 ) {
    print "There are only two puzzles per day\n";
    exit 1;
}

my $day    = $ARGV[0];
my $puzzle = $ARGV[1];

try {
    print "Loading Day $day\n";
    my $module_name = "Advent::Day$day";
    load $module_name;
    my $solution = ( $module_name . "::solve" )->($puzzle);
    if ($solution) {
        print "The solution is: $solution";
    } else {
        print "Could not find a solution."
    }
}
catch {
    print "There was an error loading the solver for Day $day\n";
    print "The solver might not exist\n";
    print $_;
    exit 1;
};

1;
