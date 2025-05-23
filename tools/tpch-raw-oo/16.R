qloadm("tools/tpch/001.qs")
duckdb <- asNamespace("duckdb")
drv <- duckdb::duckdb()
con <- DBI::dbConnect(drv)
experimental <- FALSE
invisible(duckdb$rapi_load_rfuns(drv@database_ref))
invisible(DBI::dbExecute(con, 'CREATE MACRO "!"(x) AS (NOT x)'))
invisible(
  DBI::dbExecute(
    con,
    'CREATE MACRO "grepl"(pattern, x) AS (CASE WHEN x IS NULL THEN FALSE ELSE regexp_matches(x, pattern) END)'
  )
)
invisible(DBI::dbExecute(con, 'CREATE MACRO "___coalesce"(x, y) AS COALESCE(x, y)'))
invisible(DBI::dbExecute(con, 'CREATE MACRO "|"(x, y) AS (x OR y)'))
invisible(DBI::dbExecute(con, 'CREATE MACRO "=="(x, y) AS (x == y)'))
invisible(DBI::dbExecute(con, 'CREATE MACRO "n_distinct"(x) AS (COUNT(DISTINCT x))'))
df1 <- part
"filter"
rel1 <- duckdb$rel_from_df(con, df1, experimental = experimental)
"filter"
rel2 <- duckdb$rel_project(
  rel1,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_partkey")
      duckdb$expr_set_alias(tmp_expr, "p_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_name")
      duckdb$expr_set_alias(tmp_expr, "p_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_mfgr")
      duckdb$expr_set_alias(tmp_expr, "p_mfgr")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_container")
      duckdb$expr_set_alias(tmp_expr, "p_container")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_retailprice")
      duckdb$expr_set_alias(tmp_expr, "p_retailprice")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_comment")
      duckdb$expr_set_alias(tmp_expr, "p_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number")
      tmp_expr
    }
  )
)
"filter"
rel3 <- duckdb$rel_filter(
  rel2,
  list(
    duckdb$expr_function(
      "r_base::!=",
      list(
        duckdb$expr_reference("p_brand"),
        if ("experimental" %in% names(formals(duckdb$expr_constant))) {
          duckdb$expr_constant("Brand#45", experimental = experimental)
        } else {
          duckdb$expr_constant("Brand#45")
        }
      )
    ),
    duckdb$expr_function(
      "!",
      list(
        duckdb$expr_function(
          "grepl",
          list(
            if ("experimental" %in% names(formals(duckdb$expr_constant))) {
              duckdb$expr_constant("^MEDIUM POLISHED", experimental = experimental)
            } else {
              duckdb$expr_constant("^MEDIUM POLISHED")
            },
            duckdb$expr_reference("p_type")
          )
        )
      )
    ),
    duckdb$expr_function(
      "___coalesce",
      list(
        duckdb$expr_function(
          "|",
          list(
            duckdb$expr_function(
              "|",
              list(
                duckdb$expr_function(
                  "|",
                  list(
                    duckdb$expr_function(
                      "|",
                      list(
                        duckdb$expr_function(
                          "|",
                          list(
                            duckdb$expr_function(
                              "|",
                              list(
                                duckdb$expr_function(
                                  "|",
                                  list(
                                    duckdb$expr_function(
                                      "r_base::==",
                                      list(
                                        duckdb$expr_reference("p_size"),
                                        if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                                          duckdb$expr_constant(49, experimental = experimental)
                                        } else {
                                          duckdb$expr_constant(49)
                                        }
                                      )
                                    ),
                                    duckdb$expr_function(
                                      "r_base::==",
                                      list(
                                        duckdb$expr_reference("p_size"),
                                        if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                                          duckdb$expr_constant(14, experimental = experimental)
                                        } else {
                                          duckdb$expr_constant(14)
                                        }
                                      )
                                    )
                                  )
                                ),
                                duckdb$expr_function(
                                  "r_base::==",
                                  list(
                                    duckdb$expr_reference("p_size"),
                                    if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                                      duckdb$expr_constant(23, experimental = experimental)
                                    } else {
                                      duckdb$expr_constant(23)
                                    }
                                  )
                                )
                              )
                            ),
                            duckdb$expr_function(
                              "r_base::==",
                              list(
                                duckdb$expr_reference("p_size"),
                                if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                                  duckdb$expr_constant(45, experimental = experimental)
                                } else {
                                  duckdb$expr_constant(45)
                                }
                              )
                            )
                          )
                        ),
                        duckdb$expr_function(
                          "r_base::==",
                          list(
                            duckdb$expr_reference("p_size"),
                            if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                              duckdb$expr_constant(19, experimental = experimental)
                            } else {
                              duckdb$expr_constant(19)
                            }
                          )
                        )
                      )
                    ),
                    duckdb$expr_function(
                      "r_base::==",
                      list(
                        duckdb$expr_reference("p_size"),
                        if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                          duckdb$expr_constant(3, experimental = experimental)
                        } else {
                          duckdb$expr_constant(3)
                        }
                      )
                    )
                  )
                ),
                duckdb$expr_function(
                  "r_base::==",
                  list(
                    duckdb$expr_reference("p_size"),
                    if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                      duckdb$expr_constant(36, experimental = experimental)
                    } else {
                      duckdb$expr_constant(36)
                    }
                  )
                )
              )
            ),
            duckdb$expr_function(
              "r_base::==",
              list(
                duckdb$expr_reference("p_size"),
                if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                  duckdb$expr_constant(9, experimental = experimental)
                } else {
                  duckdb$expr_constant(9)
                }
              )
            )
          )
        ),
        if ("experimental" %in% names(formals(duckdb$expr_constant))) {
          duckdb$expr_constant(FALSE, experimental = experimental)
        } else {
          duckdb$expr_constant(FALSE)
        }
      )
    )
  )
)
"filter"
rel4 <- duckdb$rel_order(rel3, list(duckdb$expr_reference("___row_number")))
"filter"
rel5 <- duckdb$rel_project(
  rel4,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_partkey")
      duckdb$expr_set_alias(tmp_expr, "p_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_name")
      duckdb$expr_set_alias(tmp_expr, "p_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_mfgr")
      duckdb$expr_set_alias(tmp_expr, "p_mfgr")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_container")
      duckdb$expr_set_alias(tmp_expr, "p_container")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_retailprice")
      duckdb$expr_set_alias(tmp_expr, "p_retailprice")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_comment")
      duckdb$expr_set_alias(tmp_expr, "p_comment")
      tmp_expr
    }
  )
)
df2 <- supplier
"filter"
rel6 <- duckdb$rel_from_df(con, df2, experimental = experimental)
"filter"
rel7 <- duckdb$rel_project(
  rel6,
  list(
    {
      tmp_expr <- duckdb$expr_reference("s_suppkey")
      duckdb$expr_set_alias(tmp_expr, "s_suppkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_name")
      duckdb$expr_set_alias(tmp_expr, "s_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_address")
      duckdb$expr_set_alias(tmp_expr, "s_address")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_nationkey")
      duckdb$expr_set_alias(tmp_expr, "s_nationkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_phone")
      duckdb$expr_set_alias(tmp_expr, "s_phone")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_acctbal")
      duckdb$expr_set_alias(tmp_expr, "s_acctbal")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_comment")
      duckdb$expr_set_alias(tmp_expr, "s_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number")
      tmp_expr
    }
  )
)
"filter"
rel8 <- duckdb$rel_filter(
  rel7,
  list(
    duckdb$expr_function(
      "!",
      list(
        duckdb$expr_function(
          "grepl",
          list(
            if ("experimental" %in% names(formals(duckdb$expr_constant))) {
              duckdb$expr_constant("Customer.*?Complaints", experimental = experimental)
            } else {
              duckdb$expr_constant("Customer.*?Complaints")
            },
            duckdb$expr_reference("s_comment")
          )
        )
      )
    )
  )
)
"filter"
rel9 <- duckdb$rel_order(rel8, list(duckdb$expr_reference("___row_number")))
"filter"
rel10 <- duckdb$rel_project(
  rel9,
  list(
    {
      tmp_expr <- duckdb$expr_reference("s_suppkey")
      duckdb$expr_set_alias(tmp_expr, "s_suppkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_name")
      duckdb$expr_set_alias(tmp_expr, "s_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_address")
      duckdb$expr_set_alias(tmp_expr, "s_address")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_nationkey")
      duckdb$expr_set_alias(tmp_expr, "s_nationkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_phone")
      duckdb$expr_set_alias(tmp_expr, "s_phone")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_acctbal")
      duckdb$expr_set_alias(tmp_expr, "s_acctbal")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_comment")
      duckdb$expr_set_alias(tmp_expr, "s_comment")
      tmp_expr
    }
  )
)
df3 <- partsupp
"inner_join"
rel11 <- duckdb$rel_from_df(con, df3, experimental = experimental)
"inner_join"
rel12 <- duckdb$rel_set_alias(rel11, "lhs")
"inner_join"
rel13 <- duckdb$rel_set_alias(rel10, "rhs")
"inner_join"
rel14 <- duckdb$rel_project(
  rel12,
  list(
    {
      tmp_expr <- duckdb$expr_reference("ps_partkey")
      duckdb$expr_set_alias(tmp_expr, "ps_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_suppkey")
      duckdb$expr_set_alias(tmp_expr, "ps_suppkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_availqty")
      duckdb$expr_set_alias(tmp_expr, "ps_availqty")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_supplycost")
      duckdb$expr_set_alias(tmp_expr, "ps_supplycost")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_comment")
      duckdb$expr_set_alias(tmp_expr, "ps_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number_x")
      tmp_expr
    }
  )
)
"inner_join"
rel15 <- duckdb$rel_project(
  rel13,
  list(
    {
      tmp_expr <- duckdb$expr_reference("s_suppkey")
      duckdb$expr_set_alias(tmp_expr, "s_suppkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_name")
      duckdb$expr_set_alias(tmp_expr, "s_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_address")
      duckdb$expr_set_alias(tmp_expr, "s_address")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_nationkey")
      duckdb$expr_set_alias(tmp_expr, "s_nationkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_phone")
      duckdb$expr_set_alias(tmp_expr, "s_phone")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_acctbal")
      duckdb$expr_set_alias(tmp_expr, "s_acctbal")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_comment")
      duckdb$expr_set_alias(tmp_expr, "s_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number_y")
      tmp_expr
    }
  )
)
"inner_join"
rel16 <- duckdb$rel_join(
  rel14,
  rel15,
  list(
    duckdb$expr_function(
      "==",
      list(duckdb$expr_reference("ps_suppkey", rel14), duckdb$expr_reference("s_suppkey", rel15))
    )
  ),
  "inner"
)
"inner_join"
rel17 <- duckdb$rel_order(
  rel16,
  list(duckdb$expr_reference("___row_number_x", rel14), duckdb$expr_reference("___row_number_y", rel15))
)
"inner_join"
rel18 <- duckdb$rel_project(
  rel17,
  list(
    {
      tmp_expr <- duckdb$expr_reference("ps_partkey")
      duckdb$expr_set_alias(tmp_expr, "ps_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function(
        "___coalesce",
        list(duckdb$expr_reference("ps_suppkey", rel14), duckdb$expr_reference("s_suppkey", rel15))
      )
      duckdb$expr_set_alias(tmp_expr, "ps_suppkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_availqty")
      duckdb$expr_set_alias(tmp_expr, "ps_availqty")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_supplycost")
      duckdb$expr_set_alias(tmp_expr, "ps_supplycost")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_comment")
      duckdb$expr_set_alias(tmp_expr, "ps_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_name")
      duckdb$expr_set_alias(tmp_expr, "s_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_address")
      duckdb$expr_set_alias(tmp_expr, "s_address")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_nationkey")
      duckdb$expr_set_alias(tmp_expr, "s_nationkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_phone")
      duckdb$expr_set_alias(tmp_expr, "s_phone")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_acctbal")
      duckdb$expr_set_alias(tmp_expr, "s_acctbal")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("s_comment")
      duckdb$expr_set_alias(tmp_expr, "s_comment")
      tmp_expr
    }
  )
)
"select"
rel19 <- duckdb$rel_project(
  rel18,
  list(
    {
      tmp_expr <- duckdb$expr_reference("ps_partkey")
      duckdb$expr_set_alias(tmp_expr, "ps_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_suppkey")
      duckdb$expr_set_alias(tmp_expr, "ps_suppkey")
      tmp_expr
    }
  )
)
"inner_join"
rel20 <- duckdb$rel_set_alias(rel5, "lhs")
"inner_join"
rel21 <- duckdb$rel_set_alias(rel19, "rhs")
"inner_join"
rel22 <- duckdb$rel_project(
  rel20,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_partkey")
      duckdb$expr_set_alias(tmp_expr, "p_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_name")
      duckdb$expr_set_alias(tmp_expr, "p_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_mfgr")
      duckdb$expr_set_alias(tmp_expr, "p_mfgr")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_container")
      duckdb$expr_set_alias(tmp_expr, "p_container")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_retailprice")
      duckdb$expr_set_alias(tmp_expr, "p_retailprice")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_comment")
      duckdb$expr_set_alias(tmp_expr, "p_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number_x")
      tmp_expr
    }
  )
)
"inner_join"
rel23 <- duckdb$rel_project(
  rel21,
  list(
    {
      tmp_expr <- duckdb$expr_reference("ps_partkey")
      duckdb$expr_set_alias(tmp_expr, "ps_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_suppkey")
      duckdb$expr_set_alias(tmp_expr, "ps_suppkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number_y")
      tmp_expr
    }
  )
)
"inner_join"
rel24 <- duckdb$rel_join(
  rel22,
  rel23,
  list(
    duckdb$expr_function(
      "==",
      list(duckdb$expr_reference("p_partkey", rel22), duckdb$expr_reference("ps_partkey", rel23))
    )
  ),
  "inner"
)
"inner_join"
rel25 <- duckdb$rel_order(
  rel24,
  list(duckdb$expr_reference("___row_number_x", rel22), duckdb$expr_reference("___row_number_y", rel23))
)
"inner_join"
rel26 <- duckdb$rel_project(
  rel25,
  list(
    {
      tmp_expr <- duckdb$expr_function(
        "___coalesce",
        list(duckdb$expr_reference("p_partkey", rel22), duckdb$expr_reference("ps_partkey", rel23))
      )
      duckdb$expr_set_alias(tmp_expr, "p_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_name")
      duckdb$expr_set_alias(tmp_expr, "p_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_mfgr")
      duckdb$expr_set_alias(tmp_expr, "p_mfgr")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_container")
      duckdb$expr_set_alias(tmp_expr, "p_container")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_retailprice")
      duckdb$expr_set_alias(tmp_expr, "p_retailprice")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_comment")
      duckdb$expr_set_alias(tmp_expr, "p_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_suppkey")
      duckdb$expr_set_alias(tmp_expr, "ps_suppkey")
      tmp_expr
    }
  )
)
"summarise"
rel27 <- duckdb$rel_project(
  rel26,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_partkey")
      duckdb$expr_set_alias(tmp_expr, "p_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_name")
      duckdb$expr_set_alias(tmp_expr, "p_name")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_mfgr")
      duckdb$expr_set_alias(tmp_expr, "p_mfgr")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_container")
      duckdb$expr_set_alias(tmp_expr, "p_container")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_retailprice")
      duckdb$expr_set_alias(tmp_expr, "p_retailprice")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_comment")
      duckdb$expr_set_alias(tmp_expr, "p_comment")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("ps_suppkey")
      duckdb$expr_set_alias(tmp_expr, "ps_suppkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number")
      tmp_expr
    }
  )
)
"summarise"
rel28 <- duckdb$rel_aggregate(
  rel27,
  groups = list(duckdb$expr_reference("p_brand"), duckdb$expr_reference("p_type"), duckdb$expr_reference("p_size")),
  aggregates = list(
    {
      tmp_expr <- duckdb$expr_function("min", list(duckdb$expr_reference("___row_number")))
      duckdb$expr_set_alias(tmp_expr, "___row_number")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function("n_distinct", list(duckdb$expr_reference("ps_suppkey")))
      duckdb$expr_set_alias(tmp_expr, "supplier_cnt")
      tmp_expr
    }
  )
)
"summarise"
rel29 <- duckdb$rel_order(rel28, list(duckdb$expr_reference("___row_number")))
"summarise"
rel30 <- duckdb$rel_project(
  rel29,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("supplier_cnt")
      duckdb$expr_set_alias(tmp_expr, "supplier_cnt")
      tmp_expr
    }
  )
)
"select"
rel31 <- duckdb$rel_project(
  rel30,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("supplier_cnt")
      duckdb$expr_set_alias(tmp_expr, "supplier_cnt")
      tmp_expr
    }
  )
)
"arrange"
rel32 <- duckdb$rel_project(
  rel31,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("supplier_cnt")
      duckdb$expr_set_alias(tmp_expr, "supplier_cnt")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_window(duckdb$expr_function("row_number", list()), list(), list(), offset_expr = NULL, default_expr = NULL)
      duckdb$expr_set_alias(tmp_expr, "___row_number")
      tmp_expr
    }
  )
)
"arrange"
rel33 <- duckdb$rel_order(
  rel32,
  list(duckdb$expr_reference("supplier_cnt"), duckdb$expr_reference("p_brand"), duckdb$expr_reference("p_type"), duckdb$expr_reference("p_size"), duckdb$expr_reference("___row_number"))
)
"arrange"
rel34 <- duckdb$rel_project(
  rel33,
  list(
    {
      tmp_expr <- duckdb$expr_reference("p_brand")
      duckdb$expr_set_alias(tmp_expr, "p_brand")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_type")
      duckdb$expr_set_alias(tmp_expr, "p_type")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("p_size")
      duckdb$expr_set_alias(tmp_expr, "p_size")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("supplier_cnt")
      duckdb$expr_set_alias(tmp_expr, "supplier_cnt")
      tmp_expr
    }
  )
)
rel34
duckdb$rel_to_altrep(rel34)
