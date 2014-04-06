#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

like( `$impl Tony`, qr
/Tony, Tony, bo-bony
Banana-fana fo-fony
Fee-fi mo-mony
Tony!/,
      "$impl can rhyme Tony" );

done_testing;


