package Bio::KBase::Tornado::Impl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org 
our $VERSION = "0.1.0";

=head1 NAME

Tornado

=head1 DESCRIPTION



=cut

#BEGIN_HEADER
use File::Temp qw(tempdir);
use LWP::Simple qw(getstore mirror);

sub shock_server {
    my ($self, $val) = @_;
    $self->{_shock_server} = $val if $val;
    return $self->{_shock_server};
}

sub shock_copy_file {
    my ($self, $uuid, $path) = @_;
    my $url = $self->shock_server . "/node/$uuid?download";
    return getstore($url, $path);
}
#END_HEADER

sub new
{
    my($class, @args) = @_;
    my $self = {
    };
    bless $self, $class;
    #BEGIN_CONSTRUCTOR
    $self->shock_server("http://kbase.us/services/shock-api");
    #END_CONSTRUCTOR

    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}

=head1 METHODS



=head2 align_reads

  $return = $obj->align_reads($qc_project)

=over 4

=item Parameter and return types

=begin html

<pre>
$qc_project is a qc_project
$return is an aligned_reads
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
alignment_file_id is a string

</pre>

=end html

=begin text

$qc_project is a qc_project
$return is an aligned_reads
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
alignment_file_id is a string


=end text



=item Description



=back

=cut

sub align_reads
{
    my $self = shift;
    my($qc_project) = @_;

    my @_bad_arguments;
    (ref($qc_project) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"qc_project\" (value was \"$qc_project\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to align_reads:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'align_reads');
    }

    my $ctx = $Bio::KBase::Tornado::Server::CallContext;
    my($return);
    #BEGIN align_reads
    #END align_reads
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to align_reads:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'align_reads');
    }
    return($return);
}




=head2 preclustering

  $return = $obj->preclustering($aligned_reads)

=over 4

=item Parameter and return types

=begin html

<pre>
$aligned_reads is an aligned_reads
$return is a preclustered_reads
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
alignment_file_id is a string
preclustered_reads is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	preclustered_reads_file has a value which is a preclustered_reads_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
preclustered_reads_file_id is a string

</pre>

=end html

=begin text

$aligned_reads is an aligned_reads
$return is a preclustered_reads
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
alignment_file_id is a string
preclustered_reads is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	preclustered_reads_file has a value which is a preclustered_reads_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
preclustered_reads_file_id is a string


=end text



=item Description



=back

=cut

sub preclustering
{
    my $self = shift;
    my($aligned_reads) = @_;

    my @_bad_arguments;
    (ref($aligned_reads) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"aligned_reads\" (value was \"$aligned_reads\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to preclustering:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'preclustering');
    }

    my $ctx = $Bio::KBase::Tornado::Server::CallContext;
    my($return);
    #BEGIN preclustering
    #END preclustering
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to preclustering:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'preclustering');
    }
    return($return);
}




=head2 link_otus

  $return = $obj->link_otus($preclustered_reads)

=over 4

=item Parameter and return types

=begin html

<pre>
$preclustered_reads is a preclustered_reads
$return is a read_otu
preclustered_reads is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	preclustered_reads_file has a value which is a preclustered_reads_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
alignment_file_id is a string
preclustered_reads_file_id is a string
read_otu is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	read_otu_file has a value which is a read_otu_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
read_otu_file_id is a string

</pre>

=end html

=begin text

$preclustered_reads is a preclustered_reads
$return is a read_otu
preclustered_reads is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	preclustered_reads_file has a value which is a preclustered_reads_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
alignment_file_id is a string
preclustered_reads_file_id is a string
read_otu is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	read_otu_file has a value which is a read_otu_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
read_otu_file_id is a string


=end text



=item Description



=back

=cut

sub link_otus
{
    my $self = shift;
    my($preclustered_reads) = @_;

    my @_bad_arguments;
    (ref($preclustered_reads) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"preclustered_reads\" (value was \"$preclustered_reads\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to link_otus:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'link_otus');
    }

    my $ctx = $Bio::KBase::Tornado::Server::CallContext;
    my($return);
    #BEGIN link_otus
    #END link_otus
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to link_otus:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'link_otus');
    }
    return($return);
}




=head2 assign_taxonomy

  $return = $obj->assign_taxonomy($aligned_reads)

=over 4

