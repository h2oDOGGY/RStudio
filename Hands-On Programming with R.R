# Hands-On Programming with R
# Chapter 1: The Very Basics
# : commenting symbol
# ctrl + c : use to cancel a command that take a long time to run
# vector : one dimensional set of numbers
# object : a stored set of data that can be called up
# to create an object name <- number(s)
die <- 1:6
sample(x = die, size = 1)
dice <- sample(x = die, size = 2, replace = TRUE)
sum(dice)

roll <- function() {
  die <- 1:6
  dice <- sample(x = die, size = 2, replace = TRUE)
  sum(dice)
}

roll2 <- function(bones = 1:20){
    dice <- sample(x = bones, size =2, replace = TRUE)
    sum(dice)
}
# Chapter 2: Packages and Help Pages
# install.packages('package') ; use to install package
# library('package') ; used to load pacakage
# replicate() : use to repeat an R command many times
rolls <- replicate(10000, roll()) # simulates "roll() function 10000 times
qplot(rolls, binwidth = 1) # creates histogram, with bin of 1

# to weight the dice
# prob is done in element wise order, i.e. 1, 2, 3, 4, N
roll <- function(die = 1:6) {
  dice <- sample(x = die, size =2, replace = TRUE, prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

# Chapter 3: R Objects
# atomic vector : simple vector of data; comes in 6 types: double, integers, characters, 
# is.vector(item) TRUE or FALSE if item is a vector
# length(item)  returns length of item
# 1L for integer vector
# 1 for double
# "x" or 'x' for character vector
# typeof(item) to show type of object working with
# double : stores vectors are regular numbers; aka numeric
# integer : stores integers, numbers that can be written without a decimal
# character : stores small pieces of text; must be surrounded by 'x' or "x"
# logical : store TRUEs and FALSEs; useful for comparisons
# Complex : store complex numbers
# Raw : store raw bytes of data
RoyalFlush <- c('Ace Spades', 'King Spades', 'Queen Spades','Jack Spades', '10 Spades')
RoyalFlush
typeof(RoyalFlush)
# attribute : pice of informatin that you can attach to an atomic vector (or any R object)
# most common attributes are: names(), dimensions() written as dim(), classes()
# names : page 44
# dim : transform an atomic vector into an n-dimensional array; 
# example dim(x) <- c(rows, columns, slices)
# matrics : store values in a two-dimensional array; 
# example x <- matrix(y, nrow =, byrow = , ncol =, bycol = )
# array : stores values in an n-dimensional array; example x <- array(y, dim = c())
TopHand <- c('Ace', 'King','Queen','Jack', 'Ten',
             'Spades','Spades','Spades','Spades','Spades')
matrix(data = TopHand, nrow = 5)
matrix(data = c('Ace', 'King','Queen','Jack', 'Ten',
  'Spades','Spades','Spades','Spades','Spades'), nrow = 5)
#class() : used to determine type of object
#factors : ways of storing categorical information
#list : like atomic vectors because they group data into a 1-dimensional set; however
#they group togethers R objects not individual values
#example x <- list('a','b',c,n)
card <- list('ace','heart',1)
card
#data frame : two-dimensional version of a list; stores data in columns, each column
#can be different data type, each column must be the same length

# Chapter 4: R Notation
dataframe[row,col] # pull specific row(s) and/or column(s) from dataframe
head(deck) # pull top 10
tail(deck) # pull bottom 10
dataframe[row1:rowX, c(col1, col2, colX)] # pull value from row range and specific columns
new_dataframe <- dataframe[row1:rowX, c(col1, col2, colX)] #assing value(s) to new operator
# can use the same type of syntax for vector
# select two or more columns, you'll get a new dataframe
# select one column you'll get a vector
deck[-1,1:3] # negative integers return everything except negative row/column
deck[1,] # blank space will extract every value in a dimension
deck[1,c("face","suit",'value')] #can use column names, if available
deal <- function(cards) {
   cards[1,]
}
random <- sample(1:52, size=52)
deck4 <- deck[random,]
head(deck4)

#shuffle the card deck
shuffle <-function(cards) {
  random <-sample(1:52, size = 52)
  cards[random,]
}
deal(deck)
deck2 <- shuffle(deck)
deal(deck2)
