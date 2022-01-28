#clear console
ctrl + L

#see all available colors
colors()

#Run entire script
ctrl + shift + enter

#Run just line
ctrl + enter #at line

#run portion of script
enter #after script is highlighted

#Beginning R
#Chpt1

#Help in Command in R
help(topic)
?topic

#show packages loaded
search()

#show packages installed
installed.packages()

#to install a package
install.packages('x')

#loading packages
library(x)

#attach a list, data frame and environment
attach(object.name)

#remove or unload a pacakge
detach(package:x)

#Chpt2

#simple math
#input equation as is, remember to use PEMDAS

#Assigning object names
Object.name = Calculation
Object.name <- calculation
calcuation -> Object.name

#Making data
object.name = c(x,y,z) #to create numeric vector
object.name = c('x','y','z') #to create text vector
object.name = scan() #for numeric input data, hit enter twice to complete
object.name = scan(what = 'c') #for text input data, hit enter twice to complete

#make data from file
object.name = read.table ()
object.name = read.csv () # to read csv files
object.name = read.tsv ()
object.name = read.delim ()
#can also use (these have different defaults)
object.name = read_delim ()
object.name = read_csv ()
object.name = read_tsv ()
object.name = read.delim ()

  #to read tab seperated values 
  sep = '\t'
  #to read comma seperated values 
  sep = ','
  #to read semi-colon seperated values 
  sep = ';'
  #if header contains col names
  header = TRUE
  
#view previously loaded objects
ls()
ls(pattern = 'x') #search for EVERYTHING containing X
ls(pattern = 'XY') #search for EVERYTHING containing XY
ls(pattern = '^x') #search for BEGINNING with X
ls(pattern = '^x| ^Y') #search for BEGINNING with X OR BEGINNING with Y
ls(pattern = 'x$') #search for ENDING with X
ls(pattern = 'A.E') #search for containng A WILDCARD E
ls(pattern = 'A..E') #search for containng A WILDCARDs E

#remove objects from R (use with caution)
rm(object.name) # can list more than one object to remove at a time
remove(object.name) #can list more than one object to remove at a time

#data types
number (numeric, integer)
character (factor, character)

#data form
vector #single dimensional structure
data frame # two dimensional structure
matrix #two dimensional structure, however all data must be the same type
list #series of times bundled together to forma  single object

#examine data structure
str(object.name) #prefer
class(object.name) #to show data form
dim(object.name) #to show dimensions
names(object.name) #to show col names of data frame
summary(object.name) #show general summary stat data

#saving and loading data
save(x,y,z, file =) #can be used to save one or more object to file
save.image(file =) #used to save all objects to a file
load(file=) #used to recall
write(x, file=) #save plain text object
write.csv(data, file = ) #save plain text object

#Chpt3
#select parts of a vector
object.name[1] #select 1st item
object.name[3] #select 3rd item
object.name[1:3] #select 1st through 3rd items
object.name[-1] #select all items except 1st
object.name[c(1,3,5)] #select 1st, 3rd and 5th items
object.name[object.name > 3] #select all items greater than 3
object.name[object.name < 5 | object.name > 7] #select all items less than 5 or 
                                               # greater than 7

#sort or rearrange a vector
sort(object.name, decreasing = TRUE) #sort descending, default is FALSE i.e. ascending
sort(object.name, na.last = NA) #NA is dropped
sort(object.name, na.last = TRUE) #NA is last
sort(object.name, na.last = FALSE) #NA is first
order(object.name)
rank(object.name, ties.method = , na.last = )

#returns logical values from vector
which(object.name == X) #gives whcih values within vector are equal to X

#Select and display parts of a data frame or matrix
object.name[row,col]

#sort or rearrange a data frame or matrix
sort(object.name[row, col]) #for matrix
order(object.name[row, col]) # for matrix
sort(object.name[row,col]) #for data frame
sort(object.name[,'x']) #for data frame
sort(object.name$col.name)] #for data frame

#look at 1st or last nth
head(object.name, n = ) #default is 6
tail(object.name, n = ) #default is 6

#view names
names() #works on list, matrix and data frame
row.names() #works on matrix and data frame
rownames() #works on matrix and data frame
col.names() #works on matrix and data frame
colnames() #works on matrix and data frame
dimnames() # looks at both row and col names but only for matrix

