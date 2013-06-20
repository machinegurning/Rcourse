

# set random seed:

set.seed(10)

# generate 20 random numbers

random_numbers <- rnorm(1:20)

# print numbers

random_numbers

# change random seed

set.seed(15)

# create new random numbers

new_random_numbers <- rnorm(1:20)

# print numbers

new_random_numbers

# Now recreate the first vector by changing seed back to 10:

set.seed(10)

# generate 20 random numbers

new_random_numbers <- rnorm(1:20)

# Check if random number vectors are identical

identical(random_numbers, new_random_numbers)