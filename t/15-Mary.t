#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

like( `$impl Mary`, qr
/Mary, Mary, bo-bary
Banana-fana fo-fary
Fee-fi mo-ary
Mary!/,
      "$impl can rhyme Mary" );

done_testing;


