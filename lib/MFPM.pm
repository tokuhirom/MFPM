package MFPM;
use strict;
use warnings;
use 5.008005;
our $VERSION = "0.01";

use parent qw(Amon2 Amon2::Web);

use MFPM::Dispatcher;
use MFPM::MetaCPAN;

__PACKAGE__->load_plugin('Web::CSRFDefender', {
});
__PACKAGE__->load_plugin('Web::FillInFormLite');
__PACKAGE__->load_plugin('Web::JSON');
__PACKAGE__->load_plugin('Web::PlackSession');
__PACKAGE__->load_plugin('Web::Auth', {
    module => 'Github',
    on_finished => sub {
        my ($c, $token, $user) = @_;
        my $name = $user->{name} || die;
        $c->session->set('user' => $user);
        $c->session->set('site' => 'github');
        return $c->redirect('/');
    }
});

sub session_user { shift->session->get('user') }

use MFPM::View;
sub create_view { MFPM::View->instance }

sub dispatch {
    my $c = shift;
    MFPM::Dispatcher->dispatch($c);
}

1;
__END__

=head1 NAME

MFPM - It's new $module

=head1 SYNOPSIS

    use MFPM;

=head1 DESCRIPTION

MFPM is ...

=head1 LICENSE

Copyright (C) tokuhirom

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

tokuhirom E<lt>tokuhirom@gmail.comE<gt>