=item Parameter and return types

=begin html

<pre>
$aligned_reads is an aligned_reads
$return is a read_taxonomy
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
alignment_file_id is a string
read_taxonomy is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	read_taxonomy_file has a value which is a read_taxonomy_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
read_taxonomy_file_id is a string

</pre>

=end html

=begin text

$aligned_reads is an aligned_reads
$return is a read_taxonomy
aligned_reads is a reference to a hash where the following keys are defined:
	input_qc has a value which is a qc_project
	group_file has a value which is a group_file_id
	read_degeneracy_file_one has a value which is a read_degeneracy_file_id
	read_degeneracy_file_two has a value which is a read_degeneracy_file_id
	alignment_file_one has a value which is an alignment_file_id
	alignment_file_two has a value which is an alignment_file_id
qc_project is a reference to a hash where the following keys are defined:
	group_file has a value which is a group_file_id
	read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
	read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
	read_file_one has a value which is a read_file_id
	read_file_two has a value which is a read_file_id
group_file_id is a string
read_degeneracy_file_id is a string
read_file_id is a string
alignment_file_id is a string
read_taxonomy is a reference to a hash where the following keys are defined:
	input_alignment has a value which is an aligned_reads
	read_taxonomy_file has a value which is a read_taxonomy_file_id
	read_degeneracy_file has a value which is a read_degeneracy_file_id
read_taxonomy_file_id is a string


=end text



=item Description



=back

=cut

sub assign_taxonomy
{
    my $self = shift;
    my($aligned_reads) = @_;

    my @_bad_arguments;
    (ref($aligned_reads) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"aligned_reads\" (value was \"$aligned_reads\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to assign_taxonomy:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'assign_taxonomy');
    }

    my $ctx = $Bio::KBase::Tornado::Server::CallContext;
    my($return);
    #BEGIN assign_taxonomy
    my $tempdir = tempdir();
    # Get the file contents 
    my $ids = {
        "r1.fasta"  => $aligned_reads->{alignment_file_one},
        "r2.fasta"  => $aligned_reads->{alignment_file_two},
        "r1.names"  => $aligned_reads->{read_degeneracy_file_one},
        "r2.names"  => $aligned_reads->{read_degeneracy_file_two},
        "g.groups"  => $aligned_reads->{group_file},
    };
    foreach my $key (keys %$ids) {
        $self->shock_copy_file($ids->{$key}, "$tempdir/$key");
    }
    # Call mothur script
    system(
        "tornado-tax-prep.sh $tempdir ".
        "$tempdir/r1.fasta $tempdir/r2.fasta ".
        "$tempdir/r1.names $tempdir/r2.names ".
        "$tempdir/g.groups"
    );
    my $fasta_filename = "$tempdir/for_taxonomy.fasta";
    system("mothur '#classify.seqs(fasta=$fasta_filename, reference=$taxa_one_filename, taxonomy=$taxa_two_filename, processors=$cpu_count)");

    # Process results from mothur

    # And return results

    #END assign_taxonomy
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to assign_taxonomy:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'assign_taxonomy');
    }
    return($return);
}




=head2 fastq_to_fasta

  $return_1, $return_2 = $obj->fastq_to_fasta($fastq_files)

=over 4

=item Parameter and return types

=begin html

<pre>
$fastq_files is a fastq_files
$return_1 is a fasta_files
$return_2 is a qual_files
fastq_files is a reference to a list where each element is a fastq_file_id
fastq_file_id is a string
fasta_files is a reference to a list where each element is a fasta_file_id
fasta_file_id is a string
qual_files is a reference to a list where each element is a qual_file_id
qual_file_id is a string

</pre>

=end html

=begin text

$fastq_files is a fastq_files
$return_1 is a fasta_files
$return_2 is a qual_files
fastq_files is a reference to a list where each element is a fastq_file_id
fastq_file_id is a string
fasta_files is a reference to a list where each element is a fasta_file_id
fasta_file_id is a string
qual_files is a reference to a list where each element is a qual_file_id
qual_file_id is a string


=end text



=item Description

funcdef demultiplex_illumina(readOne,readTwo,index) returns ();

=back

=cut

