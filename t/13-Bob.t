#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

like( `$impl Bob`, qr
/Bob, Bob, bo-ob
Banana-fana fo-fob
Fee-fi mo-mob
Bob!/,
      "$impl can rhyme Bob" );

done_testing;


