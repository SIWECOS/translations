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
    my $result= {};
    $level= 0;
    my @stack= ( );
    foreach (@content) {
        $_->{text}=~ s/^[\t ]*[\012\015]*\z//m;
        if ($_->{level} > $level) {
            push @stack, $result;
            $result->{content}= [ $_ ];
            $result= $_;
            $level= $_->{level};
        } elsif ($_->{level} == $level) {
            $result= $stack[-1];
            push @{$result->{content}}, $_;
            $result= $_;
        } else {
            while ($_->{level} <= $level ) {
                $result= pop @stack;
                $level= scalar @stack;
            }
            push @{$result->{content}}, $_;
            $result= $_;
        }
    }
    return ($stack[0] || $result)->{content};
}

sub trim {
    local($_)= @_;
    s/[\s\012\015]+$//s;
    return $_;
}