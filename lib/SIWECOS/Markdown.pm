package SIWECOS::Markdown;

use strict;
use warnings;
use Carp;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw( read );

sub read {
    my($filename)= @_;
    my $filehandle;
    if (not open $filehandle, '<:utf8', $filename) {
        carp "Cannot read $filename: $!";
        return undef;
    }
    my $headline;
    my $text;
    my @content;
    my $newsection= 1;
    my $level= 0;
    while (<$filehandle>) {
        if (s/^(#+)\s*//) {
            my $this_level= length $1;
            if ($this_level-1 > $level) {
                carp "Level error in $filename at line " . ($. - 1)
                . "\ncheck your '#'-lines. Expected at most ". ($level+1)." got $this_level.";
                return undef;
            }
            my $section= {
                level    => $this_level,
                headline => trim($_),
                text     => '',
            };
            $text= \$section->{text};
            push @content, $section;
            $newsection= 1;
            $level= $this_level;
        } elsif ($text) {
            if (not $newsection or not /^\s*$/) {
                $$text.= $_;
            }
            undef $newsection;
        } elsif ($newsection and not /^\s*$/) {
            carp "Text before first headline in $filename";
            undef $newsection;
        }
    }
    close $filehandle;
    my @stack= ( { headline =>'BOS', comtent => [] } );
    foreach (@content) {
        my $level= $#stack;
        $_->{text}= trim($_->{text});
        #delete $_->{text}; # was used for debugging
        $_->{content}= [];
        if ($_->{level} > $level) {
            push @{$stack[-1]{content}}, $_;
            push @stack, $_;
        } elsif ($_->{level} == $level) {
            my $tos= pop @stack;
            delete $tos->{content} if 0 == scalar @{$tos->{content}};
            push @{$stack[-1]{content}}, $_;
            push @stack, $_;
        } else {
            while ($_->{level} <= $level ) {
                my $tos= pop @stack;
                delete $tos->{content} if 0 == scalar @{$tos->{content}};
                $level= $#stack;
            }
            push @{$stack[-1]{content}}, $_;
            push @stack, $_;
        }
    }
    my $tos;
    while (scalar @stack) {
        $tos= pop @stack;
        delete $tos->{content} if 0 == scalar @{$tos->{content}};
    }
    return  $tos->{content};
}

sub trim {
    local($_)= @_;
    s/[\s\012\015]+\z//s;
    s/[ \t\012\015]+(?:(?:- ){2,}|--+)-[ \t\012\015]*\z//s;
    return $_;
}