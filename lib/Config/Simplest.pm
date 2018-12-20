package Config::Simplest;
require Exporter;

@ISA = qw(Exporter);
@EXPORT= qw(get_config);

sub get_config {
    my($settings_file, @required)= @_;
    my (
        %required,
        %settings,
    );
    @required{@required}=@required;
    open my $settings, '<', $settings_file
        or die "Cannot read $settings_file: $!\n";
    while (<$settings>) {
        next if /^\s*(?:#.*)?$/;
        next unless /^\s*(\w+)\s*(?:[:=]\s*)?(["']?)(.*)\2\s*(?:#.*)?$/;
        delete $required{$1};
        ($settings{$1}= $3)=~ s/\\(.)/$1/g;
    }
    die "Missing some required settings in\n $settings_file:\n\t- "
        .join("\n\t- ", sort keys %required)
        ."\n" if scalar %required;
    return \%settings;
}
