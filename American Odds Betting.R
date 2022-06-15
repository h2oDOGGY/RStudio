# if line is postive
# underdog

# if line is negative
# favorite

# amount bet
xbet <- 50

# line amount
xline <- 150

# calculate Winnings with American Odds
earning <- if (xline >0) 
  {
  (xline*xbet/100) #+ xbet
} else {
  (xbet*100/(-1*xline)) #+bet
}


print(paste("Bet", xbet,"to win", format(round(earning, 2))))

# calculate Implied Probability with American odds
percent <- function(x, digits = 2, format = "f", ...) 
  {      # Create user-defined function
  paste0(formatC(x * 100, format = format, digits = digits, ...), "%")
}

imp_odds <- if (xline >0) 
{
  percent(100/(xline+100))
} else {
  percent((-1*xline)/((-1*xline)+100))
}

# final outputs
print(paste("Bet", xbet,"to win", format(round(earning, 2))))
print(paste("Implied Odds of winning are", imp_odds))
