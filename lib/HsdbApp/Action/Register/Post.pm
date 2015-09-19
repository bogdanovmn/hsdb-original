package HsdbApp::Action::Register::Post;

use strict;
use warnings;
use utf8;

use Digest::MD5 qw( md5_hex );
use Hsdb::DB;


sub main {
	my ($self) = @_;

	my $name           = $self->params->{name};
	my $password       = $self->params->{password};
	my $password_check = $self->params->{password_check};
	my $email          = $self->params->{email};
	my $zombi_check    = $self->params->{zombi_check} || '';
	my $ip             = $self->params->{ip} || '';

	unless ($zombi_check eq 4) {
		return $self->error("Zombie detected");
	}

	unless ($name) {
		return $self->error("Укажите свое имя");
	}

	unless ($password) {
		return $self->error("Укажите пароль");
	}
	
	unless ($password_check) {
		return $self->error("Укажите пароль еще разок");
	}

	unless ($email) {
		return $self->error("Укажите свой e-mail");
	}

	my $user = schema->resultset('User')->search({
		email    => $email,
	})->single;

	if ($user) {
		return $self->error('Пользователь с таким E-mail уже зареген');
	}

	$user = schema->resultset('User')->create({
		name     => $name, 
		email    => $email,
		password => md5_hex($password),
		ip       => $ip,
	});

	return $user
		? 1
		: $self->error("Что-то пошло не так...");
}

1;
