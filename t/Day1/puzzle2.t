#!/usr/bin/env perl -T
use strict;
use warnings;
use Test::More;
use Advent::Day1::Puzzle2;

my @cases = ( [ '1212', 6 ], [ '1221', 0 ], [ '123425', 4 ], [ '123123', 12 ], ['12131415', 4] );

for (@cases) {
    my ( $input, $expected ) = @{$_};
    print "Testing that $input returns $expected\n";

    my $solution = Advent::Day1::Puzzle2->solve($input);
    is $solution, $expected;
}

done_testing();

