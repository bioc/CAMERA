\name{findAdducts-methods}
\docType{methods}
\alias{findAdducts}
\alias{findAdducts,xsAnnotate-method}
\title{Calculate Adducts and Annotate LC/ESI-MS Spectra}
\description{
 Annotate adducts (and fragments) for a xsAnnotate object. Returns a xsAnnotate object with annotated pseudospectra.
}
\usage{
 findAdducts(object, ppm=5, mzabs=0.015, multiplier=3, 
 polarity=NULL, rules=NULL, max_peaks=100, psg_list=NULL, intval="maxo")
}

\arguments{
  \item{object}{the \code{xsAnnotate} object}
  \item{ppm}{ppm error for the search}
  \item{mzabs}{allowed variance for the search}
  \item{multiplier}{highest number(n) of allowed clusterion [nM+ion] }
  \item{polarity}{Which polarity mode was used for measuring of the ms sample}
  \item{rules}{personal ruleset or with NULL standard ruleset will be calculated}
  \item{max_peaks}{If run in parralel mode, this number defines how much peaks will be calculated in every thread }
  \item{psg_list}{Vector of pseudospectra indices. The correlation analysis will be only done for those groups}
  \item{intval}{choose intensity values. Allowed values are into, maxo, intb }  
}
\details{
  Adducts (and fragments) are annotated for a xsAnnotate object. For every pseudospectra group, generated bei groupFWHM and groupCorr, all possible Adducts are calculated and mapped to the peaks. If at least two adducts match, a possible molecule-mass for the group can be calculated. After the annotation every masshypothese is checked against the charge of the calculated isotopes. It is recommend to call findIsotopes() before the annotation step.
}
\examples{
 library(CAMERA)
 file <- system.file('mzML/MM14.mzML', package = "CAMERA")
 xs   <- xcmsSet(file, method="centWave", ppm=30, peakwidth=c(5,10))
 an   <- xsAnnotate(xs)
 an   <- groupFWHM(an)
 an <- findIsotopes(an)  # optional but recommended.
#an <- groupCorr(an) # optional but very recommended step
 an <- findAdducts(an,polarity="positive")
 peaklist <- getPeaklist(an) # get the annotated peak list
}
\author{Carsten Kuhl <ckuhl@ipb-halle.de>}
\keyword{methods}