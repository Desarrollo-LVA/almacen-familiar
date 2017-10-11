package Almacen::Controller::Articulos;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{articulos} = [$c->model('DB::Articulo')->search({},{order_by=>'nombre'})->all];
    $c->stash->{frecuencias} = [$c->model('DB::Frecuencia')->search({},{order_by=>'dias'})->all];
}

sub rotacion : Local {
  my ($self, $c) = @_;

  my $articuloid = $c->request->params->{articulo};
  my $frecuencia = $c->request->params->{frecuencia};
  my $factor = $c->request->params->{factor};

  $c->stash->{nombre} = $c->model('DB::Articulo')->find($articuloid)->update({frecuencia=>$frecuencia,factorfrecuencia=>$factor})->nombre;
  $c->forward('View::JSON');
}
__PACKAGE__->meta->make_immutable;

1;
