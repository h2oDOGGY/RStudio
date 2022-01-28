#Chpt 1
#1 install "coin"
install.packages('coin')

#2load coin & check to see available commands
library(coin)
help(coin)

#3load MASS & find hlep about "bcv" command
library(MASS)
help(bcv)

#4check to see which libraries of commands are loaded and ready for use
search()

#5clear out 'coin' library loaded earlier and verify 
detach(package:coin)
search()

#Chpt2
#1create five simple numeric vectors using data
buff.tail = c(10, 1, 37, 5, 12)
garden.bee = scan()
8 3 19 6 4
red.tail = scan()
18 9 1 2 4
honey.bee = scan()
12 13 16 9 10
carder.bee = scan()
8 27 6 32 23

#2a save all items created to working directory
ls(pattern = '.tail$|.bee$') #search for objects in memory
ls(pattern = '.tail|.bee') #search for objects in memory
save(list = ls(pattern = '.tail|.bee'), file = 'bee data all.Rdata')

#2b remove all vectors
rm(list = ls(pattern = '.tail|.bee'))

#2c recall all vectors from disk
load('bee data all.Rdata')

#Chpt3
#1create five simple numeric vectors using data
buff.tail = c(10, 1, 37, 5, 12)
garden.bee = scan()
8 3 19 6 4
red.tail = scan()
18 9 1 2 4
honey.bee = scan()
12 13 16 9 10
carder.bee = scan()
8 27 6 32 23
#join to create data frame
bees = data.frame(buff.tail, red.tail, honey.bee, carder.bee)
bees
#use "Thistle, Vipers bugloss, Golden Rain, Yellow alfalfa, blackberry" as row names
plant.names = c('thistle','vipers.bugloss','golden.rain','yellow.alfalfa','blackberry')
#add to data frame
row.names(bees) = plant.names
bees

#2 make a matrix from 1 
#a convert matrix from data.frame
bees.matrix = as.matrix(bees)
class(bees.matrix)
#b convert data.frame to matrix
bees.data.frame = as.data.frame(bees.matrix)
class(bees.data.frame)

#make a list, use plant names as an object to inlcude in the list
bee.list = list(bees, plant.names, bee.names)
bee.list
names(bee.list) = c('bees', 'plant.names','bee.names')
bee.list

#3 Remove all vectors previous created, keep bee data frame and bee list
rm(list = ls(pat = 'bees$|tail|^beem'))
rm(bee.names, plant.names)
#a Display data for blackberry only
bees['blackberry',]
#b display data from golden rate and yellow alfalfa
bees[3:4,]
#c display data for red tail bee only
bees$red.tail # will display only col data with no row info
bees['red.tail'] #will display col data with row info

#re-order data so that buff.tail is sorted decreasing with red.tail as tie-breaker
ii = order(bees$buff.tail,bees$red.tail, decreasing = TRUE)
bees.resort = bees[ii,]
bees.resort
#reorder so that golden rain is in decreasing abudance
ii = order(bees.resort[1,], decreasing = TRUE)
bees.resort2 = bees.resort[,ii]
bees.resort2

#Chpt4
#1 using mf, determine type of object and carry out simple statisical summaries of data
mf
class(mf)
summary(mf)
str(mf)
mean(mf$Speed)
with(mf, mean(Speed))
colMeans(mf)
apply(mf, 2, mean)

#2using bfs, contruct contingency tables using both the table() and ftable()
#output should be the same
bfs
bfs.table <- table(bfs)
bfs.table
#or
bfs.table2 = with(bfs, table(count,site))
bfs.table2
#or
bfs.table3 = with(bfs, ftable(count,site))
bfs.table3
#or
bfs.table4 = ftable(bfs)
bfs.table4
#or
bfs.table5 = ftable(count ~ site, data = bfs)
bfs.table5
rm(bfs.table, bfs.table2, bfs.table3, bfs.table4, bfs.table5)

#3 using invert, use cross tabulation to construct a contingency table showing 
#relationship between Taxa and Habitat; save results as an object; what kind of object 
#do you have and how can you reconstruction the original data
invert
class(invert)
invert.xtab = xtabs(Qty ~ Taxa + Habitat, data = invert) #creates and saves object
invert.xtab
class(invert.xtab) #to show class
as.data.frame(invert.xtab, responseName = 'Qty') #reconstruct to original
invert
rm(invert.xtab)


