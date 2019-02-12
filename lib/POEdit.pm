package POEdit;
require Exporter;
use strict;
use warnings;

our @ISA = qw(Exporter);
our @EXPORT= qw(po_read);

sub po_read {
    my($file)= @_;
    open my $in, '<:encoding(utf8)', $file or die "Can't read $file: $!\n";
    my %result;
    my $entry= {};
    my $last;
    my $comment;
    while (<$in>) {
        my $last_comment= $comment;
        undef $comment;
        if( /^"(.*)"$/ ) {
            die "Error in $file on line $.: Syntax error." unless $last;
            $$last.= $1;
            next;
        } elsif( /^\s*$/ or eof $in ) {
            foreach (values %$entry) {
                s/\\n/\n/gs;
                s/\\(.)/$1/gs;
            }
            if ( $entry->{msgid} eq '' ) {
                foreach (split /\n/, $entry->{msgstr} ) {
                    my ($k, $v)= split /\s*:\s*/, $_, 2;
                    $result{''}->{$k}= $v;
                }
                $entry= {};
            } else {
                $result{$entry->{msgctxt} || ''}= $entry;
                $entry= {};
            }
        } elsif( /^#\s*([^:]+?)\s*:\s*(.*?)\s*$/ ) {
            $entry->{Comment}->{$1}= $2;
            $comment= \$entry->{Comment}->{$1};
        } elsif( /^#\s*(.*?)\s*$/ ) {
            if ( $last_comment ) {
                $$last_comment.= "\n".$1;
                $comment= $last_comment;
            }
            next;
        } else {
            if( s/^(msgctxt|msgid|msgstr)\s*+// ) {
                if( exists $entry->{$1} ) {
                    die "Error in $file on line $.: Duplicate $1 '".$entry->{$1}."' encountered.\n";
                }
                $entry->{$1}= '';
                $last= \$entry->{$1};
                redo;
            } else {
                die "Error in $file on line $.: Can't handle $_\n";
            }
        }
    }
    return \%result;
}

1;
