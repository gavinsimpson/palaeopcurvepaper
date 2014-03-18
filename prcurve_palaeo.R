## R code to process the Rmd file

require("knitr")
render_markdown()
opts_chunk$set(dev = "pdf")

knit("prcurve_palaeo.Rmd")

pandoc("prcurve_palaeo.md", format = "latex")