#set names
row.names(object.name) = c('x', 'y', 'z') #can also use for col.names
  #alternative method
object.name = c('x', 'y', 'z') #step 1
row.names(X) = object.name #step 2

#rotate data table
object.name = t(X)

#make a list
object.name = list(a, b, c) #best used to join several vectors

#make a data frame
object.name = data.frame(item1, item2, item3)

#make matrix
object.name = cbind(item1, item2, item3) # creates columns of matrix
object.name = rbind(item1, item2, item3) # creates row of matrix

#re-ordering data frames
ii = with(object.name, order(col, col)) #create an index; 1st col is order, 2nd is tie
                                        #can use more than 1 tie
object.name.new = object.name[ii,] #create new data frame based on sort created

#re-ordering matrix
ii = order(object.name[,x], object.name[,y]) #create an index; 1st col is order
                                             #2nd is tie can use more than 1 tie
object.name[ii,] 

#add column to data frame
object.name = data.frame(vector1, vector2, vector3)
#or
col.names <- (object.name) <- c('a','b','c')
#add row to data frame
object.name = data.frame(vector1, vector2, vector3)
#or
row.names <- (object.name) <- c('a','b','c')


#add column to matrix
cbind(object.name, vector) #used for vector
cbind(object.name, matrix) #used to add matrix

#remove col or row from data frame
object.name[-row,] #remove row
object.name[, -col] #remove col

#remove col or row from matrix
object.name[-row,] #remove row
object.name[, -col] #remove col


#chpt4
#summarize objects
summary(X) #gives quick statiscal summary

#summarize samples
mean()
median()
max()
min()
sd()
var()
length()
sum()
quantile()
fivenum()

#Cumulative statistics
cumsum()
cummax()
cummin()
cumproduct()
seq_along() # used to create a simple index

#summarize rows and columns
colSums()
colMeans()
rowSums()
rowMeans()
apply() #any function can be used
lapply() #similar but works only with list objects
sapply() #similar but works only with list objects

#Contingency tables and cross tabulations
table() # used to create contingency table
ftable() #used to flat contigency table, when data has several columns
xtabs() #used to cross tabulate a contingency table

#Table summaries
maring.table() #sums for rows/colums
prop.table() #determines the proportion that table entries make toward the total
addmargins() #applies any function to rows/columns of a table

#Chpt5
#numerical distribution
rfoo() #random number distribution
pfoo() #determines probability
qfoo() #calculates quantities
dfoo() #determines density

#random numbers
RNGkind()
set.seed() #determines starting point
sample() #selects random elements from larger data sample

#drawing distribution
stem() #creates simple stem and leaf plot
hist() #creates histogram
density() line() #allows density to be drawn onto graph via the line command
qqnorm() qqline() #quantitle-quantitle plots can be deal with using qqnorm, which plots
                  #a distribution against a theoritcal normal; qqline adds a line
qqplot() #enables two distributions to be plotted against one another

#testing distribution
shapiro.test() #test normality of distribtution using Shapiro-Wilk test
ks.test() #test normality of distribtution using Kolmogorov-Smirnov test

#graphics
plot() #quick line plot, often call in background of qqplot()
abline() #adds straight lines to existing graphs
lines() #adds sections of a line to existing graph and can be used to add density plot
        #to existing histogram
lty = #changes line style
  #0 = blank
  #1 = solid
  #2 = dash
  #3 = dotted
  #4 = dotdash
  #5 = longdash
  #6 = twodash
lwd = #changes line width
xlim = c(start, end)#gives coordinates for x range
ylim = c(start, end) #gives coordinates for y range
xlab = #title for x axis
ylab = #title for y axis
main = #overall title for the plot
colors() #shows list of colors available
colours() #shows list of colors available
lm() #determines slope and intercept 

#sample data
sample(x, size = n)

#Shapiro - Wilk
#Null hypothesis is item we want to accept or see no change
#Alternative hypothesis is what we we want to believe will change to
#If the p-value bigger than 0.05 then  Do not reject the Null Hypothesis
#If the p-value smaller than 0.05 then Reject the Null Hypothesis

#Chpt 6 - Simple Hypothesis testing

#T-test
t.test(data1, data2) #two-sample; response variable (data1) predictor variable (data2)
t.test(y ~ x, data) #one sample

