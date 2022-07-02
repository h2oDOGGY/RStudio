# if line is postive
# underdog

# if line is negative
# favorite

# amount bet
xbet <- 10

# line amount
xline <- 350

# line amount
yline <- -120


# convert american odds to decimal odds
odds_decimal_x <- if (xline >0) 
{
  1+(xline/100) # postive xbet
} else {
  (100/-xline)+1 # negative xbet
}

odds_decimal_y <- if (yline >0) 
{
  1+(yline/100) # postive xbet
} else {
  (100/-yline)+1 # negative xbet
}

# calculate earning_x with American Odds
earning_x <- if (xline >0) 
{
  (xline*xbet/100) # postive xbet
} else {
  (xbet*100/(-1*xline)) # negative bet
}

# calculate hedging bet amount
ybet <- (earning_x + xbet)/odds_decimal_y

# calculate earning_y with American Odds
earning_y <- if (yline >0) 
{
  (yline*ybet/100) # postive xbet
} else {
  (ybet*100/(-1*yline)) # negative ybet
}

# total bet amount
ttl_bet <- xbet + ybet

# total payout amount
ttl_payout <- earning_x+xbet


# calculate potential profit
potential_profit <- ttl_payout - ttl_bet

# final outputs
if (potential_profit>0)
{
  print(paste("Bet",xbet,"at", xline,"and hedge with",
              format(round(ybet,2)), "at", yline, "to win",
              format(round(potential_profit, 2))))
} else {
  print("Don't make this bet!!")
}
