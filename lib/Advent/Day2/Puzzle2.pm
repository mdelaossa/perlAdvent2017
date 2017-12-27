package Advent::Day2::Puzzle2;
use strict;
use warnings FATAL => 'all';
use parent 'Advent::Solver';

sub solve {
    my $self = shift;
    my $checksum = 0;

    for (@_) {
        my @line = @{$_};
        $checksum += _find_divisible(@line);
    }

    return $checksum;
}

sub _find_divisible {
    # The puzzle guarantees only two numbers will be divisible by each other
    my ( $first, $second ) = grep {
        my $outer = $_;
        my @sol = grep { $outer > $_ ? $outer % $_ == 0 : $_ % $outer == 0 } @_;
        @sol > 1;
    } @_;

    return $first > $second ? $first / $second : $second / $first;
}

sub prepare_data{
    my $self = shift;
    my @data;

    for my $line (split /\\n/, shift) {
        my @line = split(/\W+/, $line);
        push @data, \@line;
    }

    return @data;
}

1;
