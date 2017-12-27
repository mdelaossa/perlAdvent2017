package Advent::Solver;
use strict;
use warnings FATAL => 'all';

sub solve {
    die 'solve method must be overridden';
}

sub prepare_data {
    return $_[1];
}

1;