#Chpt5
#1 examine orchis2, create a histogram from the sprayed site, overlay with density plot
orchis2
str(orchis2)
class(orchis2)
summary(orchis2)
orchis.sprayed <- orchis2$flower[which(orchis2$site =='sprayed')] #extracts data from 
#flower column from orchis2 object, limited to just sprayed items within site column
hist(orchis.sprayed, freq = FALSE)
lines(density(orchis.sprayed))
rm(orchis.sprayed)

#2 determine the critical value (@ 5% and 1% two tailed) of the Wilcoxon statistic for
#a two sample test where n = 8 for both samples. if you carried out a Wilcoxon 
#two-sample test, where each sample contained ten replicates, and got a result of 77
#how could you determine the statistical signficance

qwilcox(c(0.975, 0.995), 8, 8) #qwilcox for critical value; value of 50 or > would be 
#significant at p value < 0.05; value of 56 or > would be  significant at p value < 0.01

2*(1-pwilcox(77,10,10)) #gives distribution function
#or
pwilcox(77,10,10, lower.tail = FALSE)*2
#values are not signficant due to > 0.05

#Chpt6 - Simple Hypothesis Testing

#1 look at InsectSprays, compare effectiveness of spary types A and B using t-test
str(InsectSprays)
summary(InsectSprays)
t.test(count ~ spray, data = InsectSprays, subset = spray %in% c('A', 'B'))

#2 look at hog1 and use a U-Test to compare the abundance
str(hogl)
summary(hogl)
hogl
wilcox.test(hogl$fast, hogl$slow) #or
wilcox.test(hogl$fast, hogl$slow, exact = FALSE) 

#3 look at sleep and carry out a paried t-test on the additional sleep times and different
#drugs
sleep
str(sleep)
summary(sleep)
with(sleep, t.test(extra[group==1], extra[group==2], paired = TRUE))

#4 look at mtcars, 1st look at a correlation matrix of these data, then focus on the 
#correlation between mpg and the other variables. Finally, carry out a correlation test 
#on the mpg and qsec variables
mtcars
str(mtcars)
summary(mtcars)
cor(mtcars)
cor(mtcars$mpg, mtcars)
cor.test(mtcars$mpg, mtcars$qsec)

#5 look at bv and carry out a goodness of fit test to see if the two experiments have give
#the same results
bv
str(bv)
summary(bv)
chisq.test(bv$visit, p = bv$ratio, rescale.p = TRUE)

#Chpt 7 - Intro to Graphical Analysis
#1 using warpbreaks, greate a box-whisker plot of the number of breaks for a different 
#tensions make the plot horizontal and display the whiskers to the extreme
warpbreaks
str(warpbreaks)
summary(warpbreaks)
boxplot(breaks ~ tension, data = warpbreaks, horizontal = TRUE, range = 0, subset = wool 
        %in% 'A', ylab = 'Tension', xlab = 'Break Strength')

#2 using trees data; how can you makea scatter plot of girth versus volumne and 
#display a line of best fit? Modify the axes so that the intercept is shown clearly. 
#Use an appropriate plotting symbol and colors to help make the chart more "interesting"
trees
str(trees)
summary(trees)
plot(Girth ~ Volume, data = trees, ylim = c(5, 20), xlim = c(0,70), 
     xlab = 'Girth', ylab = 'Vol', pch = 20, cex = 1.25, col = 'purple1')
abline(lm(Girth ~ Volume, data = trees), lty = 2, lwd = 2, col = 'green')

#3 use HairEyeColor; use males table to create a Cleveland dot chart; 
#use the mean values for the column as an additional grouping summary result
HairEyeColor
str(HairEyeColor)
summary(HairEyeColor)
dotchart(HairEyeColor[,,1], gdata = colMeans(HairEyeColor[,,1]), 
         gpch = 16, gcolor = 'blue')
title(xlab = 'Number of individuals', main = 'Males Hair and Eye Colour')
mtext('Grouping = mean', side = 3, adj = 1)

#4 using HairEyeColor make a bar chart using female data and add a legend 
#and make the colors reflect the different hair colors
HairEyeColor
str(HairEyeColor)
summary(HairEyeColor)
barplot(HairEyeColor[,,2], legend = TRUE, col = c('Black', 'Brown','Red',
                                                  'Yellow'), 
        beside = TRUE)
title(xlab = 'Hair Color', ylab = 'Frequency')

#5 using bfs, draw a bar chart of the median butterfly abundance from 
#the three sites
bfs
str(bfs)
summary(bfs)
barplot(tapply(bfs$count, bfs$site, FUN = median))
# or
with(bfs, barplot(tapply(count, site, FUN = median)))
abline(h=0)
title(xlab = 'Habitat', ylab = 'Butterfly abundance')
               
