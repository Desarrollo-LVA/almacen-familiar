use utf8;
package Almacen::Schema::Result::Compra;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Almacen::Schema::Result::Compra

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

=head1 TABLE: C<compra>

=cut

__PACKAGE__->table("compra");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'compra_id_seq'

=head2 lugar

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 fecha

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "compra_id_seq",
  },
  "lugar",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "fecha",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 detalles

Type: has_many

Related object: L<Almacen::Schema::Result::Detalle>

=cut

__PACKAGE__->has_many(
  "detalles",
  "Almacen::Schema::Result::Detalle",
  { "foreign.compra" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 lugar

Type: belongs_to

Related object: L<Almacen::Schema::Result::Lugar>

=cut

__PACKAGE__->belongs_to(
  "lugar",
  "Almacen::Schema::Result::Lugar",
  { id => "lugar" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2018-02-08 20:20:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Um6G/ToZN+/N/CidOC8KBg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
