package HsdbApp::Action::Login::Form;

use strict;
use warnings;
use utf8;


sub main {
	my ($self) = @_;

	my $name    = $self->params->{name};
	my $email   = $self->params->{email};

	return {
		error_msg => $self->error,
	};
}

1;
