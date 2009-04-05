package intentioncloud::Model::Search;

use WebService::Google::Suggest;
use HTML::TagCloud;
use YAML::Syck;
use DateTime;
use URI::Escape;

sub search {
    my ( $self, $c ) = @_;

    my $search = $c->req->params->{ q } . " ";
    $c->stash( query => $search, dt => DateTime->now );

    $c->stash(cloud_permalink => $c->stash->{dt}->ymd( '/' ) . '/'
            . $c->req->params->{ engine } . '/'
            . uri_escape( $c->req->params->{ q } ) );
    my $cloud = $c->model( 'DB::Search' )
        ->find( { permalink => $c->stash->{ cloud_permalink } } );
    if ( $cloud ) {
        $c->stash( cloud => $cloud->cloud );
        return;
    }

    if ( $c->req->params->{ engine } eq 'google' ) {
        $self->google_search( $c );
    }
    $self->save_search( $c ) if ( $c->stash->{ cloud } );
}

sub google_search {
    my ( $self, $c ) = @_;

    my $cloud   = HTML::TagCloud->new();
    my $suggest = WebService::Google::Suggest->new();

    my $suggests = 0;
    foreach ( $suggest->complete( $search ) ) {
        $suggests++;
        if ( $_->{ results } > 0 ) {
            $cloud->add( $_->{ query }, 'blah', $_->{ results } );
        }
    }
    if ( $suggests ) {
        $c->stash( cloud => $cloud->html_and_css() );
    } else {
        $c->stash( no_suggest => "no suggestions :(" );
    }
}

sub save_search {
    my ( $self, $c ) = @_;

    $c->model( 'DB::Search' )->create(
        {   engine       => $c->req->params->{ engine },
            cloud        => $c->stash->{ cloud },
            date_created => $c->stash->{dt},
            query        => $c->req->params->{ q },
            permalink    => $c->stash->{ cloud_permalink },
        }
    );
}

1;
