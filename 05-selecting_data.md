# Selecting data {#selecting_data}

In the previous section, we dealt a little with the question of selecting parts of your data from an imported table. We will expand on that introduction here by introducing some additional commands. For the next example, we will use the R `mtcars` dataset: 'The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)' (see `?mtcars`).

First we call and examine the data.


```r
mtcars
```

```
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
```

```r
str(mtcars)
```

```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

So it's a reasonably complex (if short) dataset, with a number of variables that we might be interested in.

Suppose we wanted to select all the cars which have 5 forward gears (the `gear` variable): there are a number of ways of doing this. We can start by selecting a 'logical' subset.


```r
mtcars[mtcars$gear == 5,]
```

```
##                 mpg cyl  disp  hp drat    wt qsec vs am gear carb
## Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.7  0  1    5    2
## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.9  1  1    5    2
## Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.5  0  1    5    4
## Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.5  0  1    5    6
## Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.6  0  1    5    8
```

In this example we select only the rows which match out conditions `mtcars$gear == 5`, and all the columns. We can specify a particular column  numerically if required:


```r
mtcars[mtcars$gear == 5,1:2]
```

```
##                 mpg cyl
## Porsche 914-2  26.0   4
## Lotus Europa   30.4   4
## Ford Pantera L 15.8   8
## Ferrari Dino   19.7   6
## Maserati Bora  15.0   8
```

We can also use the column title to select columns.


```r
mtcars[mtcars$gear == 5,c("mpg","gear")]
```

```
##                 mpg gear
## Porsche 914-2  26.0    5
## Lotus Europa   30.4    5
## Ford Pantera L 15.8    5
## Ferrari Dino   19.7    5
## Maserati Bora  15.0    5
```

And we can use more than one criteria if required...


```r
mtcars[mtcars$mpg > 30 & mtcars$mpg < 40,c("mpg")]
```

```
## [1] 32.4 30.4 33.9 30.4
```

Notice that in this example, because we specify just one column, the code outputs a vector of numbers, not a dataframe (more on this later) with row and column names.

Also note that in all these examples were, rather tiresomely, have to specify `mtcars$gear`, but there is a simpler way:


```r
subset(
     x = mtcars,
     subset = mpg > 30 & mpg < 40,
     select = mpg
     )
```

```
##                 mpg
## Fiat 128       32.4
## Honda Civic    30.4
## Toyota Corolla 33.9
## Lotus Europa   30.4
```

`subset()` simplifies the syntax for logical subsets, and note that even when you select just one column, it will output column and row names.

If you want to select more than one column you will need to use `c()` to concatenate a vector names:


```r
subset(
     x = mtcars,
     subset = mpg > 30 & mpg < 40,
     select = c(mpg,gear,cyl)
     )
```

```
##                 mpg gear cyl
## Fiat 128       32.4    4   4
## Honda Civic    30.4    4   4
## Toyota Corolla 33.9    4   4
## Lotus Europa   30.4    5   4
```

If you omit the `select` argument, you will end up with all the columns:


```r
subset(
     x = mtcars,
     subset = mpg > 30 & mpg < 40
     )
```

```
##                 mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Fiat 128       32.4   4 78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic    30.4   4 75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla 33.9   4 71.1  65 4.22 1.835 19.90  1  1    4    1
## Lotus Europa   30.4   4 95.1 113 3.77 1.513 16.90  1  1    5    2
```

And note that you can also use `select()` to omit columns:


```r
subset(
     x = mtcars,
     subset = mpg > 30 & mpg < 40,
     select = -c(mpg,disp,hp)
     )
```

```
##                cyl drat    wt  qsec vs am gear carb
## Fiat 128         4 4.08 2.200 19.47  1  1    4    1
## Honda Civic      4 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla   4 4.22 1.835 19.90  1  1    4    1
## Lotus Europa     4 3.77 1.513 16.90  1  1    5    2
```

Or using `:` to select or deselect a range of columns:


```r
subset(
     x = mtcars,
     subset = mpg > 30 & mpg < 40,
     select = -c(mpg:wt)
     )
```

```
##                 qsec vs am gear carb
## Fiat 128       19.47  1  1    4    1
## Honda Civic    18.52  1  1    4    2
## Toyota Corolla 19.90  1  1    4    1
## Lotus Europa   16.90  1  1    5    2
```

```r
subset(
     x = mtcars,
     subset = mpg > 30 & mpg < 40,
     select = c(mpg:wt)
     )
```

```
##                 mpg cyl disp  hp drat    wt
## Fiat 128       32.4   4 78.7  66 4.08 2.200
## Honda Civic    30.4   4 75.7  52 4.93 1.615
## Toyota Corolla 33.9   4 71.1  65 4.22 1.835
## Lotus Europa   30.4   4 95.1 113 3.77 1.513
```


### Exercise 

Using the data you imported in the last exercise on the previous page, reproduce the same answers, this time using the `subset()` methods covered on this page.

i.e.:

...create a summary of the last three columns,and create a new object called `maximae` including only rows `144`, `542`, `965`, `1371` and `1769`.
