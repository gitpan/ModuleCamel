#
# This file is part of ModuleCamel
#
# This software is copyright (c) 2011 by Geistteufel <geistteufel@celogeek.fr>.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Module::Camel;

# ABSTRACT: convert module to camel and camel to module
use strict;
use warnings;
our $VERSION = '0.1';    # VERSION
use base 'Exporter';

our @EXPORT_OK = qw(
    camel_to_module
    module_to_camel
);

our %EXPORT_TAGS = ( 'all' => \@EXPORT_OK );

sub camel_to_module {
    my ($camel_string) = @_;
    my $module_string = lc($camel_string);
    $module_string =~ s/[^a-z0-9]+(.?)/::\u$1/gx;
    $module_string = ucfirst($module_string);

    return $module_string;
}

sub module_to_camel {
    my ($module_string) = @_;

    my $camel_string = lc($module_string);
    $camel_string =~ s/[^a-z0-9]+/_/gx;

    return $camel_string;
}

=pod

=head1 NAME

Module::Camel - convert module to camel and camel to module

=head1 VERSION

version 0.1

=head1 METHODS

=head2 camel_to_module

camel_to_module($camel_string)

Transform camel string into module string
It will replace any caracters that is not [a-z0-9] into a "::" and uppercase the letter just after

=head2 module_to_camel

module_to_camel($module_string)

Transform module string into a camel string
Any non word will be replace by "_"

=head1 BUGS

Any bugs or evolution can be submit here :

L<Github|http://github.com/geistteufel/ModuleCamel>

=head1

=head1 AUTHOR

Geistteufel <geistteufel@celogeek.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Geistteufel <geistteufel@celogeek.fr>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__
