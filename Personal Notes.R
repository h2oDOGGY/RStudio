# Basic Commands

# create object
object.name = expression()
ans1 = 23 + 14/2 - 18 +(7 * pi/2)
ans1

# cancel a command
ctrl + c

# display object
ls()
# delete object
remove(object.name)
rm(list)

#making data
sample.name = c(item.1, item.2, item.3, item.n)
data1 = c(3, 5, 7, 5, 3, 2, 6, 8, 4, 6, 9)
data1

#combine data
data2 = c(data1, 4, 5, 7, 3, 4)
data2

#entering text items as data
sample.name = c("item.1", "item.2", "item.3", "item.n")
day1 = c('Mon', 'Tue', 'Wed', 'Thu')
day1 

#mix data
mix = c(data1, day1)
mix

#read CSV
read.csv (file, sep =',', header = TRUE, row.names)

#save name ojbects
save(list, file - 'filename')

#save everything
save(list = ls(all=TRUE), file = 'file.name')
save.image(file = 'file.name')

#pull one column from dataframe, this creates list
newname = data.frame.X$column.name

#delete a column from a dataframe
data.frame$column <- NULL

#convert a numeric matrix to a data frame
file2frame = as.data.frame(file)

#convert a data frame to matrix
file.mat = as.matrix(file)

#conver data frame into a list
newname = as.list(name)

#convert matrix to list
newname = as.list(as.data.frame(name))

#convert list to something else
newname = data.frame(name)
newname = as.matrix(data.frame(name))

#change names
names(file) = c('new.name1', 'new.name2', 'new.nameN')

#create numeric vector
name = c(1, 2, 3, N)

#provide basis statiscal summary
summary(file)

#rotating data frame
t(data.frame)
