#!/usr/bin/env perl -T
use strict;
use warnings;
use Test::More;
use Advent::Day1::Puzzle1;

my @cases = ( [ '1122', 3 ], [ '1111', 4 ], [ '1234', 0 ], [ '91212129', 9 ] );

for (@cases) {
    my ( $input, $expected ) = @{$_};
    print "Testing that $input returns $expected\n";

    my $solution = Advent::Day1::Puzzle1->solve($input);
    is $solution, $expected;
}

done_testing();

