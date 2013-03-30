package MFPM::Dispatcher;
use strict;
use warnings;
use utf8;

use Amon2::Web::Dispatcher::Lite;

get '/' => sub {
    my $c = shift;

    my $q = $c->req->param('q');
    my $result;
    if ($q) {
        $result = MFPM::MetaCPAN->search(
            $q,
            50
        );
    }
    $c->fillin_form($c->req);
    return $c->render('index.tt', {
        result => $result,
    });
};

get '/author/:name' => sub {
    my ($c, $args) = @_;
    return $c->render('author.tt' => {
        name => $args->{name},
    });
};

get '/distribution/:name' => sub {
    my ($c, $args) = @_;
    return $c->render('distribution.tt' => {
        name => $args->{name},
    });
};

post '/post' => sub {
    my ($c, $args) = @_;
    MFPM::Review->post(
        $c, $c->req->parameters
    );
    return $c->render('distribution.tt' => {
        name => $args->{name},
    });
};

post '/logout' => sub {
    my $c = shift;
    $c->session->expire();
    return $c->redirect('/');
};

1;

