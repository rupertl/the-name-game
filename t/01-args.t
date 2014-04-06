#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

# Test for non-zero exit code
`$impl`;
ok( $?, "$impl reports failure if name not provided" );

`$impl Name`;
ok( ! $?, "$impl exits ok if name provided" );

done_testing;


