use strict;
use warnings;
use Test::More tests => 6;

BEGIN { use_ok 'Catalyst::Test', 'intentioncloud' }

ok( request( '/' )->is_success, 'Request should succeed' );

ok( request( '/how' )->is_success,   '... request how is success' );
ok( request( '/about' )->is_success, '... request about is success' );
ok( request( '/who' )->is_success,   '... request who is success' );
ok( request( '/why' )->is_success,   '... request why is success' );
