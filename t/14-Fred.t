#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

like( `$impl Fred`, qr
/Fred, Fred, bo-bred
Banana-fana fo-red
Fee-fi mo-mred
Fred!/,
      "$impl can rhyme Fred" );

done_testing;


