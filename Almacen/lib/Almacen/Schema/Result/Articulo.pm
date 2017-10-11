use utf8;
package Almacen::Schema::Result::Articulo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Almacen::Schema::Result::Articulo

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<articulos>

=cut

__PACKAGE__->table("articulos");

=head1 ACCESSORS

=head2 articuloid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'articulos_articuloid_seq'

=head2 nombre

  data_type: 'text'
  is_nullable: 1

=head2 factorfrecuencia

  data_type: 'integer'
  is_nullable: 1

=head2 frecuencia

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "articuloid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "articulos_articuloid_seq",
  },
  "nombre",
  { data_type => "text", is_nullable => 1 },
  "factorfrecuencia",
  { data_type => "integer", is_nullable => 1 },
  "frecuencia",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</articuloid>

=back

=cut

__PACKAGE__->set_primary_key("articuloid");

=head1 RELATIONS

=head2 detalles

Type: has_many

Related object: L<Almacen::Schema::Result::Detalle>

=cut

__PACKAGE__->has_many(
  "detalles",
  "Almacen::Schema::Result::Detalle",
  { "foreign.articuloid" => "self.articuloid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 frecuencia

Type: belongs_to

Related object: L<Almacen::Schema::Result::Frecuencia>

=cut

__PACKAGE__->belongs_to(
  "frecuencia",
  "Almacen::Schema::Result::Frecuencia",
  { id => "frecuencia" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-09-30 18:38:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q6e2cOa85Sy6camKEGAIEw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
