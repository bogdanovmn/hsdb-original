package HsdbApp;

use strict;
use warnings;
use utf8;

use Dancer ':syntax';
use Dancer::Plugin::Controller '0.153';

our $VERSION = '0.1';

use Hsdb::DB;

use HsdbApp::Action::Index;

use HsdbApp::Action::Register::Form;
use HsdbApp::Action::Register::Post;

use HsdbApp::Action::Login::Form;
use HsdbApp::Action::Login::Post;


sub show_error { controller(template => 'error', action => 'Error') }

hook 'before' => sub {
	var user_id  => Dancer::session('user_id');
	var last_err => {msg => ''};

	my $logged_user_area = request->path !~ '^/(login|register)/$';
	if (vars->{user_id}) {
		if (not $logged_user_area) {
			redirect '/';
		}

		my $user = schema->resultset('User')->find(vars->{user_id});
		if ($user) {
			var user_name => $user->name;
		}
		else {
			redirect '/register/';
		}
	}
	else {
		if ($logged_user_area) {
			redirect '/login/';
		}
	}

};

hook 'before_template_render' => sub {
	my ($template_params) = @_;

	$template_params->{user_id}   = vars->{user_id};
	$template_params->{user_name} = vars->{user_name};
};

###########
# Routes
###########

get '/' => sub { controller(template => 'index', action => 'Index') };

get  '/register/' => sub { controller(template => 'register', action => 'Register::Form') };
post '/register/' => sub { 
	if (controller(action => 'Register::Post')) {
		redirect '/';
	}
	else {
		controller(template => 'register', action => 'Register::Form');
	}
};

get  '/login/' => sub { controller(template => 'login', action => 'Login::Form') };
post '/login/' => sub { 
	my $user_id = controller(action => 'Login::Post');
	if ($user_id) {
		session user_id => $user_id;
		redirect '/';
	}
	else {
		controller(template => 'login', action => 'Login::Form');
	}
};


any '/logout/' => sub {
	session->destroy;
	redirect '/login/';
};

any qr{.*} => sub { controller(template => 'not_found') };

true;
