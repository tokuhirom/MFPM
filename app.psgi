use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use MFPM;
use Plack::Builder;
use File::Path;
use Plack::Session::Store::File;
use Plack::Session::State::Cookie;

my $sessiondir = "/tmp/mfpm-session-$<";
mkpath $sessiondir;

our $VERSION = '0.01';

builder {
    enable 'Plack::Middleware::Static',
        path => qr{^(?:/static/)},
        root => File::Spec->catdir(dirname(__FILE__));

    enable 'Plack::Middleware::Session',
        store => Plack::Session::Store::File->new(
            dir => $sessiondir,
        ),
      state => Plack::Session::State::Cookie->new( httponly => 1, );

    MFPM->to_app();
};

