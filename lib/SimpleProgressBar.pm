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
        max     => $config{max} || 100,
        width   => $width,
        current => undef,
        fill    => $config{fill} || '#',
        empty   => $config{empty} || '.',
        rotator => $config{rotator} || '',
        rotlen  => length($config{rotator}||' '),
        cursor => $config{cursor},
    }, $type;
}

sub update {
    my($self, $done) = @_;
    my $new = int(($done * $self->{width} / $self->{max})*$self->{rotlen});
    if (not $self->{current} or $self->{current} != $new) {
        $self->{current}= $new;
        if ($self->{rotator}) {
            my $offset= $new % $self->{rotlen};
            $new = int($new / $self->{rotlen});
            print "\r[",$self->{fill} x $new;
            my $rest= $self->{width}-$new;
            if ($rest > 0) {
                print substr($self->{rotator}, $offset, 1),$self->{empty} x ($rest-1),"]\r";
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
    print "\r\x1b[2K";
}
1;
