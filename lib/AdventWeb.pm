package AdventWeb;
use strict;
use warnings FATAL => 'all';
use Module::Load;
use HTTP::Server::Simple::CGI;
use base qw(HTTP::Server::Simple::CGI);

my %dispatch = (
    '/'      => \&resp_index,
    '/solve' => \&resp_solve
);

sub handle_request {
    my $self = shift;
    my $cgi  = shift;

    my $path    = $cgi->path_info();
    my $handler = $dispatch{$path};

    if ( ref($handler) eq 'CODE' ) {
        print "HTTP/1.0 200 OK\r\n";
        $handler->($cgi);
    }
    else {
        print "HTTP/1.0 404 Not found\r\n";
        print $cgi->header,
          $cgi->start_html('Not found'),
          $cgi->h1('Not found'),
          $cgi->end_html;
    }
}

sub resp_index {
    my $cgi = shift;
    return if !ref $cgi;

    print $cgi->header,
      $cgi->start_html("Advent of Code 2017 Solutions"),
      $cgi->h1("Advent of Code 2017 Solver"),
      $cgi->p('GET /solve?day=&puzzle=&data= for the actual solver'),
      $cgi->end_html;
}

sub resp_solve {
    my $cgi = shift;
    return if !ref $cgi;

    my $day    = $cgi->param('day');
    my $puzzle = $cgi->param('puzzle');
    my $data   = $cgi->param('data');

    print "day: $day, puzzle: $puzzle, data: $data";

    my $solution = _solve( $day, $puzzle, $data );

    print $cgi->header,
      $cgi->start_html("Day$day Puzzle$puzzle Solution"),
      $cgi->h1("Solution for Day$day Puzzle$puzzle"),
      $cgi->p($solution),
      $cgi->end_html;
}

sub _solve {
    my ( $day, $puzzle, $data ) = @_;

    my $solver = "Advent::Day$day" . "::Puzzle$puzzle";
    load $solver;

    my @in = $solver->prepare_data($data);

    my $solution = $solver->solve(@in);

    return $solution;
}

1;
