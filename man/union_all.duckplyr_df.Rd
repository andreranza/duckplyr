% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/union_all-rd.R, R/union_all.R
\name{union_all.duckplyr_df}
\alias{union_all.duckplyr_df}
\title{Union of all}
\usage{
\method{union_all}{duckplyr_df}(x, y, ...)
}
\arguments{
\item{x, y}{Pair of compatible data frames. A pair of data frames is
compatible if they have the same column names (possibly in different
orders) and compatible types.}

\item{...}{These dots are for future extensions and must be empty.}
}
\description{
This is a method for the \code{\link[dplyr:setops]{dplyr::union_all()}} generic.
See "Fallbacks" section for differences in implementation.
\code{union_all(x, y)} finds all rows in either x or y, including duplicates.
}
\section{Fallbacks}{

There is no DuckDB translation in \code{union_all.duckplyr_df()}
\itemize{
\item if column names are duplicated in one of the tables,
\item if column names are different in both tables.
}

These features fall back to \code{\link[dplyr:setops]{dplyr::union_all()}}, see \code{vignette("fallback")} for details.
}

\examples{
df1 <- duckdb_tibble(x = 1:3)
df2 <- duckdb_tibble(x = 3:5)
union_all(df1, df2)
}
\seealso{
\code{\link[dplyr:setops]{dplyr::union_all()}}
}
