package Advent::Day2::Puzzle1;
use strict;
use warnings FATAL => 'all';

use List::Util qw(min max);

sub solve {
    my $self = shift;
    my $checksum = 0;

    for (@_) {
        my @line = @{$_};
        $checksum += max(@line) - min(@line);
    }

    return $checksum;
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