use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'MFPM',
    AUTHOR        => 'Some Person <person@example.com>',
    VERSION_FROM  => 'app.psgi',
    PREREQ_PM     => {
        'Amon2'                           => '3.77',
        'Amon2::Lite'                     => '0.09',
        'Text::Xslate'                    => '1.5006',
        'Plack::Session'                  => '0.14',
		'Amon2::Auth'                     => 0,
		'MetaCPAN::API::Tiny'             => 0,
		'Teng'                            => 0,
		'HTML::FillInForm::Lite'          => 0,
    },
    MIN_PERL_VERSION => '5.008001',
    (-d 'xt' and $ENV{AUTOMATED_TESTING} || $ENV{RELEASE_TESTING}) ? (
        test => {
            TESTS => 't/*.t xt/*.t',
        },
    ) : (),
);
