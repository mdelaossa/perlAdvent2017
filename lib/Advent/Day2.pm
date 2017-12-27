package Advent::Day2;
use strict;
use warnings FATAL => 'all';
use Advent::Day2::Puzzle1;
use Advent::Day2::Puzzle2;

sub solve {
    my $puzzle = shift;

    print "Solving puzzle #$puzzle\n";

    print "Please provide each row in a new line. Send an empty line or EOD when done\n";
    my @lines;
    my $continue = 1;
    while ($continue) {
        my $line = <STDIN>;
        unless ($line) {
            $continue = 0;
            last;
        }
        chomp $line;
        my @line = split( /\W+/, $line );
        push @lines, \@line if @line > 0;
        $continue = 0 if $line eq "";
    }

    if ($puzzle == 1) {
        return Advent::Day2::Puzzle1::solve @lines
    } else {
        return Advent::Day2::Puzzle2::solve @lines
    }
}

1;