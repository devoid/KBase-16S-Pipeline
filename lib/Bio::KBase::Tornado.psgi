use Bio::KBase::Tornado::Impl;

use Bio::KBase::Tornado::Server;



my @dispatch;

{
    my $obj = Bio::KBase::Tornado::Impl->new;
    push(@dispatch, 'Tornado' => $obj);
}


my $server = Bio::KBase::Tornado::Server->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler;
