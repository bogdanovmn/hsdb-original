package HsdbApp::Action::Auth;

use strict;
use warnings;
use utf8;

use Digest::MD5 qw( md5_hex );

sub main {
	my ($self) = @_;
	
	my $action   = $self->params->{action} || 'bot';
	my $name     = $self->params->{name};
	my $password = $self->params->{password};
	my $user_id  = $self->params->{user_id};

	if ($action eq 'in' and not $user_id) {
		return $self->_login(
			user_name => $name, 
			password  => $password
		);
	}
	elsif ($action eq 'out' and $user_id) {
		return $self->_logout;
	}
	else {
		return $self->error("Вы заблудились?");
	}
}

sub _login {
	my ($self, %p) = @_;

	if (not $p{user_name} or not $p{password}) {
		return $self->error("Введите логин и пароль!");
	}

	my $user_info = schema->resultset('User')->search({ 
		name     => $p{user_name},
		password => md5_hex($p{password})
	})->single;
   
	if ($user_info) {
		Dancer::session("user_id", $user_info->id);
	}
	else {
		return $self->error("Неправильный логин/пароль!");
	}

	return 1;
}
#
# Logout from the system
#
sub _logout {
	my ($self, %p) = @_; 
	
	Dancer::session->destroy;

	return 1;
}

1;
