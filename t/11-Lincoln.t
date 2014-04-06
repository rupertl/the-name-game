#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

like( `$impl Lincoln`, qr
/Lincoln, Lincoln, bo-bincoln
Banana-fana fo-fincoln
Fee-fi mo-mincoln
Lincoln!/,
      "$impl can rhyme Lincoln" );

done_testing;