#Chpt8 - Formula Notation and Complex Statistics
#1 what are the main advantages of the formula syntax
#allows you to specify complex models, no need to use attach(), with(), 
#file$col; also allows you to create graphs because you can copy the 
#majority of the command for the graph

#2 using chick data object; carry out the one-way ANOVA
chick
str(chick)
summary(chick)
chicks #alrady created, stack(), na.omit(), etc
chicks.aov = aov(weight ~ feed, data = chicks)
chicks.aov
summary(chicks.aov)

#3 using previous data carry out a post-hoc test and also visualze the data 
#and results boxplot( weight ~ feed, data = chicks)
TukeyHSD(chicks.aov)
TukeyHSD(chicks.aov, ordered = T)
plot(TukeyHSD(chicks.aov, ordered =T))
#re-format
oldpar 
plot(TukeyHSD(chicks.aov, ordered =T), las = 1, cex.axis = 0.55)
abline(v = 0, lty = 3, col = 'grey50')
par(oldpar)

#4 using bats, what steps will you need to carry out an ANOVA
bats
str(bats)
summary(bats)
head(bats)
tail(bats)
bats.aov = aov(count ~ spp * method, data = bats)
bats.aov
summary(bats.aov)

#5 make a graphic of the data, then follow up with post-hoc analysis
#draw a graph of the interaction
boxplot(count ~ spp * method, data = bats, cex.axix = 0.75, las = 1, 
        range = 0)
oldpar
plot(TukeyHSD(bats.aov, ordered = T), las = 1, cex.axis = 0.75)
abline(v = 0, lty = 3, col = 'grey50')
par(oldpar)

#interaction plot
attach(bats)
with(bats, interaction.plot(spp, method, count, col = 1:3))
detach(bats)

#chpt9
#1using bees, create a new factor variable that could be used as a grouping variable;
#you can think of the first two as be equivalent (blue) and the last 3 as equivalent
bees
str(bees)
summary(bees)
flcol = factor(c(rep('blue', 2), rep('yellow', 3)))

#2 take bees matrix and add the grouping variable just created
bees2 = cbind(bees, flcolor = as.numeric(flcol))

#3 use flcol grouping variable previously created to summarize buff.tail column in 
#bees data; use any summary command; produce summary for all bees
tapply(bees[,1], flcol, FUN = mean)

#4look at ChickWeight, look at median values for weight broken down by diet
#add time variable as a second group factor
ChickWeight
str(ChickWeight)
summary(ChickWeight)
tapply(ChickWeight$weight, ChickWeight$Diet, FUN = median) #weight broken down by diet
tapply(ChickWeight$weight, list(ChickWeight$Diet, ChickWeight$Time), FUN = median)

#using mtcars, summarize mpg as a mean for the 3 grouping variables (cyl, gear,carb)
tapply(mtcars$mpg, list(mtcars$cyl, mtcars$gear, mtcars$carb), FUN = mean) #good
aggregate(mpg ~ cyl + gear + carb, data = mtcars, FUN = mean) #best

#Chpt10

#1 using mtcars, mpg as response; compare 3 linear models use wt and cyl variables 
#by themselves then together

head(mtcars)
#mpg & wt
mtcars.lm1 = lm(mpg ~ wt, data = mtcars)
plot(mpg ~ wt, data = mtcars)
abline(mtcars.lm1)
#mpg & cyl
mtcars.lm2 = lm(mpg ~ cyl, data = mtcars)
plot(mpg ~ cyl, data = mtcars)
abline(mtcars.lm2)
#mpg & wt & cyl
mtcars.lm3 = lm(mpg ~ wt + cyl, data = mtcars)
plot(mpg ~ cyl + cyl, data = mtcars)
abline(mtcars.lm3)
anova(mtcars.lm1, mtcars.lm2, mtcars.lm3)

#2 with mtcars and wt, plot the relationship between mpg and wt with line of best fit
#and 99 percent confidence intervals
mtcars.lm1 = lm(mpg ~ wt, data = mtcars)
plot(mpg ~ wt, data = mtcars)
abline(mtcars.lm1)
prd = predict(mtcars.lm1, interval = 'confidence', level = 0.99)
prd = as.data.frame(prd)
prd$wt = mtcars$wt
prd = prd[order(prd$wt),]
lines(spline(prd$wt, prd$fit))
lines(spline(prd$wt,prd$lwr), lty = 2)
lines(spline(prd$wt, prd$upr), lty = 2)

