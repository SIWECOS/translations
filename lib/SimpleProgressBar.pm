package SimpleProgressBar;

use strict;
use warnings;
use Term::ReadKey;

sub new {
    my ($self, %config) = @_;
    my $type = ref($self) || $self;
    my @terminalsize= GetTerminalSize;
    my $width = ($config{width} || $terminalsize[0] || 50) - 2;
    $| = 1;
    return bless {
        max     => defined($config{max}) ? $config{max} : 100,
        width   => $width,
        current => undef,
        fill    => $config{fill} || '#',
        empty   => $config{empty} || '.',
        rotator => $config{rotator} || '',
        rotcnt  => 0,
        cursor  => $config{cursor},
        dumb    => $config{dumb},
        format  => $config{format} || "%5.1f%%",
    }, $type;
}

sub update {
    my($self, $done) = @_;
    return unless $self->{max};
    if ($self->{dumb}) {
        my $new= sprintf $self->{format}, $done * 100 / $self->{max};
        if (not $self->{current} or $self->{current} ne $new) {
            print "\r",$new;
            $self->{current}= $new; 
        }
        return;
    }
    my $new = $done * $self->{width} / $self->{max};
    if (not $self->{current} or $self->{current} != $new) {
        $self->{current}= $new;
        if ($self->{rotator}) {
            $new = int($new);
            print "\r[",$self->{fill} x $new;
            my $rest= $self->{width}-$new;
            if ($rest > 0) {
                my $r= $self->{rotcnt};
                print substr($self->{rotator}, $r++, 1),$self->{empty} x ($rest-1),"]\r";
                $r=0 if $r >= length($self->{rotator});
                $self->{rotcnt}= $r;
            } else {
                print $self->{empty} x $rest,"]\r";
            }
        } else {
            print "\r[",$self->{fill} x $new, $self->{empty} x ($self->{width}-$new),"]\r";
        }
        if ($self->{cursor}) {
            print "[";
            print "\x1b[${new}C" if $new;
        }
    }
}

sub clear {
    my($self) = @_;
    if ($self->{dumb}) {
        my $current= $self->{current};
        if (defined $current) {
            print "\r"," " x length($current),"\r";
        }
        return;
    }
    print "\r\x1b[2K";
}
1;
