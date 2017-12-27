#!/usr/bin/env perl -T
use strict;
use warnings;
use Test::More;
use Advent::Day2::Puzzle1;

my @input = (
    [5, 1, 9, 5],
    [7, 5, 3],
    [2, 4, 6, 8]
);

my $solution = Advent::Day2::Puzzle1->solve(@input);

is $solution, 18;

done_testing();

