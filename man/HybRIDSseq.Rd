% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{class}
\name{HybRIDSseq}
\alias{HybRIDSseq}
\title{An internal Reference Class to represent a DNA alignment, read from a FASTA file.}
\description{
An internal Reference Class to represent a DNA alignment, read from a FASTA file.
}
\section{Fields}{

\describe{
\item{\code{FullSequence}}{A Matrix (of Characters) containing the full sequence alignment.}

\item{\code{InformativeSequence}}{A matrix (of Characters) containing the elignment, with uninformative sites removed.}
}}
\section{Methods}{

\describe{
\item{\code{InputDNA(intarget, format)}}{Reads in sequences from file and appropriately modifies fields of the object.}

\item{\code{enforceDNA()}}{Enforces some rules about the content of the sequence object and throws errors should they occur.}

\item{\code{getFullBp()}}{Returns the }

\item{\code{hasDNA()}}{Returns true if a DNA sequence alignment has been read in and stored in the object. Otherwise returns false.}

\item{\code{initialize(sequenceInput = NULL)}}{Initializes the object, may be provided with a filepath to a sequence file, currently only FASTA is supported.}

\item{\code{numberOfSequences()}}{Returns the number of sequences in the stored alignment.}
}}

