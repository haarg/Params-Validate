use strict;
use warnings;

use Test::More tests => 1;

if (eval { require Params::Validate::XS }) {
  diag "Params::Validate::XS is available";
}
else {
  diag "Params::Validate::XS is not available";
}

ok 1;
