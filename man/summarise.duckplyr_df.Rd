% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarise-rd.R, R/summarise.R
\name{summarise.duckplyr_df}
\alias{summarise.duckplyr_df}
\title{Summarise each group down to one row}
\usage{
\method{summarise}{duckplyr_df}(.data, ..., .by = NULL, .groups = NULL)
}
\arguments{
\item{.data}{A data frame, data frame extension (e.g. a tibble), or a
lazy data frame (e.g. from dbplyr or dtplyr). See \emph{Methods}, below, for
more details.}

\item{...}{<\code{\link[rlang:args_data_masking]{data-masking}}> Name-value pairs of
summary functions. The name will be the name of the variable in the result.

The value can be:
\itemize{
\item A vector of length 1, e.g. \code{min(x)}, \code{n()}, or \code{sum(is.na(y))}.
\item A data frame, to add multiple columns from a single expression.
}

\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}} Returning values with size 0 or >1 was
deprecated as of 1.1.0. Please use \code{\link[dplyr:reframe]{reframe()}} for this instead.}

\item{.by}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

<\code{\link[dplyr:dplyr_tidy_select]{tidy-select}}> Optionally, a selection of columns to
group by for just this operation, functioning as an alternative to \code{\link[dplyr:group_by]{group_by()}}. For
details and examples, see \link[dplyr:dplyr_by]{?dplyr_by}.}

\item{.groups}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}} Grouping structure of the
result.
\itemize{
\item "drop_last": dropping the last level of grouping. This was the
only supported option before version 1.0.0.
\item "drop": All levels of grouping are dropped.
\item "keep": Same grouping structure as \code{.data}.
\item "rowwise": Each row is its own group.
}

When \code{.groups} is not specified, it is chosen
based on the number of rows of the results:
\itemize{
\item If all the results have 1 row, you get "drop_last".
\item If the number of rows varies, you get "keep" (note that returning a
variable number of rows was deprecated in favor of \code{\link[dplyr:reframe]{reframe()}}, which
also unconditionally drops all levels of grouping).
}

In addition, a message informs you of that choice, unless the result is ungrouped,
the option "dplyr.summarise.inform" is set to \code{FALSE},
or when \code{summarise()} is called from a function in a package.}
}
\description{
This is a method for the \code{\link[dplyr:summarise]{dplyr::summarise()}} generic.
See "Fallbacks" section for differences in implementation.
\code{summarise()} creates a new data frame.
It returns one row for each combination of grouping variables;
if there are no grouping variables,
the output will have a single row summarising all observations in the input.
It will contain one column for each grouping variable
and one column for each of the summary statistics that you have specified.
}
\section{Fallbacks}{

There is no DuckDB translation in \code{summarise.duckplyr_df()}
\itemize{
\item with \code{.groups = "rowwise"}.
}

These features fall back to \code{\link[dplyr:summarise]{dplyr::summarise()}}, see \code{vignette("fallback")} for details.
}

\examples{
library(duckplyr)
summarise(mtcars, mean = mean(disp), n = n())
}
\seealso{
\code{\link[dplyr:summarise]{dplyr::summarise()}}
}
