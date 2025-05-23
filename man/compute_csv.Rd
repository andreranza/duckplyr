% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_csv.R
\name{compute_csv}
\alias{compute_csv}
\title{Compute results to a CSV file}
\usage{
compute_csv(x, path, ..., prudence = NULL, options = NULL)
}
\arguments{
\item{x}{A duckplyr frame.}

\item{path}{The path of the Parquet file to create.}

\item{...}{These dots are for future extensions and must be empty.}

\item{prudence}{Memory protection, controls if DuckDB may convert
intermediate results in DuckDB-managed memory to data frames in R memory.
\itemize{
\item \code{"lavish"}: regardless of size,
\item \code{"stingy"}: never,
\item \code{"thrifty"}: up to a maximum size of 1 million cells.
}

The default is to inherit from the input.
This argument is provided here only for convenience.
The same effect can be achieved by forwarding the output to \code{\link[=as_duckdb_tibble]{as_duckdb_tibble()}}
with the desired prudence.
See \code{vignette("prudence")} for more information.}

\item{options}{A list of additional options to pass to create the storage format,
see \url{https://duckdb.org/docs/sql/statements/copy.html#csv-options}
for details.}
}
\value{
A duckplyr frame.
}
\description{
For a duckplyr frame, this function executes the query
and stores the results in a CSV file,
without converting it to an R data frame.
The result is a duckplyr frame that can be used with subsequent dplyr verbs.
This function can also be used as a CSV writer for regular data frames.
}
\examples{
library(duckplyr)
df <- data.frame(x = c(1, 2))
df <- mutate(df, y = 2)
path <- tempfile(fileext = ".csv")
df <- compute_csv(df, path)
readLines(path)
}
\seealso{
\code{\link[=compute_parquet]{compute_parquet()}}, \code{\link[=compute.duckplyr_df]{compute.duckplyr_df()}}, \code{\link[dplyr:compute]{dplyr::collect()}}
}
