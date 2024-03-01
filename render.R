library(quarto)
library(tidyverse)
library(gapminder)

countries <-
  gapminder |>
  distinct(country) |>
  pull(country) |>
  as.character()

reports <-
  tibble(
    input = "report.qmd",
    output_file = str_glue("reports/{countries}.html"),
    execute_params = map(countries, ~ list(country = .))
  )

quarto_render(
  input = "report.qmd",
  output_file = "Afghanistan.html",
  execute_params = list(
    country = "Afghanistan"
  )
)

pwalk(reports, quarto_render)
