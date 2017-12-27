package Advent::Day2::Puzzle1;
use strict;
use warnings FATAL => 'all';

use List::Util qw(min max);

sub solve {
    my $checksum = 0;

    for (@_) {
        my @line = @{$_};
        $checksum += max(@line) - min(@line);
    }

    return $checksum;
}

1;