#3 take mtcars and create a backward deletion mdoel
mtcars.lm = lm(mpg ~ ., data = mtcars)
formula(mtcars.lm)
drop1(mtcars.lm, test = 'F')
mtcars.lm = lm(mpg ~ disp + hp + drat + wt + qsec + vs + am + gear + carb, data = mtcars)
drop1(mtcars.lm, test = 'F')
mtcars.lm = lm(mpg ~ disp + hp + drat + wt + qsec + vs + am + gear, data = mtcars)
drop1(mtcars.lm, test = 'F')
mtcars.lm = lm(mpg ~ disp + hp + drat + wt + qsec + am + gear, data = mtcars)
drop1(mtcars.lm, test = 'F')
mtcars.lm = lm(mpg ~ disp + hp + drat + wt + qsec + am, data = mtcars)
drop1(mtcars.lm, test = 'F')
mtcars.lm = lm(mpg ~ disp + hp + wt + qsec + am, data = mtcars)
drop1(mtcars.lm, test = 'F')
mtcars.lm = lm(mpg ~ disp + wt + qsec + am, data = mtcars)
drop1(mtcars.lm, test = 'F')
mtcars.lm = lm(mpg ~ wt + qsec + am, data = mtcars)
drop1(mtcars.lm, test = 'F')

#4 compare the forward and backward models of mtcars data
mtcars.lm3 = lm(mpg ~ wt + cyl, data = mtcars)
mtcars.lm4 = lm(mpg ~ wt + qsec + am, data = mtcars)
anova(mtcars.lm3, mtcars.lm4)

#5 produce an overall model plot that shows the line of best fit and confidence bands
mtcars.lm3 = lm(mpg ~ wt + cyl, data = mtcars)
predict(mtcars.lm3, interval = 'confidence')
prd = as.data.frame(prd)
prd$mpg = mtcars$mpg
prd = prd[order(prd$fit),]
plot(mpg ~ fit, data = prd)
lines(spline(prd$mpg, prd$fit))
lines(spline(prd$mpg,prd$lwr), lty = 2, col = 'red1')
lines(spline(prd$mpg, prd$upr), lty = 2, col = 'purple1')

#Chpt 11 - More about Graphs
#1 use hogl, create a bar lot of mean values for the two samples, alter the aspect ratio
#to produce a graph 4 inches wide and 7 inces tall; add error bars to show the standard
#error using the arrows() command
hogl
str(hogl)
hogl.m = apply(hogl, 2, FUN = mean, na.rm = TRUE)
hogl.s = apply(hogl, 2, FUN = sum, na.rm = TRUE)
hogl.sd = apply(hogl, 2, FUN = sd, na.rm = TRUE)
hogl.l = hogl.s / hogl.m
hogl.se = hogl.sd / sqrt(hogl.l)
hogl.y = round(max(hogl.m + hogl.se) + 0.5,0)
hogl.y
windows(width = 4, height = 7)
bp = barplot(hogl.m, ylim = c(0, hogl.y))
arrows(bp, hogl.m + hogl.se, bp, hogl.m - hogl.se, length = 0.1, angle = 90, code = 3)

#2 using hoglouse, make a bar chart, use blocks of bars and use a palatte of rainbow;
#include a legend in the top left of the plot
hoglouse
str(hoglouse)
summary(hoglouse)
barplot(as.matrix(hoglouse), beside = TRUE, legend = TRUE, 
        col = palette(rainbow(9)), 
        args.legend = list(x = 'topleft', bty = 'n'))
#3 using hoglouse, make a hortizontal bar chart, using stack bars to highlight the 
#difference between fast and slow; make the margin wider; add a seperate legend 
#and use a mouse click to position it in an appropriate location
hoglouse
str(hoglouse)
oldpar = par(mar = c(5,5,4,2) +0.1) #is this even needed?
barplot(as.matrix(hoglouse), horiz =  TRUE, beside = TRUE, legend = FALSE, 
        col = c('gray30', 'gray80'))
legend(locator(1), legend = c('Fast', 'Slow'), bty = 'n', fill = c('gray30', 'gray80'))
abline(v=0)
par(oldpar) #is this even needed?

#4 make a scatterplot using matplot() of mf; shown the length against both speed and algae
#use different colors and plotting symbols; add a legend and appropriate axis titles
#include a subscript to indicate measures of length are in mm
mf
str(mf)
mf.x = as.matrix(mf[,2:3])
mf.y = as.matrix(mf[,1])
matplot(mf.x, mf.y, type = 'p', pch = 16:17, col = c('black', 'red'), 
        ylab = expression(Length[mm]), xlab = 'Speed/Algae', las = 1)
legend(x = 'bottomright', legend = c('Speed', 'Algae'), 
       col = c('black', 'red'), pch = 16:17, bty = 'n')