package MFPM::MetaCPAN;
use strict;
use warnings;
use utf8;
use Furl;
use JSON::XS qw(decode_json);
use URI::Escape qw(uri_escape);

sub search {
    my ($class, $q, $size) = @_;
    $size //= 50;

    my $ua = Furl->new();
    my $res = $ua->get( _search_construct_url($q, $size));
    die $res->status_line unless $res->is_success;
    return decode_json($res->content);
}

sub _search_construct_url {
    my ($q, $size) = @_;
    $size ||= 20;

    $q = "status:latest AND $q";
    $q = uri_escape($q);
    my $uri = sprintf('http://api.metacpan.org/v0/release/_search?size=%s&q=%s',  $size, $q);
}


1;

