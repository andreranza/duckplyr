qloadm("tools/tpch/001.qs")
duckdb <- asNamespace("duckdb")
drv <- duckdb::duckdb()
con <- DBI::dbConnect(drv)
experimental <- FALSE
invisible(
  DBI::dbExecute(
    con,
    'CREATE MACRO "___mean_na"(x) AS (CASE WHEN SUM(CASE WHEN x IS NULL THEN 1 ELSE 0 END) > 0 THEN NULL ELSE AVG(x) END)'
  )
)
invisible(DBI::dbExecute(con, 'CREATE MACRO "n"() AS CAST(COUNT(*) AS int32)'))
df1 <- lineitem
"select"
rel1 <- duckdb$rel_from_df(con, df1, experimental = experimental)
"select"
rel2 <- duckdb$rel_project(
  rel1,
  list(
    {
      tmp_expr <- duckdb$expr_reference("l_shipdate")
      duckdb$expr_set_alias(tmp_expr, "l_shipdate")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_returnflag")
      duckdb$expr_set_alias(tmp_expr, "l_returnflag")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_linestatus")
      duckdb$expr_set_alias(tmp_expr, "l_linestatus")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_quantity")
      duckdb$expr_set_alias(tmp_expr, "l_quantity")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_extendedprice")
      duckdb$expr_set_alias(tmp_expr, "l_extendedprice")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_discount")
      duckdb$expr_set_alias(tmp_expr, "l_discount")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_tax")
      duckdb$expr_set_alias(tmp_expr, "l_tax")
      tmp_expr
    }
  )
)
"filter"
rel3 <- duckdb$rel_filter(
  rel2,
  list(
    duckdb$expr_comparison(
      "<=",
      list(
        duckdb$expr_reference("l_shipdate"),
        if ("experimental" %in% names(formals(duckdb$expr_constant))) {
          duckdb$expr_constant(as.Date("1998-09-02"), experimental = experimental)
        } else {
          duckdb$expr_constant(as.Date("1998-09-02"))
        }
      )
    )
  )
)
"select"
rel4 <- duckdb$rel_project(
  rel3,
  list(
    {
      tmp_expr <- duckdb$expr_reference("l_returnflag")
      duckdb$expr_set_alias(tmp_expr, "l_returnflag")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_linestatus")
      duckdb$expr_set_alias(tmp_expr, "l_linestatus")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_quantity")
      duckdb$expr_set_alias(tmp_expr, "l_quantity")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_extendedprice")
      duckdb$expr_set_alias(tmp_expr, "l_extendedprice")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_discount")
      duckdb$expr_set_alias(tmp_expr, "l_discount")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_reference("l_tax")
      duckdb$expr_set_alias(tmp_expr, "l_tax")
      tmp_expr
    }
  )
)
"summarise"
rel5 <- duckdb$rel_aggregate(
  rel4,
  groups = list(duckdb$expr_reference("l_returnflag"), duckdb$expr_reference("l_linestatus")),
  aggregates = list(
    {
      tmp_expr <- duckdb$expr_function("sum", list(duckdb$expr_reference("l_quantity")))
      duckdb$expr_set_alias(tmp_expr, "sum_qty")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function("sum", list(duckdb$expr_reference("l_extendedprice")))
      duckdb$expr_set_alias(tmp_expr, "sum_base_price")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function(
        "sum",
        list(
          duckdb$expr_function(
            "*",
            list(
              duckdb$expr_reference("l_extendedprice"),
              duckdb$expr_function(
                "-",
                list(
                  if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                    duckdb$expr_constant(1, experimental = experimental)
                  } else {
                    duckdb$expr_constant(1)
                  },
                  duckdb$expr_reference("l_discount")
                )
              )
            )
          )
        )
      )
      duckdb$expr_set_alias(tmp_expr, "sum_disc_price")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function(
        "sum",
        list(
          duckdb$expr_function(
            "*",
            list(
              duckdb$expr_function(
                "*",
                list(
                  duckdb$expr_reference("l_extendedprice"),
                  duckdb$expr_function(
                    "-",
                    list(
                      if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                        duckdb$expr_constant(1, experimental = experimental)
                      } else {
                        duckdb$expr_constant(1)
                      },
                      duckdb$expr_reference("l_discount")
                    )
                  )
                )
              ),
              duckdb$expr_function(
                "+",
                list(
                  if ("experimental" %in% names(formals(duckdb$expr_constant))) {
                    duckdb$expr_constant(1, experimental = experimental)
                  } else {
                    duckdb$expr_constant(1)
                  },
                  duckdb$expr_reference("l_tax")
                )
              )
            )
          )
        )
      )
      duckdb$expr_set_alias(tmp_expr, "sum_charge")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function("___mean_na", list(x = duckdb$expr_reference("l_quantity")))
      duckdb$expr_set_alias(tmp_expr, "avg_qty")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function("___mean_na", list(x = duckdb$expr_reference("l_extendedprice")))
      duckdb$expr_set_alias(tmp_expr, "avg_price")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function("___mean_na", list(x = duckdb$expr_reference("l_discount")))
      duckdb$expr_set_alias(tmp_expr, "avg_disc")
      tmp_expr
    },
    {
      tmp_expr <- duckdb$expr_function("n", list())
      duckdb$expr_set_alias(tmp_expr, "count_order")
      tmp_expr
    }
  )
)
"arrange"
rel6 <- duckdb$rel_order(
  rel5,
  list(duckdb$expr_reference("l_returnflag"), duckdb$expr_reference("l_linestatus"))
)
rel6
duckdb$rel_to_altrep(rel6)
