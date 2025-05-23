% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/not-supported.R
\name{unsupported}
\alias{unsupported}
\title{Verbs not implemented in duckplyr}
\description{
The following dplyr generics have no counterpart method in duckplyr.
If you want to help add a new verb,
please refer to our contributing guide \url{https://duckplyr.tidyverse.org/CONTRIBUTING.html#support-new-verbs}
}
\section{Unsupported verbs}{

For these verbs, duckplyr will fall back to dplyr.
\itemize{
\item \code{\link[dplyr:count]{dplyr::add_count()}}
\item \code{\link[dplyr:cross_join]{dplyr::cross_join()}}
\item \code{\link[dplyr:do]{dplyr::do()}}
\item \code{\link[dplyr:group_by]{dplyr::group_by()}}
\item \code{\link[dplyr:group_data]{dplyr::group_indices()}}
\item \code{\link[dplyr:group_data]{dplyr::group_keys()}}
\item \code{\link[dplyr:group_map]{dplyr::group_map()}}
\item \code{\link[dplyr:group_map]{dplyr::group_modify()}}
\item \code{\link[dplyr:group_nest]{dplyr::group_nest()}}
\item \code{\link[dplyr:group_data]{dplyr::group_size()}}
\item \code{\link[dplyr:group_split]{dplyr::group_split()}}
\item \code{\link[dplyr:group_trim]{dplyr::group_trim()}}
\item \code{\link[dplyr:group_data]{dplyr::groups()}}
\item \code{\link[dplyr:group_data]{dplyr::n_groups()}}
\item \code{\link[dplyr:nest_by]{dplyr::nest_by()}}
\item \code{\link[dplyr:nest_join]{dplyr::nest_join()}}
\item \code{\link[dplyr:reframe]{dplyr::reframe()}}
\item \code{\link[dplyr:rename]{dplyr::rename_with()}}
\item \code{\link[dplyr:rows]{dplyr::rows_append()}}
\item \code{\link[dplyr:rows]{dplyr::rows_delete()}}
\item \code{\link[dplyr:rows]{dplyr::rows_insert()}}
\item \code{\link[dplyr:rows]{dplyr::rows_patch()}}
\item \code{\link[dplyr:rows]{dplyr::rows_update()}}
\item \code{\link[dplyr:rows]{dplyr::rows_upsert()}}
\item \code{\link[dplyr:rowwise]{dplyr::rowwise()}}
\item \code{\link[generics:setops]{generics::setequal()}}
\item \code{\link[dplyr:slice]{dplyr::slice_head()}}
\item \code{\link[dplyr:slice]{dplyr::slice_sample()}}
\item \code{\link[dplyr:slice]{dplyr::slice_tail()}}
\item \code{\link[dplyr:slice]{dplyr::slice()}}
\item \code{\link[dplyr:group_by]{dplyr::ungroup()}}
}
}

