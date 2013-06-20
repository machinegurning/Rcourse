# Installing R Packages {#installing_r_packages}

One of the strengths of R is that there are literally thousands of packages available for you to extend to core capabilities if the R statistical environment. You may one day even with to write your own packages.

Downloading and installing packages is a very simple procedure in R and can be done with a single line of code -- You will probably do this a lot!

Int his instance, we specify the repository from which we will download the package - if you omitted `repos=""` then you would be asked to select a repository from a list. Rstudio's mirror is hosted by amazon, and hence, is pretty fast - so we'll use that one.

```
install.packages('agricolae', repos="http://cran.rstudio.com/")
```

R will then download the package and install it in the relevant directory.

In order to use the package you need to call the package using `library(agricolae)`. This may or may not generate a message or warning.


```r
library(agricolae)
```

If you wanto to suppress warnings (for instance if you wish to call a package from within a function) you can also use `require(agricolae)` (there are subtle difference between `library()` and `require()` -- [see a good explanation here](http://yihui.name/en/2014/07/library-vs-require/)).

Note that you will need to call the package with `library()` every time you run a new instance of R. Running the `install.packages()` command will also update a package to the latest available version if you already have that package.
