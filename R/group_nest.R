# Generated by 02-duckplyr_df-methods.R
#' @export
group_nest.duckplyr_df <- function(.tbl, ..., .key = "data", keep = FALSE) {
  # Our implementation
  duckplyr_error <- rel_try(NULL,
    # Always fall back to dplyr
    "No relational implementation for {.code group_nest()}" = TRUE,
    {
      return(out)
    }
  )

  # dplyr forward
  check_prudence(.tbl, duckplyr_error)

  group_nest <- dplyr$group_nest.data.frame
  out <- group_nest(.tbl, ..., .key = .key, keep = keep)
  return(out)

  # dplyr implementation
  if (dots_n(...)) {
    group_nest_impl(group_by(.tbl, ...), .key = .key, keep = keep)
  } else {
    tibble(!!.key := list(.tbl))
  }
}

duckplyr_group_nest <- function(.tbl, ...) {
  try_fetch(
    .tbl <- as_duckplyr_df_impl(.tbl),
    error = function(e) {
      testthat::skip(conditionMessage(e))
    }
  )
  out <- group_nest(.tbl, ...)
  class(out) <- setdiff(class(out), "duckplyr_df")
  out
}
