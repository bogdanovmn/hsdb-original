package HsdbApp::Action::Collection::Modify;

use strict;
use warnings;
use utf8;

use Hsdb::DB;


sub main {
	my ($self) = @_;

	my $count     = $self->params->{count};
	my $card_id   = $self->params->{card_id};
	my $user_id   = $self->params->{user_id};
	my $card_view = $self->params->{card_view};

	my $collection = schema
		->resultset('Collection')
		->search({ 
			user_id => $self->params->{user_id},
			card_id => $self->params->{card_id}
		})
		->single;

	if ($collection) {
		$collection->update({
			($card_view.'_count') => $count
		});
		unless ($collection->norm_count + $collection->gold_count) {
			$collection->delete;
		}
	}
	else {
		if ($count) {
			schema->resultset('Collection')->create({
				user_id               => $user_id,
				card_id               => $card_id,
				($card_view.'_count') => $count
			});
		}
	}

	return 'OK';
}


1;
