package intentioncloud::Controller::Cloud;

use strict;
use warnings;
use parent 'Catalyst::Controller';

sub old_cloud : Regex('^(\d{4})/(\d{2})/(\d{2})/(\w+)/(.*$)') {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'cloud/old_cloud.tt';

    my $cloud
        = $c->model( 'DB::Search' )->find( { permalink => $c->req->path } );
    if ( $cloud ) {
        $c->stash( cloud => $cloud );
    } else {
    }
}

sub search : Local {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'cloud/cloud.tt';

    $c->model( 'Search' )->search( $c );
}

sub random : Local {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'cloud/random.tt';

    $c->stash( cloud => $c->model( 'DB::Search' )
            ->find( {}, { order_by => [ 'rand()' ] } ) );
}

1;

=head1 NAME

intentioncloud::Controller::Cloud - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS


=head1 AUTHOR

franck cuny,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.
