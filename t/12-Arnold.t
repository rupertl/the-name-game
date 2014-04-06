#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

like( `$impl Arnold`, qr
/Arnold, Arnold, bo-barnold
Banana-fana fo-farnold
Fee-fi mo-marnold
Arnold!/,
      "$impl can rhyme Arnold" );

done_testing;


