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

use HsdbApp::Action::Collection;
use HsdbApp::Action::Collection::Modify;


sub show_error { controller(template => 'error', action => 'Error') }

hook 'before' => sub {
	set 'session_options' => { 
		dbh   => sub { schema->storage->dbh },
		table => 'session',
	};

	var user_id  => session('user_id');
	var last_err => {msg => ''};

	warning vars->{user_id};

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

get  '/register/' => sub { controller(template => 'register', action => 'Register::Form', layout => 'minimal') };
post '/register/' => sub { 
	if (controller(action => 'Register::Post')) {
		redirect '/';
	}
	else {
		controller(template => 'register', action => 'Register::Form', layout => 'minimal');
	}
};

get  '/login/' => sub { controller(template => 'login', action => 'Login::Form', layout => 'minimal') };
post '/login/' => sub { 
	my $user_id = controller(action => 'Login::Post');
	if ($user_id) {
		session user_id => $user_id;
		session->flush;
		redirect '/';
	}
	else {
		controller(template => 'login', action => 'Login::Form', layout => 'minimal');
	}
};


any '/logout/' => sub {
	session->destroy;
	redirect '/login/';
};

get qr{/collection/(in|out)/} => sub {
	my ($type) = splat;

	var type => $type;
	controller(template => 'collection', action => 'Collection');
};

get qr{/(add|del)/(common|gold)/([1-9]\d*)/} => sub {
	my ($action, $card_view, $card_id) = splat;

	var action    => $action;
	var card_view => $card_view;
	var card_id   => $card_id;

	controller(action => 'Collection::Modify');
}

any qr{.*} => sub { controller(template => 'not_found', layout => 'minimal') };

true;
