#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

# Scott is one of those exceptions where the first two letters are dropped

like( `$impl Scott`, qr
/Scott, Scott, bo-bott
Banana-fana fo-fott
Fee-fi mo-mott
Scott!/,
      "$impl can rhyme Scott" );

done_testing;


