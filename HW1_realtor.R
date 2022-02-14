property <-HW1_realtor_data

# Q1
mean(property$`Listing Price`)
median(property$`Listing Price`)
hist(property$`Listing Price`, main="Histgram of properties' price", 
     xlab="Price($)", breaks = 100)

# Q2:
# What¡¦s the mean, median, and distribution (histogram) of price by 
# number of bedrooms? Make 1 histogram for each number of bedroom.
aggregate(property$`Listing Price`, list(property$Beds), mean)
aggregate(property$`Listing Price`, list(property$Beds), median)
hist(property$`Listing Price`, main="Histgram of price of different bedrooms", 
     xlab="Price($)", breaks = 100, col=as.factor(property$Beds))

# mean(property$`Listing Price`[property$Beds==5])

# Q3:
# Is there any relationship between year built and price? 
# Use a graph to show the relationship. 
plot(x=property$`Year Built`,y=property$`Listing Price`,
     main="Relationship between year built and price",
     xlab="Year Built",ylab="Price")
abline(lm(property$`Listing Price`~property$`Year Built`))


# Q4:
# What kind of property is best for Airbnb investors?
# Such as which zip code to look for a house, 
# look for bigger or smaller houses, newer or older houses, 
# apartment or single family, etc.? 
# You can choose what analysis to perform, as long as your 
# recommendations are backed up by your analysis.

# Sort data by `Airbnb Cash on Cash` in decreasing order
sort.CoC <- property[order(-property$`Airbnb Cash on Cash`) , ]

# Home Type
aggregate(property$`Airbnb Cash on Cash`, list(property$`Home Type`), mean)
aggregate(property$`Airbnb Cash on Cash`, list(property$`Home Type`), median)

# Zip
aggregate(property$`Airbnb Cash on Cash`, list(property$Zip), mean)
aggregate(property$`Airbnb Cash on Cash`, list(property$Zip), median)

# Listing Price
plot(x=property$`Listing Price`,y=property$`Airbnb Cash on Cash`,
     main="Relationship between Listing Price and CoC",
     xlab="Year Built",ylab="Price")

# Baths
aggregate(property$`Airbnb Cash on Cash`, list(property$Baths), mean)
aggregate(property$`Airbnb Cash on Cash`, list(property$Baths), median)

# Beds
aggregate(property$`Airbnb Cash on Cash`, list(property$Beds), mean)
aggregate(property$`Airbnb Cash on Cash`, list(property$Beds), median)

# SQFT
plot(x=property$SQFT,y=property$`Airbnb Cash on Cash`,
     main="Relationship between SQFT and CoC",
     xlab="SQFT",ylab="Airbnb Cash on Cash")

# Year Built
plot(x=property$`Year Built`,y=property$`Airbnb Cash on Cash`,
     main="Relationship between year built and CoC",
     xlab="Year Built",ylab="Airbnb Cash on Cash")


# Q5: 
# If an Airbnb investor only have $100,000, 
# how would you advise he/she to invest?
# Try to search for a function that can subset / 
# filter the dataset to create a new dataset that only includes 
# houses that are cheaper than $ 100,000.  
limit <- property[property$`Listing Price` < 100000,]



