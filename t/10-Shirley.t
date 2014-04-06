#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

like( `$impl Shirley`, qr
/Shirley, Shirley, bo-birley
Banana-fana fo-firley
Fee-fi mo-mirley
Shirley!/,
      "$impl can rhyme Shirley" );

done_testing;


