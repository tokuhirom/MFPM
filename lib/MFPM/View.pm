package MFPM::View;
use strict;
use warnings;
use utf8;
use v5.10.0;
use Text::Xslate;
use MFPM::ViewFunctions;

sub instance {
    state $INSTANCE = do {
        Text::Xslate->new(
            syntax => 'TTerse',
            module => ['MFPM::ViewFunctions'],
            path => [qw(tmpl)],
        );
    };
}

1;
