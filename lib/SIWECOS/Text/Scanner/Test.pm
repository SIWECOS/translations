package SIWECOS::Text::Scanner::Test;

use strict;
use warnings;
use Carp;
use File::Basename;
use SIWECOS::Text;

our $VERSION = '0.0.1';

# my $test= SIWECOS::Text::Scanner::Test->new( $testname );
# $test->category( $category );

use constant ONE_LINE  => 1;
use constant NOT_EMPTY => 2;


my @TOPICS= (
    Headline      => ONE_LINE,
    Category      => NOT_EMPTY,
    Description   => NOT_EMPTY,
    Background    => NOT_EMPTY,
    Consequence   => NOT_EMPTY,
    Solution_Tips => NOT_EMPTY,
    Link          => ONE_LINE,
    Negative      => NOT_EMPTY,
    Positive      => NOT_EMPTY,
);
my %TOPICS= @TOPICS;
@TOPICS= do { # filter just topic names
    my $i=0;
    grep { ++$i & 1 } @TOPICS;
};

sub new {
    my($class, $id, $content)= @_;
    $class= ref $class || $class;
    if (not defined $id) {
        carp "$class objects require an id";
        return undef;
    }
    my $self= {
        id => $id,
        topics => undef,
    };
    bless $self;
    return $self->_initialize($content) if $content;
    return $self;
}

sub _initialize {
    my ($self, @content)= @_;
    my $id= $self->{id};
    my $success= 1;
    foreach my $content (@content) {
        next if $self->topic($content);
        undef $success;
    }
    return $success && $self;
}

sub validate {
    my($self)= @_;
    my @issues;
    my $id= $self->{id};
    while (my($topic, $condition) = each %TOPICS) {
        if (my $t= $self->topic($topic) ) {
            if ($condition == ONE_LINE) {
                push @issues, map "$id: $_", $t->check_one_line;
            } elsif ($condition == NOT_EMPTY) {
                push @issues, map "$id: $_", $t->check_not_empty;
            }
            push @issues, map "$id: $_", $t->missing_translations(sort keys %{$self->{languages}});
        } else {
            push @issues, "$id: $topic missing";
        } 
    }
    return @issues;
}

sub topic {
    my($self, $content)= @_;
    my $id= $self->{id};
    my $type= ref $content;
    if ($type eq 'SIWECOS::Text') {
        my $topic= $content->id;
        if (not $TOPICS{$topic}) {
            carp "Unknown topic $topic for $id";
            return undef;
        } else {
            $self->{topics}{$topic}= $content;
            ++$self->{languages}{$_} foreach ($content->languages);
        }
        return $content;
    } elsif ($type) {
        carp "Cannot add object of type $type as a topic to $id";
            return undef;
    } else {
        return $self->{topics}{$content};
    }
}

sub id {
    my($self)= @_;
    return $self->{id};
}

sub read {
    my($class, $dirname)= @_;
    $class= ref $class || $class;
    my $id= basename $dirname;
    my $self= $class->new( $id );
    if (my $check= SIWECOS::Text::dircheck($dirname)) {
        carp $check;
        return undef;
    }
    foreach my $topic_dir (glob("$dirname/*")) {
        next unless -d $topic_dir;
        my $topic= basename $topic_dir;
        my $text= SIWECOS::Text->read($topic_dir);
        $self->topic($text);
    }
    return $self;
}

sub write {
    my($self, $dirname)= @_;
    my $id= $self->{id};
    if (my $check= SIWECOS::Text::dircheck($dirname, 1)) {
        carp $check;
        return undef;
    }
    $dirname.= "/$id";
    mkdir($dirname);
    if (my $check= SIWECOS::Text::dircheck($dirname, 1)) {
        carp $check;
        return undef;
    }
    foreach my $topic (keys %TOPICS) {
        $self->topic($topic)->write($dirname) or return undef;
    }
    return 1;
}

sub write_md {
    my($self, $filehandle, $language)= @_;
    if (not defined fileno $filehandle) {
        carp "Not a filehandle";
        return undef;
    }
    print $filehandle
        "\n## ",$self->id,"\n",
        ;
    foreach my $topic (@TOPICS) {
        $self->topic($topic)->write_md($filehandle, $language) or return undef;
    }
    return 1;
}

sub languages {
    my($self, $languages)= @_;
    if ($languages) {
        return $self->{languages}= $languages;
    }
    return $self->{languages};
}


1;