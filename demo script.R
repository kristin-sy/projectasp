#loading in library
install() #first do this to install the local pacakge
library(projectasp)
library(ggplot2) #still required to create the graphics

#generate simple data
set.seed(119)
data <- rnorm(30, mean = 0.5, sd = 0.05)

#create the document container
doc <- document_container()

#rtolatex numeric
doc <- add_snippet(doc, rtolatex(mean(data), name = "mean", digits = 2), "mean")

#dataframe
summary_df <- data.frame(
  Metric = c("Mean", "SD", "Min", "Max"),
  Value = c(mean(data), sd(data), min(data), max(data))
)
doc <- add_snippet(doc, rtolatex(summary_df, caption = "Model Performance", label = "tab:performance"), "table")

#hypothesis test
doc <- add_snippet(doc, rtolatex(t.test(data, mu = 0)), "ttest")

#ggplot
image <- ggplot(data.frame(data), aes(x = data)) + geom_histogram(bins = 10)
doc <- add_snippet(doc, rtolatex(image, filename = "histogram"), "histogram")

#turn all snippets to .tex files
write_textfile(doc)