#U-Test
wilcox.test(data1, data2)#two-sample; response variable (data1) predictor variable (data2)
wilcox.test(y ~ x, data) #one sample
exact = FALSE #use to turn off attempt use of exact p-value with ties
#Paired tests
t.test(x,y, paired = TRUE) 
wilcox.test(x,y, paired = TRUE) 
#pairs with NA will be dropped
#pairs must be equal length

#subsetting
t.test(col1 ~ col2, data = , subset = col2 %in% c('p1', 'p2'))

#covariance
cov(x,y) #can specific 'pearson' (default),'spearnman', 'kendall'; cab be abbreciated
cov2cor(matrix) #covariance matrix can be converete to correlation matrix 

#correlation
cor(x,y) #can specific 'pearson' (default),'spearnman', 'kendall'; cab be abbreciated

#correlation hyptthesis test
cor.test(x,y)
cor.test(~ y + x, data) 
#can specific 'pearson' (default),'spearnman', 'kendall'; cab be abbreciated
#can only compare two variables at a time

#association test
chisq.test(x,y = NULL) #ch-squared tests of association
#if X is a data frame or matrix, Y is ignored

#Goodness of fit test
chisq.test(x, p = rescale.p = FALSE) 
#single vector must be given for the test data and thr probablities to test against
#are given as p. If they do not sum to 1, can use "rescale.p" instruction.
#If P is not given, the probablities are taken as equal

#Monte Carlo simulation
simulate.p.value = FALSE
B = 2000
#for chi-squared tests of association or goodness of fit
#the number of trials is set to 2000, however you can alter

#Rounding values
round(object, digits = ) #default round = 6

#Chpt 7 - Introduction to Graphical Analysis
boxplot() #box and whiskerplot
plot() #scatterplot
pairs() #multiple correlation plots
axis() #line plots and custom axes
pie() #pie charts
dotchart() #cleveland dot charts
barplot() #barplots

#moving and saving graphics
dev.copy() #used to save file on a disk
dev.off() #finalize the process

#Chpt8 - Formula Notation and Complex Statistics
response ~ predictor #formula syntax

#stacking samples
stack() #used to rearrange data into 2D

#Analysis of Variance (ANOVA)
aov() #carries out ANOVA
TukeyHDS() #post-hoc test used to carry out pairwise comparisons

#interaction plots
interaction.plot()

#extracting elements of an ANOVA
model.tables()
tapply() #useful in being able to use any function on the data (extact means, stand dev..)

#Replictions and balance
replications()

#Chpt9 - Manipulating data and extracting components
#making data items
lenght() #can query the current length or alter it

#making data items
names()  #works on data frame
row.names() #works on data frame
rownames() #works on matrix
colnames() #works on matrix

#stacking seperate vectors
stack() #combines vectors to form easier data frame; only works when you have a single 
#response variable and single predictor

#remove NA items
na.omit()

#construct a data frame
data.frame()

#construct matrix
matrix()
cbind() #combine elements by column
rbind() #combine elements by row

apply() #enables you to give command across rows or columnns of a data frame or matrix

tapply() #enables grouping variables

aggregate() #enables grouping variables as a 2d data frame

#Chpt10 - Regression (linear modeling)

#simple regression
cor.test() #carries out simple linear regression
lm() #more powerful than cor.test()

#regression results
coef()
fitted()
resid()
cofint()

#best fit line
abline() #adds straight line
fitted()
spline()

#ANOVA and lm()
anova()

#model building
add1() #move forward
drop1() #backward deletion

#confidence intervals
predict()
lines()
spline() #smooth curve

#Chpt 11 - More About Graphs
#error bars
segments()
arrows() 

legend() 
palette()

#text
expression()
text()

#axis labels
las cex.axis
col.axis
par(mar) #margin modification

#marginal text
mtext()

#math
expression()
curve()

#lines
abline()
curve()
line()

#gridlines
segments( x_start, y_start, x_end, y_lab)
arrows()

#plot series graphs
points()
lines()
matplot()
matpoints()
matlines()

#splitting the graphics window
par(mfrow)
par(mfcol)
plot.new()
split.screen()
screen()
close.
screen()
erase.screen()

#exporting graphs
windows()
quartz()
X11()
png()
pdf()
dev.copy()
dev.
print()
dev.off()

#Chpt 12 - Writing your own scripts: Beginning to Program
#brings it all together