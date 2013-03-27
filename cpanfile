requires 'Amon2', '3.77';
requires 'Amon2::Auth';
requires 'Amon2::Lite', '0.09';
requires 'MetaCPAN::API::Tiny';
requires 'Plack::Session', '0.14';
requires 'Text::Xslate', '1.5006';
requires 'perl', '5.008001';

on configure => sub {
    requires 'ExtUtils::MakeMaker';
};

on build => sub {
    requires 'ExtUtils::MakeMaker';
};
