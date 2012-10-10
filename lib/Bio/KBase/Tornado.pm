package Bio::KBase::Tornado;

use JSON::RPC::Client;
use strict;
use Data::Dumper;
use URI;
use Bio::KBase::Exceptions;

# Client version should match Impl version
# This is a Semantic Version number,
# http://semver.org
our $VERSION = "0.1.0";

=head1 NAME

Bio::KBase::Tornado

=head1 DESCRIPTION



=cut

sub new
{
    my($class, $url) = @_;

    my $self = {
	client => Bio::KBase::Tornado::RpcClient->new,
	url => $url,
    };
    my $ua = $self->{client}->ua;	 
    my $timeout = $ENV{CDMI_TIMEOUT} || (30 * 60);	 
    $ua->timeout($timeout);
    bless $self, $class;
    #    $self->_validate_version();
    return $self;
}




=head2 $result = align_reads(qc_project)



=cut

sub align_reads
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function align_reads (received $n, expecting 1)");
    }
    {
	my($qc_project) = @args;

	my @_bad_arguments;
        (ref($qc_project) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"qc_project\" (value was \"$qc_project\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to align_reads:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'align_reads');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "Tornado.align_reads",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'align_reads',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method align_reads",
					    status_line => $self->{client}->status_line,
					    method_name => 'align_reads',
				       );
    }
}



=head2 $result = preclustering(aligned_reads)



=cut

sub preclustering
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function preclustering (received $n, expecting 1)");
    }
    {
	my($aligned_reads) = @args;

	my @_bad_arguments;
        (ref($aligned_reads) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"aligned_reads\" (value was \"$aligned_reads\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to preclustering:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'preclustering');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "Tornado.preclustering",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'preclustering',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method preclustering",
					    status_line => $self->{client}->status_line,
					    method_name => 'preclustering',
				       );
    }
}



=head2 $result = link_otus(preclustered_reads)



=cut

sub link_otus
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function link_otus (received $n, expecting 1)");
    }
    {
	my($preclustered_reads) = @args;

	my @_bad_arguments;
        (ref($preclustered_reads) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"preclustered_reads\" (value was \"$preclustered_reads\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to link_otus:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'link_otus');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "Tornado.link_otus",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'link_otus',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method link_otus",
					    status_line => $self->{client}->status_line,
					    method_name => 'link_otus',
				       );
    }
}



=head2 $result = assign_taxonomy(aligned_reads)



=cut

sub assign_taxonomy
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function assign_taxonomy (received $n, expecting 1)");
    }
    {
	my($aligned_reads) = @args;

	my @_bad_arguments;
        (ref($aligned_reads) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"aligned_reads\" (value was \"$aligned_reads\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to assign_taxonomy:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'assign_taxonomy');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "Tornado.assign_taxonomy",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'assign_taxonomy',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method assign_taxonomy",
					    status_line => $self->{client}->status_line,
					    method_name => 'assign_taxonomy',
				       );
    }
}



=head2 $result = fastq_to_fasta(fastq_files)

funcdef demultiplex_illumina(readOne,readTwo,index) returns ();

=cut

sub fastq_to_fasta
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function fastq_to_fasta (received $n, expecting 1)");
    }
    {
	my($fastq_files) = @args;

	my @_bad_arguments;
        (ref($fastq_files) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument 1 \"fastq_files\" (value was \"$fastq_files\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to fastq_to_fasta:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'fastq_to_fasta');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "Tornado.fastq_to_fasta",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'fastq_to_fasta',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method fastq_to_fasta",
					    status_line => $self->{client}->status_line,
					    method_name => 'fastq_to_fasta',
				       );
    }
}



sub version {
    my ($self) = @_;
    my $result = $self->{client}->call($self->{url}, {
        method => "Tornado.version",
        params => [],
    });
    if ($result) {
        if ($result->is_error) {
            Bio::KBase::Exceptions::JSONRPC->throw(
                error => $result->error_message,
                code => $result->content->{code},
                method_name => 'fastq_to_fasta',
            );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(
            error => "Error invoking method fastq_to_fasta",
            status_line => $self->{client}->status_line,
            method_name => 'fastq_to_fasta',
        );
    }
}

sub _validate_version {
    my ($self) = @_;
    my $svr_version = $self->version();
    my $client_version = $VERSION;
    my ($cMajor, $cMinor) = split(/\./, $client_version);
    my ($sMajor, $sMinor) = split(/\./, $svr_version);
    if ($sMajor != $cMajor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Major version numbers differ.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor < $cMinor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Client minor version greater than Server minor version.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor > $cMinor) {
        warn "New client version available for Bio::KBase::Tornado\n";
    }
    if ($sMajor == 0) {
        warn "Bio::KBase::Tornado version is $svr_version. API subject to change.\n";
    }
}

package Bio::KBase::Tornado::RpcClient;
use base 'JSON::RPC::Client';

#
# Override JSON::RPC::Client::call because it doesn't handle error returns properly.
#

sub call {
    my ($self, $uri, $obj) = @_;
    my $result;

    if ($uri =~ /\?/) {
       $result = $self->_get($uri);
    }
    else {
        Carp::croak "not hashref." unless (ref $obj eq 'HASH');
        $result = $self->_post($uri, $obj);
    }

    my $service = $obj->{method} =~ /^system\./ if ( $obj );

    $self->status_line($result->status_line);

    if ($result->is_success) {

        return unless($result->content); # notification?

        if ($service) {
            return JSON::RPC::ServiceObject->new($result, $self->json);
        }

        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    elsif ($result->content_type eq 'application/json')
    {
        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    else {
        return;
    }
}

1;
