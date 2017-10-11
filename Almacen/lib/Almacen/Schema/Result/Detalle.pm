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

=head2 detalleid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'detalle_detalleid_seq'

=head2 articuloid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 unidadid

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
  "detalleid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "detalle_detalleid_seq",
  },
  "articuloid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "unidadid",
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

=item * L</detalleid>

=back

=cut

__PACKAGE__->set_primary_key("detalleid");

=head1 RELATIONS

=head2 articuloid

Type: belongs_to

Related object: L<Almacen::Schema::Result::Articulo>

=cut

__PACKAGE__->belongs_to(
  "articuloid",
  "Almacen::Schema::Result::Articulo",
  { articuloid => "articuloid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 unidadid

Type: belongs_to

Related object: L<Almacen::Schema::Result::Unidad>

=cut

__PACKAGE__->belongs_to(
  "unidadid",
  "Almacen::Schema::Result::Unidad",
  { unidadid => "unidadid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-09-30 19:51:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w/38j8s+bqZyCzNN6+mBGw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
