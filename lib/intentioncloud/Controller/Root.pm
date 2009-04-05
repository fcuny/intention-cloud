package intentioncloud::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

__PACKAGE__->config->{ namespace } = '';

sub about : Local {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'others/what.tt';
}

sub who : Local {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'others/who.tt';
}

sub why : Local {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'others/why.tt';
}

sub how : Local {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'others/how.tt';
}

sub index : Local {
    my ( $self, $c ) = @_;
    $c->stash->{ template } = 'cloud/search.tt';
    $c->stash( last_clouds =>
            [ $c->model( 'DB::Search' )->search()->slice( 0, 2 ) ] );
}

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;
    $c->forward('intentioncloud::View::TT');
}

1;
