package intentioncloud::Model::Search;

use WebService::Google::Suggest;
use HTML::TagCloud;
use YAML::Syck;
use DateTime;
use URI::Escape;

sub search {
    my ( $self, $c ) = @_;
    if ( $c->req->params->{ engine } eq 'google' ) {
        $self->google_search( $c );
    }
    $self->save_search( $c ) if ( $c->stash->{ cloud } );
}

sub google_search {
    my ( $self, $c ) = @_;

    my $cloud   = HTML::TagCloud->new();
    my $suggest = WebService::Google::Suggest->new();
    my $search  = $c->req->params->{ q } . " ";
    $c->stash( query => $search );

    my $suggests = 0;
    foreach ( $suggest->complete( $search ) ) {
        $suggests++;
        if ( $_->{ results } > 0 ) {
            $cloud->add( $_->{ query }, 'blah', $_->{ results } );
        }
    }
    if ( $suggests ) {
        $c->stash( cloud => $cloud->html_and_css());
    } else {
        $c->stash( no_suggest => "no suggestions :(" );
    }
}

sub save_search {
    my ( $self, $c ) = @_;
    my $dt = DateTime->now;

    my $permalink
        = $dt->ymd( '/' ) . '/'
        . $c->req->params->{ engine } . '/'
        . uri_escape( $c->req->params->{ q } );

    $c->model( 'DB::Search' )->create(
        {   engine       => $c->req->params->{ engine },
            cloud        => $c->stash->{ suggest },
            date_created => $dt,
            query        => $c->req->params->{ q },
            permalink    => $permalink,
        }
    );
}

1;
