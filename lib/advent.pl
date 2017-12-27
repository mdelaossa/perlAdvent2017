#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';
use File::Basename 'dirname';
use lib dirname(__FILE__);
use v5.24;
use Module::Load;

if ($ARGV[0] eq "http") {
    load AdventWeb;
    AdventWeb->app->start;
} else {
    load Advent;
}
