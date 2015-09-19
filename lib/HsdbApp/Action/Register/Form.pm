package HsdbApp::Action::Register::Form;

use strict;
use warnings;
use utf8;


sub main {
	my ($self) = @_;

	my $name           = $self->params->{name};
	my $password       = $self->params->{password};
	my $password_check = $self->params->{password_check};
	my $email          = $self->params->{email};


	return {
		error_msg => $self->error,
	};
}

1;
