# Used in arrange()
# Handles calls to 'desc' function by
# - extracting the sort order
# - removing any desc-function calls from the expressions: desc(colname) -> colname
handle_desc <- function(dots, call = caller_env()) {
  ascending <- rep(TRUE, length(dots))

  for (i in seq_along(dots)) {
    expr <- quo_get_expr(dots[[i]])
    env <- quo_get_env(dots[[i]])

    if (is_desc(expr, env, call)) {
      ascending[[i]] <- FALSE
      dots[[i]] <- new_quosure(expr[[2]], env = env)
    }
  }

  list(dots = dots, ascending = ascending)
}

is_desc <- function(expr, env, call) {
  if (!is.call(expr)) {
    return(FALSE)
  }

  if (expr[[1]] == "desc") {
    if (!identical(eval(expr[[1]], env), dplyr::desc)) {
      # Error handled elsewhere
      return(FALSE)
    }
  } else if (expr[[1]][[1]] == "::") {
    if (expr[[1]][[2]] != "dplyr") {
      return(FALSE)
    }
  } else {
    return(FALSE)
  }

  if (length(expr) > 2) {
    cli::cli_abort("Function {.fun desc} must be called with exactly one argument.", call = call)
  }

  TRUE
}
