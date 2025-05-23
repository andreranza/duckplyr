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
rel2 <- duckdb$rel_filter(
  rel1,
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
df2 <- supplier
"filter"
rel3 <- duckdb$rel_from_df(con, df2, experimental = experimental)
"filter"
rel4 <- duckdb$rel_filter(
  rel3,
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
df3 <- partsupp
"inner_join"
rel5 <- duckdb$rel_from_df(con, df3, experimental = experimental)
"inner_join"
rel6 <- duckdb$rel_set_alias(rel5, "lhs")
"inner_join"
rel7 <- duckdb$rel_set_alias(rel4, "rhs")
"inner_join"
rel8 <- duckdb$rel_join(
  rel6,
  rel7,
  list(
    duckdb$expr_function(
      "==",
      list(duckdb$expr_reference("ps_suppkey", rel6), duckdb$expr_reference("s_suppkey", rel7))
    )
  ),
  "inner"
)
"inner_join"
rel9 <- duckdb$rel_project(
  rel8,
  list(
    {
      tmp_expr <- duckdb$expr_reference("ps_partkey")
      duckdb$expr_set_alias(tmp_expr, "ps_partkey")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function(
        "___coalesce",
        list(duckdb$expr_reference("ps_suppkey", rel6), duckdb$expr_reference("s_suppkey", rel7))
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
rel10 <- duckdb$rel_project(
  rel9,
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
rel11 <- duckdb$rel_set_alias(rel2, "lhs")
"inner_join"
rel12 <- duckdb$rel_set_alias(rel10, "rhs")
"inner_join"
rel13 <- duckdb$rel_join(
  rel11,
  rel12,
  list(
    duckdb$expr_function(
      "==",
      list(duckdb$expr_reference("p_partkey", rel11), duckdb$expr_reference("ps_partkey", rel12))
    )
  ),
  "inner"
)
"inner_join"
rel14 <- duckdb$rel_project(
  rel13,
  list(
    {
      tmp_expr <- duckdb$expr_function(
        "___coalesce",
        list(duckdb$expr_reference("p_partkey", rel11), duckdb$expr_reference("ps_partkey", rel12))
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
rel15 <- duckdb$rel_aggregate(
  rel14,
  groups = list(duckdb$expr_reference("p_brand"), duckdb$expr_reference("p_type"), duckdb$expr_reference("p_size")),
  aggregates = list(
    {
      tmp_expr <- duckdb$expr_function("n_distinct", list(duckdb$expr_reference("ps_suppkey")))
      duckdb$expr_set_alias(tmp_expr, "supplier_cnt")
      tmp_expr
    }
  )
)
"select"
rel16 <- duckdb$rel_project(
  rel15,
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
rel17 <- duckdb$rel_order(
  rel16,
  list(duckdb$expr_reference("supplier_cnt"), duckdb$expr_reference("p_brand"), duckdb$expr_reference("p_type"), duckdb$expr_reference("p_size"))
)
rel17
duckdb$rel_to_altrep(rel17)
