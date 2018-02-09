use utf8;
package Almacen::Schema::Result::Detalle;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Almacen::Schema::Result::Detalle

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

=head1 TABLE: C<detalle>

=cut

__PACKAGE__->table("detalle");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'detalle_id_seq'

=head2 compra

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 articulo

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 unidad

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 cantidad

  data_type: 'numeric'
  is_nullable: 1

=head2 precio

  data_type: 'numeric'
  is_nullable: 1

=head2 caducidad

  data_type: 'date'
  is_nullable: 1

=head2 fecharegistro

  data_type: 'date'
  default_value: ('now'::text)::date
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "detalle_id_seq",
  },
  "compra",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "articulo",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "unidad",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "cantidad",
  { data_type => "numeric", is_nullable => 1 },
  "precio",
  { data_type => "numeric", is_nullable => 1 },
  "caducidad",
  { data_type => "date", is_nullable => 1 },
  "fecharegistro",
  {
    data_type     => "date",
    default_value => \"('now'::text)::date",
    is_nullable   => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 articulo

Type: belongs_to

Related object: L<Almacen::Schema::Result::Articulo>

=cut

__PACKAGE__->belongs_to(
  "articulo",
  "Almacen::Schema::Result::Articulo",
  { id => "articulo" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 compra

Type: belongs_to

Related object: L<Almacen::Schema::Result::Compra>

=cut

__PACKAGE__->belongs_to(
  "compra",
  "Almacen::Schema::Result::Compra",
  { id => "compra" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 unidad

Type: belongs_to

Related object: L<Almacen::Schema::Result::Unidad>

=cut

__PACKAGE__->belongs_to(
  "unidad",
  "Almacen::Schema::Result::Unidad",
  { id => "unidad" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2018-02-08 21:35:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mEfbd/QoR0t/UvdZLSydmg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
