use strict;
use Test::More;

BEGIN{
    use_ok('SIWECOS::Text');
    use_ok('SIWECOS::Text::Scanner');
    use_ok('SIWECOS::Text::Scanner::Test');
    use_ok('SIWECOS::Text::Scanner::Results');
}

subtest 'SIWECOS::Text tests' => sub {
    my $headline_text= SIWECOS::Text->new(
        Headline => {
            de => 'Überschrift',
            en => 'Headline',
        }
    );
    ok( $headline_text, 'Initialize headline text');

    my @languages= sort $headline_text->languages;
    my @expected= sort (qw( de en ));
    is_deeply(\@languages, \@expected,
        'Check that languages are returned'
    );

    my $untranslatetd_text= SIWECOS::Text->new(
        Untranslated => {
            de => 'deutscher text',
        }
    );
    my @missing_translations= $untranslatetd_text->missing_translations(@languages);
    is_deeply(\@missing_translations, ['Untranslated: no text for en'],
        'english translation should be missing'
    );
};

subtest 'SIWECOS::Text::Scanner::Test tests' => sub {
    my $TEST_ID= 'Test Scanner Test';
    my $test_text= SIWECOS::Text::Scanner::Test->new( $TEST_ID );

    ok( $test_text->id eq $TEST_ID, 'Initialize scanner test text object' );

    $test_text= SIWECOS::Text::Scanner::Test->new( $TEST_ID,
        SIWECOS::Text->new(
            Headline => {
                de => 'Überprüfung auf Blacklist Eintrag',
                en => 'Blacklist check',
            }
        ),
    );

    ok( $test_text->id eq $TEST_ID, 'Initialize scanner test text object with texts' );

    ok($test_text->topic( SIWECOS::Text->new (
        Background => {
            de => 'Hintergrundtext',
            en => 'Backgroundtext',
        }
    )), 'Set Background text');

    is($test_text->topic( SIWECOS::Text->new (
        Blafasel => {
            de => 'laberrhababer',
            en => 'mumblejumble',
        }
    )),undef,
    'Unknown topic has to fail');
};

subtest 'SIWECOS:Text::Scanner tests' => sub {
    my $TESTSCANNER_ID= 'Testscanner';
    my $scanner_text= SIWECOS::Text::Scanner->new(
        $TESTSCANNER_ID,
        {
            de => 'Ein Testscanner',
            en => 'A Testscanner',
        },
        SIWECOS::Text::Scanner::Test->new(
            'SPAM',
            SIWECOS::Text->new(
                Headline => {
                    de => 'Überprüfung auf SPAM Eintrag',
                    en => 'SPAM check',
                }
            ),
        ),
    );
    ok( $scanner_text, 'Initialize scanner text object');
};

#############
done_testing( );
