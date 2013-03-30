package MFPM::ViewFunctions;
use strict;
use warnings;
use utf8;
use parent qw(Exporter);

use Module::Functions;

our @EXPORT = get_public_functions();

sub uri_for { MFPM->context->uri_for(@_) }
sub session_user { MFPM->context->session_user() }

1;

