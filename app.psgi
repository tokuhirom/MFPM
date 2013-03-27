use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use Amon2::Lite;
use MetaCPAN::API::Tiny;

our $VERSION = '0.01';

# put your configuration here
sub load_config {
    my $c = shift;

    my $mode = $c->mode_name || 'development';

    +{
        'DBI' => [
            'dbi:SQLite:dbname=$mode.db',
            '',
            '',
        ],
    }
}

my $mcpan = MetaCPAN::API::Tiny->new(
    ua_args => [
        timeout => 7
    ],
);

get '/' => sub {
    my $c = shift;

    my $q = $c->req->param('q');
    my $result;
    if ($q) {
        $result = $mcpan->post(
            'module',
            {
                query  => { match_all => {} },
                filter => { prefix    => { 'module.name' => $q } },
                size => 10,
            },
        );
        use Data::Dumper; warn Dumper($result);
    }
    return $c->render('index.tt', {
        result => $result,
    });
};

# load plugins
__PACKAGE__->load_plugin('Web::CSRFDefender', {
    post_only => 1,
});
# __PACKAGE__->load_plugin('DBI');
__PACKAGE__->load_plugin('Web::FillInFormLite');
__PACKAGE__->load_plugin('Web::JSON');

__PACKAGE__->enable_session();

__PACKAGE__->to_app(handle_static => 1);

__DATA__

@@ /static/js/main.js

@@ /static/css/main.css
footer {
    text-align: right;
}