sub fastq_to_fasta
{
    my $self = shift;
    my($fastq_files) = @_;

    my @_bad_arguments;
    (ref($fastq_files) eq 'ARRAY') or push(@_bad_arguments, "Invalid type for argument \"fastq_files\" (value was \"$fastq_files\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to fastq_to_fasta:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'fastq_to_fasta');
    }

    my $ctx = $Bio::KBase::Tornado::Server::CallContext;
    my($return_1, $return_2);
    #BEGIN fastq_to_fasta
    #END fastq_to_fasta
    my @_bad_returns;
    (ref($return_1) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"return_1\" (value was \"$return_1\")");
    (ref($return_2) eq 'ARRAY') or push(@_bad_returns, "Invalid type for return variable \"return_2\" (value was \"$return_2\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to fastq_to_fasta:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'fastq_to_fasta');
    }
    return($return_1, $return_2);
}




=head2 version 

  $return = $obj->version()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a string
</pre>

=end html

=begin text

$return is a string

=end text

=item Description

Return the module version. This is a Semantic Versioning number.

=back

=cut

sub version {
    return $VERSION;
}

=head1 TYPES



=head2 read_degeneracy_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 group_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 read_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 preclustered_reads_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 read_otu_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 read_taxonomy_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 qual_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 fasta_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 fastq_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 qual_files

=over 4



=item Definition

=begin html

<pre>
a reference to a list where each element is a qual_file_id
</pre>

=end html

=begin text

a reference to a list where each element is a qual_file_id

=end text

=back



=head2 fasta_files

=over 4



=item Definition

=begin html

<pre>
a reference to a list where each element is a fasta_file_id
</pre>

=end html

=begin text

a reference to a list where each element is a fasta_file_id

=end text

=back



=head2 fastq_files

=over 4



=item Definition

=begin html

<pre>
a reference to a list where each element is a fastq_file_id
</pre>

=end html

=begin text

a reference to a list where each element is a fastq_file_id

=end text

=back



=head2 qc_project

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
group_file has a value which is a group_file_id
read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
read_file_one has a value which is a read_file_id
read_file_two has a value which is a read_file_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
group_file has a value which is a group_file_id
read_degeneracy_file_1 has a value which is a read_degeneracy_file_id
read_degeneracy_file_2 has a value which is a read_degeneracy_file_id
read_file_one has a value which is a read_file_id
read_file_two has a value which is a read_file_id


=end text

=back



=head2 alignment_file_id

=over 4



=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 aligned_reads

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
input_qc has a value which is a qc_project
group_file has a value which is a group_file_id
read_degeneracy_file_one has a value which is a read_degeneracy_file_id
read_degeneracy_file_two has a value which is a read_degeneracy_file_id
alignment_file_one has a value which is an alignment_file_id
alignment_file_two has a value which is an alignment_file_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
input_qc has a value which is a qc_project
group_file has a value which is a group_file_id
read_degeneracy_file_one has a value which is a read_degeneracy_file_id
read_degeneracy_file_two has a value which is a read_degeneracy_file_id
alignment_file_one has a value which is an alignment_file_id
alignment_file_two has a value which is an alignment_file_id


=end text

=back



=head2 preclustered_reads

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
input_alignment has a value which is an aligned_reads
preclustered_reads_file has a value which is a preclustered_reads_file_id
read_degeneracy_file has a value which is a read_degeneracy_file_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
input_alignment has a value which is an aligned_reads
preclustered_reads_file has a value which is a preclustered_reads_file_id
read_degeneracy_file has a value which is a read_degeneracy_file_id


=end text

=back



=head2 read_otu

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
input_alignment has a value which is an aligned_reads
read_otu_file has a value which is a read_otu_file_id
read_degeneracy_file has a value which is a read_degeneracy_file_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
input_alignment has a value which is an aligned_reads
read_otu_file has a value which is a read_otu_file_id
read_degeneracy_file has a value which is a read_degeneracy_file_id


=end text

=back



=head2 read_taxonomy

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
input_alignment has a value which is an aligned_reads
read_taxonomy_file has a value which is a read_taxonomy_file_id
read_degeneracy_file has a value which is a read_degeneracy_file_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
input_alignment has a value which is an aligned_reads
read_taxonomy_file has a value which is a read_taxonomy_file_id
read_degeneracy_file has a value which is a read_degeneracy_file_id


=end text

=back



=cut

1;
