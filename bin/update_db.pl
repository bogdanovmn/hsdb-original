#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use FindBin;
use lib $FindBin::Bin. '/../lib';

use Hsdb::Import;


my $import = Hsdb::Import->new;
$import->run;
