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
    $c->stash(
        last_clouds => [ $c->model( 'DB::Search' )->search()->slice( 0, 2 ) ]
    );
}

sub lang : Regex('^lang/(\w{2})$') {
    my ( $self, $c ) = @_;

    my $lang = $c->req->captures->[ 0 ];
    $c->languages( $lang );
    $c->session->{ lang } = $lang;
    if ( $c->session->{ referer } ) {
        $c->stash->{ template } = $c->session->{ referer };
    } else {

        $c->forward( '/index' );
    }
}

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;
    $c->session->{referer} = $c->stash->{template};
    if (defined $c->session->{'lang'}){
        $c->languages( [ $c->session->{'lang'} ]);
    }
    $c->forward( 'intentioncloud::View::TT' );
}

1;
