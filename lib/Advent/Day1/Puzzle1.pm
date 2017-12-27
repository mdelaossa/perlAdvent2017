package Advent::Day1::Puzzle1;
use strict;
use warnings FATAL => 'all';

sub solve {
    my $self = shift;
    my @numbers = split( //, shift );
    my @sums = ();
    for my $i ( 0 .. $#numbers ) {
        my $next = ( $i + 1 ) % @numbers;
        push @sums, $numbers[$i] if $numbers[$i] == $numbers[$next];
    }

    my $sum = 0;
    for (@sums) { $sum += $_ }

    return $sum;
}

1;
