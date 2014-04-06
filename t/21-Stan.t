#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

# Stan is one of those exceptions where the first two letters are dropped

like( `$impl Stan`, qr
/Stan, Stan, bo-ban
Banana-fana fo-fan
Fee-fi mo-man
Stan!/,
      "$impl can rhyme Stan" );

done_testing;


