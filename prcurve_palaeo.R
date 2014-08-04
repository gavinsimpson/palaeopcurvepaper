## R code to process the Rmd file

require("knitr")
render_markdown()
opts_chunk$set(dev = "pdf")

knit("prcurve_palaeo.Rmd"); pandoc("prcurve_palaeo.md", format = "latex")

## Run if you want to process LaTeX later, and add
## o: prcurve_palaeo.tex
## to the Pandoc meta data before processing with the above
x <- readLines('prcurve_palaeo.tex')
x <- gsub('\\\\begin\\{figure\\}\\[htbp\\]', '\\\\begin\\{figure\\}\\[tbp\\]', x)
# write the processed tex file back
writeLines(x, 'prcurve_palaeo.tex')
# compile to pdf
tools::texi2pdf('prcurve_palaeo.tex')  # gives foo.pdf
