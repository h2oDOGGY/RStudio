die <- 1:6
die
dice <- sample(x = die, size = 2, replace = TRUE) 
#replace used to simulate independent random samples
dice
sum(dice)

roll <- function () {
  die <- 1:6
  dice <- sample(x = die, size = 2, replace = TRUE,
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}
roll2 <- function (bones = 1:6) {
  dice <- sample(bones, size = 2, replace = TRUE, 
  prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

roll <- function () {
  die <- 1:6
  dice <- sample(x = die, size = 1)  
  sum(dice)
}
roll()
roll2()

rolldie1 <- function () {
  die <- 1:6
  dice <- sample(x = die, size = 1)
  sum(dice)
  }
rolldie2 <- function () {
  die <- 1:6
  dice <- sample(x = die, size = 1)
  sum(dice)
  }
rolldie1()
rolldie2()
