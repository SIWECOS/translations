package SIWECOS::Text::Scanner;

use strict;
use warnings;
use Carp;
use File::Basename;
use SIWECOS::Markdown;
use SIWECOS::Text;
use SIWECOS::Text::Scanner::Test;
use SIWECOS::Text::Scanner::Results;

our $VERSION = '0.0.1';

our $LINE_BEFORE_TESTS_IN_MD= "\n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n";

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
        if ($type eq 'SIWECOS::Text::Scanner::Test') {
            next if $self->test($content);
        } elsif ($type eq 'SIWECOS::Text::Scanner::Results') {
            next if $self->results($content);
        } elsif ($type eq 'SIWECOS::Text' or $type eq 'HASH') {
            next if $self->name($content);
        } elsif ($type) {
            carp "Cannot add object of type $type to $id";
        } else {
            carp "Cannot add $content to $id";
        }
        undef $success;
    }
    return $success && $self;
}

sub test {
    my($self, $test) = @_;
    my $type= ref $test;
    if ($type) {
        my $id= $self->id;
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
        return $test;
    }
    return $self->{tests}{$test}
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
    if ($self->name) {
        $self->name->write($dirname) or return undef;
    }
    if ($self->results) {
        $self->results->write($dirname) or return undef;
    }
    if ($self->tests) {
        foreach (values %{$self->tests}) {
            $_->write($dirname) or return undef;
        }
    }
    return 1;
}

sub read_md {
    my($class, $filename)= @_;
    $class= ref $class || $class;
    my $filehandle;
    my $file_name_id= basename $filename;
    $file_name_id=~ s/\.(\w+)\.md$//;
    my $language= $1;
    if (not defined $language) {
        carp "Wrong filename $filename: extension '.LANGUAGE.md' missing.";
        return undef;
    }
    my $markdown= SIWECOS::Markdown::read($filename);
    return undef unless $markdown;
    if (1 != scalar @$markdown) {
        carp "Wrong structure in $filename. Too many headlines at level 1.";
        return undef;
    }
    $markdown= $markdown->[0];
    my $id= $markdown->{headline};
    if ($id ne $file_name_id) {
        carp "Warning: $file_name_id does not match $id.";
    }
    my $self= $class->new( $id );
    my $name_text= SIWECOS::Text::trim($markdown->{text});
    if ( $name_text ne '' ) {
        $self->name({ 
            $language => $name_text
        });
    }
    foreach my $content (@{$markdown->{content}}) {
        my $id= $content->{headline};
        if ($id eq '_RESULTS') {
            my $results= SIWECOS::Text::Scanner::Results->new();
            foreach my $result (@{$content->{content}}) {
                my $text= SIWECOS::Text->new(
                    $result->{headline},
                    {$language => $result->{text},},
                );
                $results->result($text);
            }
            $self->results($results);
        } else {
             my $test= SIWECOS::Text::Scanner::Test->new($id);
            foreach my $topic (@{$content->{content}}) {
                my $text= SIWECOS::Text->new(
                    $topic->{headline},
                    {$language => $topic->{text},},
                );
                $test->topic($text);
            }
            $self->test($test);
        }
    }
    return $self;
}

sub write_md {
    my($self, $dirname)= @_;
    my $id= $self->{id};
    if (my $check= SIWECOS::Text::dircheck($dirname, 1)) {
        carp $check;
        return undef;
    }
    foreach my $language ($self->languages) {
        my $filename= "$dirname/$id.$language.md";
        my $filehandle;
        if (not open $filehandle, '>:utf8', $filename) {
            carp "Cannot write to $filename: $!";
            return undef;
        }
        print $filehandle 
            "\n# ",$self->id,"\n";
        print $filehandle 
            "\n",
            SIWECOS::Text::trim($self->name->text($language)),"\n"
            if ($self->name);
        my $count_level2= 0;
        if ($self->tests) {
            foreach my $testname (sort keys %{$self->tests}) {
                if ($count_level2++ and $LINE_BEFORE_TESTS_IN_MD) {
                    print $filehandle $LINE_BEFORE_TESTS_IN_MD;
                }
                $self->test($testname)->write_md($filehandle, $language) or return undef;
            }
        }
        if ($self->results) {
            if ($count_level2++ and $LINE_BEFORE_TESTS_IN_MD) {
                print $filehandle $LINE_BEFORE_TESTS_IN_MD;
            }
            $self->results->write_md($filehandle, $language);
        }
        close $filehandle;
    }
    return 1;
}

sub validate {
    my ($self)= @_;
    my $id= $self->{id};
    my @issues;
    if ($self->name) {
        push @issues,
            $self->name->check_one_line,
            $self->name->missing_translations(sort keys %{$self->{languages}});
        if ($self->{results}) {
            push @issues,
                $self->{results}->validate
        }
    }
    if ($self->{tests}) {
        push @issues, $_->validate foreach (values %{$self->{tests}});
    }
    warn "$id: $_\n" foreach (@issues);
    return scalar @issues;
}

sub languages {
    my($self)= @_;
    return keys %{$self->{languages}};
}

1;

# x SIWECOS::Text::Scanner->read('../texts/CMSVERSION')