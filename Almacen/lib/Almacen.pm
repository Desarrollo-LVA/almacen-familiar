package Almacen;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
    -Debug
    ConfigLoader
    
    Static::Simple
/;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
    name => 'Almacen',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
    default_view => 'HTML'
);

# Start the application
__PACKAGE__->setup();

=encoding utf8

=head1 NAME

Almacen - Catalyst based application

=head1 SYNOPSIS

    script/almacen_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Almacen::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Familia Leyva Hernandez,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
