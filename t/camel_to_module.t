#!perl
#
# This file is part of ModuleCamel
#
# This software is copyright (c) 2011 by Geistteufel <geistteufel@celogeek.fr>.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use strict;
use warnings;

use Module::Camel ':all';
use Test::More;    # last test to print

my %camel_to_module = (
    'test'            => 'Test',
    'test_'           => 'Test::',
    'test_app'        => 'Test::App',
    'test::app'       => 'Test::App',
    'test__app'       => 'Test::App',
    'test29'          => 'Test29',
    'test_29'         => 'Test::29',
    "hello my friend" => 'Hello::My::Friend',
);

plan tests => scalar keys %camel_to_module;

while ( my ( $camel_string, $module_string ) = each %camel_to_module ) {
    is( camel_to_module($camel_string),
        $module_string, "$camel_string is transformed into $module_string" );
}

done_testing;
