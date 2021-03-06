% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{class}
\name{Triplet}
\alias{Triplet}
\title{Reference class to store and manage triplet data.}
\description{
Reference class to store and manage triplet data.
}
\section{Fields}{

\describe{
\item{\code{ContigNames}}{character vector of length 3, stores the dna names of which the triplet was made.}

\item{\code{ContigNumbers}}{integer vector of length 3, stores the indecies of the sequences that made the triplet.}
}}
\section{Methods}{

\describe{
\item{\code{blockDate(dnaobj, parameters)}}{Block Dating method, estimates the ages of blocks detected based on how many mutations are observed in a block and .}

\item{\code{noScanPerformed()}}{Returns TRUE, if the SS analysis table is blank and the informative sites are not known. This is indicative that a scan of the file has not been done yet.}

\item{\code{plotBars(plottingSettings)}}{Method plots the heatmap based graphic of bars, from the sequence similarity scan data.}

\item{\code{plotLines(plottingSettings)}}{Method plots a lineplot using ggplot2 of the sequence similarity data from the scan.}

\item{\code{putativeBlockFind(parameters)}}{DOCSTRING TO BE COMPLETE}

\item{\code{tabulateBlocks()}}{Tabulates the blocks for a triplet.}
}}

