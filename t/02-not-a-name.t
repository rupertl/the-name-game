#!perl
use Test::More;
use strict;
use warnings;

my $impl = $ENV{IMPL};
BAIL_OUT('$IMPL must be set to the implementation to test') unless $impl;

unlike( `$impl +==`, qr/Banana/,
        "$impl does not attempt to rhyme a non-alphabetical name" );

unlike( `$impl A`, qr/Banana/,
        "$impl does not attempt to rhyme a single letter name" );

unlike( `$impl ''`, qr/Banana/,
        "$impl does not attempt to rhyme an empty name" );

done_testing;


