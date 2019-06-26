package SIWECOS::Text;

use strict;
use warnings;
use Carp;
use File::Basename;

our $VERSION = '0.0.1';

sub new {
    my($class, $id, $content)= @_;
    $class= ref $class || $class;
    if (not defined $id) {
        carp "$class objects require an id";
        return undef;
    }
    my $self= {
        id   => $id,
        text => undef,
    };
    bless $self;
    return $self->_initialize($content) if $content;
    return $self;
}

sub _initialize {
    my($self, $content)= @_;
    while (my($language, $text)= each %$content) {
        $self->{text}{$language}= $text;
    }
    return $self;
}

sub languages {
    my($self)= @_;
    return keys %{$self->{text}};
}

sub text {
    my($self, $language, $text)= @_;
    if (defined $text) {
        return $self->{text}{$language}= $text;
    }
    return $self->{text}{$language};
}

sub missing_translations {
    my($self, @languages)= @_;
    my $id= $self->{id};
    my @missing;
    foreach my $language (@languages) {
        next if defined $self->{text}{$language};
        push @missing, "$id: no text for $language";
    }
    return @missing;
}

sub check_one_line {
    my($self)= @_;
    my $id= $self->{id};
    my @issues;
    while (my($language, $text)= each %{$self->{text}}) {
        for ($text) {
            s/\s*[\012\015]+$//s;
            next unless /[\012\015]/;
            push @issues, "$id for $language is required to be a single line"
        }
    }
    push @issues, $self->check_not_empty;
    return @issues;
}

sub check_not_empty {
    my($self)= @_;
    my $id= $self->{id};
    my @issues;
    while (my($language, $text)= each %$self) {
        for ($text) {
            next unless /^[\s\012\015]*$/s;
            push @issues, "$id for $language may not be empty"
        }
    }
    return @issues;
}

sub id {
    my($self, $new_id)= @_;
    if (defined $new_id) {
        return $self->{id}= $new_id;
    }
    return $self->{id};
}

sub read {
    my($class, $dirname)= @_;
    $class= ref $class || $class;
    my $id= basename $dirname;
    my $self= $class->new( $id );
    if (my $check= dircheck($dirname)) {
        carp $check;
        return undef;
    }
    foreach my $lang_file (glob("$dirname/*.wiki")) {
        next unless -f $lang_file;
        my $language= basename($lang_file, '.wiki');
        if (open my $text, '<:utf8', $lang_file) {
            my $content= do {
                local $/;
                <$text>;
            };
            close $text;
            $self->text($language, $content);
        } else {
            carp "Cannot read $lang_file: $!";
        }
    }
    return $self;
}

sub write {
    my($self, $dirname)= @_;
    my $id= $self->{id};
    if (my $check= dircheck($dirname, 1)) {
        carp $check;
        return undef;
    }
    $dirname.= "/$id";
    mkdir($dirname);
    if (my $check= dircheck($dirname, 1)) {
        carp $check;
        return undef;
    }
    foreach my $language ($self->languages) {
        my $filename= "$dirname/$language.wiki";
        foreach my $text ($self->text($language)) {
            if (open my $textfile, '>:utf8', $filename) {
                print $textfile $text,"\n";
                close $textfile;
            } else {
                carp "Cannot create $filename: $!";
                return undef;
            }
        }
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
        "\n### ",$self->id,"\n",
        "\n",
        trim($self->text($language) || ''),"\n",
        ;
    return 1;
}

sub dircheck {
    my($dirname, $check_write) = @_;
    if (not -r $dirname) {
        return "Can't read $dirname";
    }
    if ($check_write and not -w $dirname) {
        return "Can't write $dirname";
    }
    if (not -d $dirname) {
        return "Not a directory: $dirname";
    }
    if (not -x $dirname) {
        return "Cannot access directory: $dirname";
    }
    return '';
}

sub trim {
    local($_)= @_;
    s/[\s\012\015]+$//s;
    return $_;
}

1;