package Almacen::Controller::Articulos;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Almacen::Controller::Articulos - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{articulos} = [$c->model('DB::Articulo')->search->all];
}

sub nuevo : Local{
  my ($self, $c) = @_;
  my $nombre = $c->request->params->{nombre};

  if($nombre)
  {
    $c->model('DB::Articulo')->create({
      nombre => $nombre
    });

    $c->response->redirect('/articulos');
  }
}

sub detalle : Local{
  my ($self, $c, $id) = @_;
  my $articulo = $c->model('DB::Articulo')->find($id);
  $c->stash->{articulo} = $articulo;
}

sub eliminar : Local{
  my ($self, $c, $id) = @_;
  my $articulo = $c->model('DB::Articulo')->find($id);
  $articulo->delete;
  $c->response->redirect('/articulos');
}

sub modificar : Local{}

=encoding utf8

=head1 AUTHOR

Familia Leyva Hernandez,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
