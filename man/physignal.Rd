% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/physignal.r
\name{physignal}
\alias{physignal}
\title{Assessing phylogenetic signal in morphometric data}
\usage{
physignal(phy, A, iter = 999, ShowPlot = TRUE, method = c("Kmult", "SSC"))
}
\arguments{
\item{phy}{A phylogenetic tree of {class phylo} - see \code{\link[ape]{read.tree}} in library ape}

\item{A}{A matrix (n x [p x k]) or 3D array (p x k x n) containing GPA-aligned coordinates for a set of specimens}

\item{iter}{Number of iterations for significance testing}

\item{ShowPlot}{A logical value indicating whether or not the plot should be returned}

\item{method}{Method for estimating phylogenetic signal (Kmult or SSC)}
}
\value{
Function returns a list with the following components:
  \item{phy.signal}{The estimate of phylogenetic signal}
  \item{pvalue}{The significance level of the observed signal}
}
\description{
Function calculates the degree of phylogenetic signal from a set of Procrustes-aligned specimens
}
\details{
The function estimates the degree of phylogenetic signal present in shape data for a given phylogeny.
It is assumed that the landmarks have previously been aligned
  using Generalized Procrustes Analysis (GPA) [e.g., with \code{\link{gpagen}}].
  Two approaches may be used to quantify phylogenetic signal. First, a multivariate version of the
  K-statistic may be utilized (Kmult: Adams 2014). This value evaluates the degree of phylogenetic signal
  in a dataset relative to what is expected under a Brownian motion model of evolution. For geometric
  morphometric data, the approach is a mathematical generalization of the Kappa statistic (Blomberg et al.
  2003) appropriate for highly multivariate data (see Adams 2014).

The second approach estimates phylogenetic signal as the sum of squared changes (SSC) in
  shape along all branches of the phylogeny (Klingenberg and Gidaszewski 2010). Significance testing
  is found by permuting the shape data among the tips of the phylogeny. Note that this
  method can be quite slow as ancestral states must be estimated for every iteration.

For both approaches a plot of the specimens in tangent space with the phylogeny superimposed
  is included (NOTE: if ancestral states are desired, run \code{\link{plotGMPhyloMorphoSpace}}).

The tree must have number of tips equal to number of taxa in the data matrix (e.g. \code{\link[ape]{drop.tip}}).
And, tip labels of the tree MUST be exactly the same as the taxa names in the landmark data matrix
(check using \code{\link[base]{match}}).

This function can be used with univariate data (i.e. centroid size) if imported as matrix with rownames
giving the taxa names.
}
\examples{
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment

#Test for phylogenetic signal in shape
physignal(plethspecies$phy,Y.gpa$coords,method="Kmult",iter=99)

#Test for phylogenetic signal in size
physignal(plethspecies$phy,Y.gpa$Csize,method="Kmult",iter=99)
}
\author{
Dean Adams
}
\references{
Blomberg SP, Garland T, Ives AR. 2003. Testing for phylogenetic signal in comparative
data: behavioral traits are more labile. Evolution, 57:717-745.

Klingenberg, C. P., and N. A. Gidaszewski. 2010. Testing and quantifying phylogenetic signals
  and homoplasy in morphometric data. Syst. Biol. 59:245-261.

Adams, D.C. 2014. A generalized K statistic for estimating phylogenetic signal from shape and
other high-dimensional multivariate data. Systematic Biology.  63:685-697.
}
\keyword{analysis}

