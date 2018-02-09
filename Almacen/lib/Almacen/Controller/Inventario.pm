package Almacen::Controller::Inventario;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{listado} = [$c->model('DB::Detalle')->search({},{order_by=>'caducidad'})->all];
    $c->stash->{articulos} = [$c->model('DB::Articulo')->search({},{})->all];
    $c->stash->{unidades} = [$c->model('DB::Unidad')->search({},{})->all];
}

sub agregar : Local {
  my ($self, $c) = @_;

  my $articulo = $c->request->params->{articulo};
  my $cantidad = $c->request->params->{cantidad};
  my $unidad = $c->request->params->{unidad};
  my $vencimiento = $c->request->params->{vencimiento};

  $articulo = $c->model('DB::Articulo')->find_or_create({
    nombre=>$articulo
  });

  $unidad = $c->model('DB::Unidad')->find_or_create({
    nombre=>$unidad
  });

  my $detalle = $c->model('DB::Detalle')->create({
    articulo=>$articulo->id(),
    unidad=>$unidad->id(),
    cantidad=>$cantidad,
    caducidad=>$vencimiento
  });

  $c->stash->{unidad} = $unidad->nombre();
  $c->stash->{articulo} = $articulo->nombre();
  $c->stash->{cantidad} = $cantidad;
  $c->stash->{caducidad} = $vencimiento;

  $c->forward('View::JSON');
}



=encoding utf8

=head1 AUTHOR

José Angel Leyva Portilla,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
