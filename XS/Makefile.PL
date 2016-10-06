use strict;
use warnings;

use 5.008001;
use ExtUtils::MakeMaker;

WriteMakefile(
  "NAME" => "Params::Validate::XS",
  XS => { '../lib/Params/Validate/XS.xs' => '../lib/Params/Validate/XS.xs' },
  OBJECT => '../lib/Params/Validate/XS$(OBJ_EXT)',
  INC => '-I..',
  NO_MYMETA => 1,
);

{
  package MY;
  use Config;

  sub const_cccmd {
    my $ret = shift->SUPER::const_cccmd(@_);
    return q{} unless $ret;

    if ($Config{cc} =~ /^cl\b/i) {
      warn 'you are using MSVC... we may not have gotten some options quite right.';
      $ret .= ' /Fo$@';
    }
    else {
      $ret .= ' -o $@';
    }

    return $ret;
  }
}
