package intentioncloud::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'intentioncloud::Schema',
);

1;

=head1 NAME

intentioncloud::Model::DB - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<intentioncloud>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<intentioncloud::Schema>

=head1 AUTHOR

franck cuny,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.
