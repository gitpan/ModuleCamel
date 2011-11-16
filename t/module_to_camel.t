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

my %module_to_camel = (
    'Test'            => 'test',
    'Test::App'       => 'test_app',
    'test_app'        => 'test_app',
    'hello my friend' => 'hello_my_friend',
    'Test::'          => 'test_',
);

plan tests => scalar keys %module_to_camel;

while ( my ( $module_string, $camel_string ) = each %module_to_camel ) {
    is( module_to_camel($module_string),
        $camel_string, "$module_string is transformed into $camel_string" );
}

done_testing;
