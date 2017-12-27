package AdventWeb;
use strict;
use warnings FATAL => 'all';
use Module::Load;
use Mojolicious::Lite;

get '/' => sub {
    shift->render( template => 'index' );
};

get '/:day/:puzzle' => sub {
    my $c = shift;

    my $day    = $c->param('day');
    my $puzzle = $c->param('puzzle');
    my $data   = $c->param('data');

    $c->stash( solution => _solve( $day, $puzzle, $data ) );

    $c->render( template => 'solution' );
};

sub _solve {
    my ( $day, $puzzle, $data ) = @_;

    my $solver = "Advent::Day$day" . "::Puzzle$puzzle";
    load $solver;

    my @in = $solver->prepare_data($data);

    my $solution = $solver->solve(@in);

    return $solution;
}

1;
__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html>
    <head><title>Advent of Code 2017 Solutions</title></head>
    <body>
        <h1>Advent of Code 2017 Solver</h1>
        GET /solve/:day/:puzzle?data= for the actual solver'
    </body>
</html>

@@ solution.html.ep
<!DOCTYPE html>
<html>
    <head><title>Advent of Code 2017 Solutions</title></head>
    <body>
        <h1>Advent of Code 2017 Day <%= $day %> Puzzle <%= $puzzle %> Solution</h1>
        <%= $solution %>
    </body>
</html>