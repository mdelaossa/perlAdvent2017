package Advent::Day1::Puzzle2;
use strict;
use warnings FATAL => 'all';

sub solve {
    my $self = shift;
    my @numbers = split( //, shift );
    my @sums = ();
    my $step = @numbers / 2;
    for my $i ( 0 .. $#numbers ) {
        my $next = ( $i + $step ) % @numbers;
        push @sums, $numbers[$i] if $numbers[$i] == $numbers[$next];
    }

    my $sum = 0;
    for (@sums) { $sum += $_ }

    return $sum;
}

1;
