package HsdbApp::Action::Login::Post;

use strict;
use warnings;
use utf8;

use Digest::MD5 qw( md5_hex );
use Hsdb::DB;
use base 'HsdbApp::Action';

sub main {
	my ($self) = @_;

	my $password       = $self->params->{password};
	my $email          = $self->params->{email};
	my $zombi_check    = $self->params->{zombi_check} || '';

	unless ($password) {
		return $self->error("Укажите пароль");
	}
	
	unless ($email) {
		return $self->error("Укажите свой e-mail");
	}

	my $user = schema->resultset('User')->search({
		email    => $email,
		password => md5_hex($password),
	})->single;

	return $user
		? 1
		: $self->error("Пользователь не найден");
}

1;
