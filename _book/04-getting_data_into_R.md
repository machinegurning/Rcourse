# Getting data into R {#getting_data_into_R}

Probably the first question you are likely to ask when approaching R for the first time is 'how do I get my data into R'?

R is able to read directly from excel spread sheets using a number of packages, however they usually take some tweaking. In this tutorial we will restrict ourselves to importing data from 'comma separated values' (.csv) files and 'tab delimited' text files (.txt). You can create files in this format using the 'Save As' menu in Excel, or whichever spread sheet software you are using.

## Small variables 

Sometimes you will need to insert data into R which is small and is not stored in an external file. There are two easy wasy to do this.

 Note that in the following (and all subsequent code chunks) anything preceded with a # is ignored by R and referred to as a 'comment' -ignore the colour in this document it's a quirk of the software used to produce it.

It is a good idea to get into the habit of commenting every few lines of code, and explain why - not necessarily how (as this will be self evident) you have written a certain line of code. It makes reading code much easier, especially if you didn't write it.

In the following example we use the `c()` or concatenate function. This works exactly the same way in R as the CONCATENATE() function in Excel, which you may be familiar with. In the example that follows, we call the function `c()` and specify a number of 'arguments' which follow - in this case a string of numbers that we want to combine.

Get used to the idea of calling functions like this with a number of arguments following - we will do this a lot!


```r
# Create an object called short_variable, and assign a series of numbers to it.

# We use '<-' to create the object. This is called 'gets'.

short_variable <- c(1,5,6,7,9,2,10)

# To see what is contained within an object, simply input the name of the object.

short_variable
```

```
## [1]  1  5  6  7  9  2 10
```

```r
# Note that this the equivalent in R of writing print(short_variable).
# This is not particularly important in this course, but it becomes important
# as you begin to write your own functions.

print(short_variable)
```

```
## [1]  1  5  6  7  9  2 10
```

```r
# A more convenient way of entering a series of numbers is to use the scan() function.
# You must still assign a name to the object you are creating as before, but scan()
# Will allow you to enter the data more easily. 

#Try that now.
```


## Importing tables 

Obviously you won't want to manually input all your data, it is much easier to import from a file which you have prepared in a spread sheet. As mentioned, in this course we will work exclusively with the simple formats '.csv' and .txt.

When importing data from files, there are a few rules that must be adhered to, otherwise R will throw up an error.


