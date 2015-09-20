package HsdbApp;

use strict;
use warnings;
use utf8;

use Dancer ':syntax';
use Dancer::Plugin::Controller '0.153';

our $VERSION = '0.1';

use HsdbApp::Action::Index;

use HsdbApp::Action::Register::Form;
use HsdbApp::Action::Register::Post;

use HsdbApp::Action::Login::Form;
use HsdbApp::Action::Login::Post;

use HsdbApp::Action::Auth;


sub show_error { controller(template => 'error', action => 'Error') }

hook 'before' => sub {
	var user_id  => Dancer::session('user_id');
	var last_err => {msg => ''};

	if (not vars->{user_id} and request->path !~ '^/(login|register)/$') {
		redirect '/login/'; 
	}
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


any qr#/auth/(in|out)# => sub { 
	my ($action) = splat;

	var action => $action;
	if (controller(action => 'Auth')) {
		redirect request->referer;
	}
	else {
		show_error;
	}
};

any qr{.*} => sub { controller(template => 'not_found') };

true;
