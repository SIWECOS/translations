package SIWECOS::Text::Scanner::Results;

use strict;
use warnings;
use Carp;
use File::Basename;
use SIWECOS::Text;

our $VERSION = '0.0.1';

sub new {
    my($class, $content)= @_;
    $class= ref $class || $class;
    my $self= {
        id      => '_RESULTS',
        results => undef,
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
        next if $self->result($content);
        undef $success;
    }
    return $success && $self;
}

sub validate {
    my($self)= @_;
    my @issues;
    my $id= $self->{id};
    foreach my $result (values %{$self->{results}}) {
        push @issues, map "$id: $_", $result->missing_translations(sort keys %{$self->{languages}});
    }
    return @issues;
}

sub result {
    my($self, $content)= @_;
    my $type= ref $content;
    if ($type eq 'SIWECOS::Text') {
        my $result_id= $content->id;
        $self->{results}{$result_id}= $content;
        ++$self->{languages}{$_} foreach ($content->languages);
    } else {
        carp "Cannot add object of type $type as a result";
        return undef;
    }
    return $self;
}

sub results {
    my($self)= @_;
    return $self->{results};
}

sub id {
    my($self)= @_;
    return $self->{id};
}

sub read {
    my($class, $dirname)= @_;
    $class= ref $class || $class;
    my $id= basename $dirname;
    my $self= $class->new();
    if (my $check= SIWECOS::Text::dircheck($dirname)) {
        carp $check;
        return undef;
    }
    foreach my $result_dir (glob("$dirname/*")) {
        next unless -d $result_dir;
        my $result_id= basename $result_dir;
        my $text= SIWECOS::Text->read($result_dir);
        $self->result($text);
    }
    #my @issues= $self->validate;
    #warn "$id: $_\n" foreach @issues;
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
    foreach my $result (values %{$self->results}) {
        $result->write($dirname) or return undef;
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