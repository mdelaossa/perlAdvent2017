package Advent::Day1;
use strict;
use warnings FATAL => 'all';
use Advent::Day1::Puzzle1;
use Advent::Day1::Puzzle2;

sub solve {
    my $puzzle = shift;
    my $input = $ARGV[2];

    print "Solving puzzle #$puzzle\n";

    unless ($input) {
        print "Please provide the puzzle input as the third argument\n";
        exit 1;
    }

    if ($puzzle == 1) {
        return Advent::Day1::Puzzle1::solve $input
    } else {
        return Advent::Day1::Puzzle2::solve $input
    }
}

1;
