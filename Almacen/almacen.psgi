use strict;
use warnings;

use Almacen;

my $app = Almacen->apply_default_middlewares(Almacen->psgi_app);
$app;

