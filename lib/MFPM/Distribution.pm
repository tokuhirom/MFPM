package MFPM::Distribution;
use strict;
use warnings;
use utf8;

use Mouse;

has [qw(author distribution abstract)] => (
    is => 'ro',
);

no Mouse;

1;

