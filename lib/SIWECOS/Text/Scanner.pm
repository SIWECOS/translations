package SIWECOS::Text::Scanner;

use strict;
use warnings;
use Carp;
use File::Basename;
use SIWECOS::Text;
use SIWECOS::Text::Scanner::Test;
use SIWECOS::Text::Scanner::Results;

our $VERSION = '0.0.1';

# id => id
# name => SIWECOS::Text
# tests => \%tests
# results => \%results
# 
# my $scannertext= SIWECOS::Text::Scanner->new( $name );
# 

sub new {
    my($class, $id, @content)= @_;
    $class= ref $class || $class;
    if (not defined $id) {
        carp "$class objects require an id";
        return undef;
    }
    my $self= {
        id => $id,
    };
    bless $self;
    return $self->_initialize(@content) if @content;
    return $self;
}

sub _initialize {
    my ($self, @content)= @_;
    my $id= $self->{id};
    my $success= 1;
    foreach my $content (@content) {
        my $type= ref $content;
        if ($type eq 'SIWECOS::Text' or $type eq 'HASH') {
            next if $self->name($content);
        } 
        if ($type eq 'SIWECOS::Text::Scanner::Test') {
            next if $self->test($content);
        } 
        if ($type eq 'SIWECOS::Text::Scanner::Results') {
            next if $self->results($content);
        } else {
            carp "Cannot add object of type $type to $id";
        }
        undef $success;
    }
    return $success && $self;
}

sub test {
    my($self, $test) = @_;
    my $type= ref $test;
    my $id= $self->{id};
    if ($type ne 'SIWECOS::Text::Scanner::Test') {
        carp "Cannot add object of type $type as a test to $id";
        return undef;
    }
    my $testid= $test->id;
    if (defined $testid) {
        $self->{tests}{$test->id}= $test;
    } else {
        carp "Cannot add a test without id to $id";
        return undef;
    }
    while (my($language, $count) = each %{$test->languages}) {
        $self->{languages}{$language}+= $count;
    }
    $test->languages($self->{languages});
}

sub results {
    my($self, $results) = @_;
    if ($results) {
        my $type= ref $results;
        my $id= $self->{id};
        if ($type ne 'SIWECOS::Text::Scanner::Results') {
            carp "Cannot add object of type $type as a results to $id";
            return undef;
        }
        $self->{results}= $results;
        while (my($language, $count) = each %{$results->languages}) {
            $self->{languages}{$language}+= $count;
        }
        $results->languages($self->{languages});
    }
    return $self->{results};
}

sub tests {
    my ($self)= @_;
    return $self->{tests};
}

sub name {
    my($self, $name) = @_;
    if ($name) {
        my $type= ref $name;
        my $id= $self->{id};
        if ($type eq 'HASH') {
            $name= SIWECOS::Text->new(
                _SCANNER_NAME => $name,
            );
        } elsif ($type ne 'SIWECOS::Text') {
            carp "Cannot set object of type $type as a name of $id";
            return undef;
        } 
        my $name_id= $name->id;
        if ($name_id ne '_SCANNER_NAME') {
            carp "The id of the name object has to be '_SCANNER_NAME' but is $name_id";
            return undef;
        }
        ++$self->{languages}{$_} foreach ($name->languages);
        return $self->{name}= $name;
    }
    return $self->{name};
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
    foreach my $test_dir (glob("$dirname/*")) {
        next unless -d $test_dir;
        my $test_id= basename $test_dir;
        if ($test_id eq '_SCANNER_NAME') {
            my $name= SIWECOS::Text->read($test_dir);
            $self->name($name);
        } elsif ($test_id eq '_RESULTS') {
            my $results= SIWECOS::Text::Scanner::Results->read($test_dir);
            $self->results($results);
        } else {
            my $test= SIWECOS::Text::Scanner::Test->read($test_dir);
            $self->test($test);
        }
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
    $self->name->write($dirname) or return undef;
    $self->results->write($dirname) or return undef;
    foreach (values %{$self->tests}) {
        $_->write($dirname) or return undef;
    }
    return 1;
}

sub validate {
    my ($self)= @_;
    my $id= $self->{id};
    my @issues;
    warn "$id: $_\n" foreach (
        $self->name->check_one_line,
        $self->name->missing_translations(sort keys %{$self->{languages}}),
        $self->{results}->validate,
        map $_->validate, values %{$self->{tests}},
    );
}

1;

# x SIWECOS::Text::Scanner->read('../texts/CMSVERSION')