*  Data must be complete. Any missing values should be replaced with NA.
*  There must be no spaces in text (e.g. column titles), you should either use underscores, e.g.: my_variable, or conflate words using capitals to sperate, e.g.: myVariable.
*  Data should be arranged in 'long' format and be 'tidy'. This is required for many types of analysis in R - a good paper on this can be found [here](http://vita.had.co.nz/papers/tidy-data.pdf") - more on this later.


Let's assume we've done that already:


```r
# To import from a '.txt' file we used the read.table() function
# again you must assign the function a name first. In this case we will import a data file
# referred to in 'The R book'. Notice that we are able to import it directly from
# the internet, but the location could just as easily be a local folder: "C://data/"

rats <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/rats.txt", header=T)

# Call the data to examine it. Note this data is dealt with on p475 of 'The R Book'

rats
```

```
##    Glycogen Treatment Rat Liver
## 1       131         1   1     1
## 2       130         1   1     1
## 3       131         1   1     2
## 4       125         1   1     2
## 5       136         1   1     3
## 6       142         1   1     3
## 7       150         1   2     1
## 8       148         1   2     1
## 9       140         1   2     2
## 10      143         1   2     2
## 11      160         1   2     3
## 12      150         1   2     3
## 13      157         2   1     1
## 14      145         2   1     1
## 15      154         2   1     2
## 16      142         2   1     2
## 17      147         2   1     3
## 18      153         2   1     3
## 19      151         2   2     1
## 20      155         2   2     1
## 21      147         2   2     2
## 22      147         2   2     2
## 23      162         2   2     3
## 24      152         2   2     3
## 25      134         3   1     1
## 26      125         3   1     1
## 27      138         3   1     2
## 28      138         3   1     2
## 29      135         3   1     3
## 30      136         3   1     3
## 31      138         3   2     1
## 32      140         3   2     1
## 33      139         3   2     2
## 34      138         3   2     2
## 35      134         3   2     3
## 36      127         3   2     3
```

This isn't a particularly big table so we can view the whole thing at once, but if it was longer we might want to summarise the data or look at smaller chunks fo it.


```r
# we can look at the first 6 rows with:

head(rats)
```

```
##   Glycogen Treatment Rat Liver
## 1      131         1   1     1
## 2      130         1   1     1
## 3      131         1   1     2
## 4      125         1   1     2
## 5      136         1   1     3
## 6      142         1   1     3
```

```r
# Or the last 6 rows with:

tail(rats)
```

```
##    Glycogen Treatment Rat Liver
## 31      138         3   2     1
## 32      140         3   2     1
## 33      139         3   2     2
## 34      138         3   2     2
## 35      134         3   2     3
## 36      127         3   2     3
```

```r
# We can select individual columns or rows with square brackets. rats[1,1] will give you the value on the first row of the first column:

rats[1,1]
```

```
## [1] 131
```

```r
# The first number denotes row, the second column. So to see the whole first row, we do:

rats[1,]
```

```
##   Glycogen Treatment Rat Liver
## 1      131         1   1     1
```

```r
# We can also specify a series by using a colon:

rats[1:10,]
```

```
##    Glycogen Treatment Rat Liver
## 1       131         1   1     1
## 2       130         1   1     1
## 3       131         1   1     2
## 4       125         1   1     2
## 5       136         1   1     3
## 6       142         1   1     3
## 7       150         1   2     1
## 8       148         1   2     1
## 9       140         1   2     2
## 10      143         1   2     2
```

```r
# If we wanted every third row, we could use the seq() function:

rats[seq(3,36,3),]
```

```
##    Glycogen Treatment Rat Liver
## 3       131         1   1     2
## 6       142         1   1     3
## 9       140         1   2     2
## 12      150         1   2     3
## 15      154         2   1     2
## 18      153         2   1     3
## 21      147         2   2     2
## 24      152         2   2     3
## 27      138         3   1     2
## 30      136         3   1     3
## 33      139         3   2     2
## 36      127         3   2     3
```

```r
# In this case the three arguments in the seq function mean: start at value 3, end at value 36, and jump 3 rows at a time. 

# We can also compute some summary statistics from the data:

summary(rats)
```

```
##     Glycogen       Treatment      Rat          Liver  
##  Min.   :125.0   Min.   :1   Min.   :1.0   Min.   :1  
##  1st Qu.:135.8   1st Qu.:1   1st Qu.:1.0   1st Qu.:1  
##  Median :141.0   Median :2   Median :1.5   Median :2  
##  Mean   :142.2   Mean   :2   Mean   :1.5   Mean   :2  
##  3rd Qu.:150.0   3rd Qu.:3   3rd Qu.:2.0   3rd Qu.:3  
##  Max.   :162.0   Max.   :3   Max.   :2.0   Max.   :3
```

```r
# Or look at the structure of the object

str(rats)
```

```
## 'data.frame':	36 obs. of  4 variables:
##  $ Glycogen : int  131 130 131 125 136 142 150 148 140 143 ...
##  $ Treatment: int  1 1 1 1 1 1 1 1 1 1 ...
##  $ Rat      : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ Liver    : int  1 1 2 2 3 3 1 1 2 2 ...
```

 `str()` is useful, because it lets us know how R is seeing the parts of this table. `int` for instance means integer. If we were wanting to conduct an ANOVA on the rats data, we would need to tell R that Treatment, Rat and, Liver are categorical values, not continuous, otherwise we would be doing the wrong analysis. Note that R will always assume integers to be continuous, unless we explicitly tell it otherwise by labelling it as a `factor`.



```r
# To solve this, either use characters - A, B, C instead of 1, 2, 3 for factors, or convert them manually:

rats$Treatment <- factor(rats$Treatment)

# By using the factor command, we in effect convert a continuous variable into a categorical one:

str(rats)
```

```
## 'data.frame':	36 obs. of  4 variables:
##  $ Glycogen : int  131 130 131 125 136 142 150 148 140 143 ...
##  $ Treatment: Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 1 1 ...
##  $ Rat      : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ Liver    : int  1 1 2 2 3 3 1 1 2 2 ...
```

Now convert Rat and Liver into categorical variables in the same way - we will need this data later.



There is a dedicated function `revalue()` to convert numerical factor levels to character based levels in the library `plyr`. This can save you the hassle of using `factor()` each time you open a dataset (although you could of course do this in your spreadsheet).


```r
# Install the package plyr - if you don't have it already - note you can check this on the right hand 'packages' tab of RStudio. But, it doesn't hurt to run the command again, even if it is installed!

install.packages('plyr',repos="http://cran.rstudio.com/")
```

```
## Installing package into '/home/matthew/R/x86_64-pc-linux-gnu-library/3.3'
## (as 'lib' is unspecified)
```

```r
# Load the package:

library(plyr)

rats$Treatment1 <- revalue(rats$Treatment, c("1" = "A", "2" = "B", "3" = "C"))

rats$Treatment
```

```
##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3
## [36] 3
## Levels: 1 2 3
```

```r
rats$Treatment1
```

```
##  [1] A A A A A A A A A A A A B B B B B B B B B B B B C C C C C C C C C C C
## [36] C
## Levels: A B C
```

Note that in these two examples we refer to the individual columns of the table with a `$`. R studio is great for this. Type `rats$` in the console and the press the tab button. RStudio will then automatically complete the variable name, or give you the options available. Try it.

We could also have referred to the columns by number: `rats[ ,1]`.

Another option which gives you a much more familiar spread sheet like view is `fix(rats)` - try this too.

If you have followed the above instructions, you should have something that looks like this:


```r
str(rats)
```

```
## 'data.frame':	36 obs. of  5 variables:
##  $ Glycogen  : int  131 130 131 125 136 142 150 148 140 143 ...
##  $ Treatment : Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 1 1 ...
##  $ Rat       : Factor w/ 2 levels "1","2": 1 1 1 1 1 1 2 2 2 2 ...
##  $ Liver     : Factor w/ 3 levels "1","2","3": 1 1 2 2 3 3 1 1 2 2 ...
##  $ Treatment1: Factor w/ 3 levels "A","B","C": 1 1 1 1 1 1 1 1 1 1 ...
```

```r
rats
```

```
##    Glycogen Treatment Rat Liver Treatment1
## 1       131         1   1     1          A
## 2       130         1   1     1          A
## 3       131         1   1     2          A
## 4       125         1   1     2          A
## 5       136         1   1     3          A
## 6       142         1   1     3          A
## 7       150         1   2     1          A
## 8       148         1   2     1          A
## 9       140         1   2     2          A
## 10      143         1   2     2          A
## 11      160         1   2     3          A
## 12      150         1   2     3          A
## 13      157         2   1     1          B
## 14      145         2   1     1          B
## 15      154         2   1     2          B
## 16      142         2   1     2          B
## 17      147         2   1     3          B
## 18      153         2   1     3          B
## 19      151         2   2     1          B
## 20      155         2   2     1          B
## 21      147         2   2     2          B
## 22      147         2   2     2          B
## 23      162         2   2     3          B
## 24      152         2   2     3          B
## 25      134         3   1     1          C
## 26      125         3   1     1          C
## 27      138         3   1     2          C
## 28      138         3   1     2          C
## 29      135         3   1     3          C
## 30      136         3   1     3          C
## 31      138         3   2     1          C
## 32      140         3   2     1          C
## 33      139         3   2     2          C
## 34      138         3   2     2          C
## 35      134         3   2     3          C
## 36      127         3   2     3          C
```

Note that a longer discussion of getting data from excel files is available here: <http://www.r-bloggers.com/read-excel-files-from-r/>.

