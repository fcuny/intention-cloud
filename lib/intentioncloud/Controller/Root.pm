package intentioncloud::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{ namespace } = '';

=head1 NAME

intentioncloud::Controller::Root - Root Controller for intentioncloud

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub about : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'others/what.tt';
}

sub who : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'others/who.tt';
}

sub why : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'others/why.tt';
}

sub how : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'others/how.tt';
}

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'cloud/search.tt';

}


=head2 end

Attempt to render a view, if needed.

=cut 

sub end : ActionClass('RenderView') {
}

=head1 AUTHOR

franck cuny,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
