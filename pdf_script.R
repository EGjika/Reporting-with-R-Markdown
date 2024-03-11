
# Reference: https://damien-datasci-blog.netlify.app/post/2022-01-06-generating-multiple-pdf-at-once-a-use-case-of-rmarkdown-render-in-a-purrr-loop/

Data_2 <- readxl::read_excel("Data_individual.xlsx")

purrr::walk(
  .x = 1:nrow(Data_2),  # Iterate over row indices instead of names
  ~ {
    current_row <- Data_2[.x, ]
    rmarkdown::render(
      input = "Individual_Reporting_Template.Rmd",
      output_file = glue::glue("Report - {current_row$Name}.pdf"),
      params = list(Name = current_row$Name, ID = current_row$ID)
    )
  }
)
