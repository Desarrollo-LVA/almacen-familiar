package Almacen::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
    INCLUDE_PATH => [Almacen->path_to('root','html')],
    WRAPPER => 'wrapper.tt',
    ENCODING => 'utf-8'
);

=head1 NAME

Almacen::View::HTML - TT View for Almacen

=head1 DESCRIPTION

TT View for Almacen.

=head1 SEE ALSO

L<Almacen>

=head1 AUTHOR

Familia Leyva Hernandez,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
