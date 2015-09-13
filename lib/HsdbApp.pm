package HsdbApp;

use strict;
use warnings;
use utf8;

use Dancer ':syntax';
use Dancer::Plugin::Controller '0.152';

our $VERSION = '0.1';

use HsdbApp::Action::Index;


get '/'    => sub { controller(template => 'index', action => 'Index') };
any qr{.*} => sub { controller(template => 'not_found') };

true;
