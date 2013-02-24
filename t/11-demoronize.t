use strict;
use warnings;

use Encode;
use FilmAffinity::Utils;

use Test::More tests => 9;

my $string = [
  { string => '[•REC]',             expected => '[*REC]' },
  { string => '“it’s the police!”', expected => '"it\'s the police!"'},
  { string => 'left ‘ quote',       expected => 'left ` quote'},
  { string => 'All…',               expected => 'All...'},
  { string => '‹Test›',             expected => '<Test>'},
  { string => '‚SINGLE„DOUBLE',     expected => ',SINGLE,,DOUBLE' },
  { string => 'ˆcircum',            expected => '^circum' },
  { string => 'perl–style',         expected => 'perl-style'},
  { string => 'perl—style',         expected => 'perl-style'},
  
];


foreach my $t (@{$string}){
  is(demoronize(decode('utf-8', $t->{string})), $t->{expected}, 'demoronisation');
}