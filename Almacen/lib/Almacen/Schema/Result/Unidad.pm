use utf8;
package Almacen::Schema::Result::Unidad;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Almacen::Schema::Result::Unidad

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

=head1 TABLE: C<unidad>

=cut

__PACKAGE__->table("unidad");

=head1 ACCESSORS

=head2 unidadid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'unidad_unidadid_seq'

=head2 nombre

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "unidadid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "unidad_unidadid_seq",
  },
  "nombre",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</unidadid>

=back

=cut

__PACKAGE__->set_primary_key("unidadid");

=head1 RELATIONS

=head2 detalles

Type: has_many

Related object: L<Almacen::Schema::Result::Detalle>

=cut

__PACKAGE__->has_many(
  "detalles",
  "Almacen::Schema::Result::Detalle",
  { "foreign.unidadid" => "self.unidadid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-09-16 16:59:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8bigliO9pQ+NeQLWwDlp6A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
