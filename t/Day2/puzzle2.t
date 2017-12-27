#!/usr/bin/env perl -T
use strict;
use warnings;
use Test::More;
use Advent::Day2::Puzzle2;

my @input = (
    [5, 9, 2, 8],
    [9, 4, 7, 3],
    [3, 8, 6, 5]
);

my $solution = Advent::Day2::Puzzle2::solve(@input);

is $solution, 9;

done_testing();
