package HsdbApp::Action;

use strict;
use warnings;
use utf8;


sub error { 
	my ($self, $msg) = @_;

	if ($msg) {
		$self->params->{last_err}->{msg} = $msg;
		return 0;
	}
	else {
		$self->params->{last_err}->{msg};
	}
	
}

1;
