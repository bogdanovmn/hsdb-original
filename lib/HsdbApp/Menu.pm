package HsdbApp::Menu;

use strict;
use warnings;
use utf8;


sub init {
	my ($class, $current) = @_;

	return bless { current => $current }, $class;
}

sub prepare {
	my ($self) = @_;

	return [
		map { 
			if ($self->{current} eq $_->{id}) {
				$_->{current} = 1;
			}
			$_;
		}
		$self->_menu
	];
}

sub _menu {
	my ($self) = @_;

	return (
		{ id => 'collection_in' , title => 'Моя коллекция'      , url => '/collection/in/'  },
		{ id => 'collection_out', title => 'Пополнить коллекцию', url => '/collection/out/' },
#		{ id => 'booster'       , title => 'Купить бустер'      , url => '/booster/'        },
	);
}

1;
