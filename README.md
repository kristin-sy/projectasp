
<!-- README.md is generated from README.Rmd. Please edit that file -->

# projectasp

<!-- badges: start -->

<!-- badges: end -->

The goal of projectasp is to reduce the manual work that is put into
formatting and updating R output into LaTeX. It can be likely that
experiments are ran repeatedly which required the user to continuously
update tables and figures in their writing. This package condenses
sections of these results into a function that directly updates new
results into LaTeX. It converts R objects such as dataframes, numeric
numbers, test results and plots into a .tex file which can be referenced
in LaTeX.

## Installation

You can install the development version of projectasp from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("kristin-sy/projectasp")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(projectasp)
## basic example code

# create a document container
doc <- document_container()

# add a numeric result
doc <- add_snippet(doc, rtolatex(0.94, name = "accuracy"), "accuracy")

# add a hypothesis test result
doc <- add_snippet(doc, rtolatex(t.test(rnorm(30), rnorm(30))), "ttest")

# write all snippets to .tex files
write_textfile(doc)
#> Written: outputs/accuracy.tex 
#> Written: outputs/ttest.tex
```

In your LaTeX document, reference the results with:

``` latex
The model accuracy was \accuracy{}.
```

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
