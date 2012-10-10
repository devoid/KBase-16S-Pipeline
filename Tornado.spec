module Tornado
{
    typedef string read_degeneracy_file_id;
    typedef string group_file_id;
    typedef string read_file_id;
    typedef string preclustered_reads_file_id; 
    typedef string read_otu_file_id;
    typedef string read_taxonomy_file_id;


    typedef string qual_file_id;
    typedef string fasta_file_id;
    typedef string fastq_file_id;
    
    typedef list<qual_file_id> qual_files;
    typedef list<fasta_file_id> fasta_files;
    typedef list<fastq_file_id> fastq_files;
    
    typedef structure {
		group_file_id group_file;
		read_degeneracy_file_id read_degeneracy_file_1;
		read_degeneracy_file_id read_degeneracy_file_2;
		read_file_id read_file_one;
		read_file_id read_file_two;
    } qc_project;
    
    typedef string alignment_file_id;
    
    typedef structure {
		qc_project input_qc;
		group_file_id group_file;
		read_degeneracy_file_id read_degeneracy_file_one;
		read_degeneracy_file_id read_degeneracy_file_two;
		alignment_file_id alignment_file_one;
		alignment_file_id alignment_file_two;
    } aligned_reads;
    
    typedef structure {
		aligned_reads input_alignment;
		preclustered_reads_file_id preclustered_reads_file;
		read_degeneracy_file_id read_degeneracy_file;
    } preclustered_reads;
    
    typedef structure {
		aligned_reads input_alignment;
		read_otu_file_id read_otu_file;
		read_degeneracy_file_id read_degeneracy_file;
    } read_otu;
    
    typedef structure {
		aligned_reads input_alignment;
		read_taxonomy_file_id read_taxonomy_file;
		read_degeneracy_file_id read_degeneracy_file;
    } read_taxonomy;
    
    funcdef align_reads(qc_project) returns (aligned_reads);
    funcdef preclustering(aligned_reads) returns (preclustered_reads);
    funcdef link_otus(preclustered_reads) returns (read_otu);
    funcdef assign_taxonomy(aligned_reads) returns (read_taxonomy);
    /* funcdef demultiplex_illumina(readOne,readTwo,index) returns (); */
    funcdef fastq_to_fasta(fastq_files) returns (fasta_files, qual_files);
};
