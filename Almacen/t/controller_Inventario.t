use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Almacen';
use Almacen::Controller::Inventario;

ok( request('/inventario')->is_success, 'Request should succeed' );
done_testing();
