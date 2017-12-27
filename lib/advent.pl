#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';
use File::Basename 'dirname';
use lib dirname(__FILE__);
use v5.24;
use Module::Load;

if ($ARGV[0] eq "http") {
    load AdventWeb;
    my $port = $ARGV[1] || 8080;
    my $pid = AdventWeb->new($port)->run();#->background();
    print "Use 'kill $pid' to stop server\n";
} else {
    load Advent;
}
