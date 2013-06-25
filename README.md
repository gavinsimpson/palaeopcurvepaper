## Summarising stratigraphic data using principal curves

This is a public repository for a paper I am writing on the use of principal curves for summarising stratigraphic palaeoecological data. The paper is being written in markdown with embedded R code. **knitr** is used to covert the embedded R code to outputs used in the paper in a markdown source file. The `pandoc()` **knitr** function is then used to render the markdown source to PDF via LaTeX. This stage uses the default Pandoc LaTeX template currently, but I plan to modify that template to give nicer rendered output.

This is a work in progress *and* an experiment in writing a paper in the open using Github and the ideals of reproducible research; if you have any comments or suggestions uses the [issues tab](https://github.com/gavinsimpson/palaeopcurvepaper/issues) to make them.

### Dependencies
To run the R code in the `Rmd` file you will need the development version of my **analogue** package. You can get this from R-forge; anything version `>= 0.11-1` should be OK. To install this version from within R use

    install.packages("analogue", repos="http://R-Forge.R-project.org")

You'll see some warnings about `scaling` not being a graphical parameter if you don't have a fairly recent development version of the **vegan** package. This annoyance was fixed in revision `r2533`, but because of the silly build process on R-Forge even though **vegan** builds fine for us it fails there so you'll need to compile **vegan** yourself. The warning is totally harmless and nothing will change if you have the right version of **vegan** installed; the warning in the paper just looks odd and annoying.

You'll also need

 * [knitr](http://yihui.name/knitr/), Yihui Xie excellent R package for processing embedded R code in documents (on CRAN)
 * [vegan](http://cran.r-project.org/web/packages/vegan/index.html), our R package for multivariate & community ecology methods --- **analogue** dpeends on this so that shouldn't be an issue
 * [coenoflex](http://cran.r-project.org/web/packages/coenoflex/index.html), Dave Roberts' gradient-based coenospace vegetation simulator R package (**Note not currently used, but some simulation work to go into the paper uses it.**)
 * [Pandoc](http://johnmacfarlane.net/pandoc/) the wonderful universal document converter from John MacFarlane

### Licence
#### The manuscript
The paper (the markdown source file [prcurve_palaeo.md](https://github.com/gavinsimpson/palaeopcurvepaper/blob/master/prcurve_palaeo.md) and the resulting PDF [prcurve_palaeo.pdf](https://github.com/gavinsimpson/palaeopcurvepaper/blob/master/prcurve_palaeo.pdf)) are copyright &copy; Gavin L. Simpson 2013, some rights reserved. You are free to use the text under the terms of the Creative Commons By-Attribution 3.0 Unported licence.

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_GB"><img alt="Creative Commons Licence" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">Summarising stratigraphic data using principal curves</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Gavin L. Simpson</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_GB">Creative Commons Attribution 3.0 Unported License</a>.

#### R Code
In so far as I can (it is simply interpretted code calling existing R functions in existing R packages), I waive all copyright and related or neighboring rights to the R Code embedded in the file [prcurve_palaeo.Rmd](https://github.com/gavinsimpson/palaeopcurvepaper/blob/master/prcurve_palaeo.Rmd).
<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="www.fromthebottomoftheheap.net">
    <span property="dct:title">Gavin L. Simpson</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">R code for the paper "Summarising stratigraphic data using principal curves"</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="CA" about="www.fromthebottomoftheheap.net">
  Canada</span>.
</p>

## Compiling the Rmd source
I am using **knitr** to write the manuscript with embedded R code. To process the files into the final PDF, the following R code can be used

    require("knitr") ## load the knitr package
    
    render_markdown() ## set the output render hooks, allows Pandoc-flavour markdown
    
    opts_chunk$set(dev = "pdf") ## prefer PDF figures
    
    ## process the R code into a final markdown source file
    ## assumes you are in the directory where the file is located
    knit("prcurve_palaeo.Rmd")
    
    ## process the final markdown source to PDF using Pandoc
    pandoc("prcurve_palaeo.md", format = "latex")

