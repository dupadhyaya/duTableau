#Example of filter, Hierarchy, Join, Missing Values in Tableau

glink ='1YUbJHE6PLEuX6Tg5avTTNII3bIp9fIlI-rmm3OtK11I'

pacman::p_load(dplyr, ggplot2, googlesheets4)

(sales = read_sheet(ss=glink, sheet='sales'))

(product = read_sheet(ss=glink, sheet='product'))
(region = read_sheet(ss=glink, sheet='region'))

set.seed(100)
(productS1 <- product %>% sample_frac(.7)  %>% pull(productID))
set.seed(101)
(areaS1 <- region %>% sample_frac(.7)  %>% pull(areaID))
sales1 = expand.grid(productS1, areaS1)
head(sales1);
names(sales1) <- c('productID', 'areaID')
set.seed(103)
sales1$qty = round(runif(n=nrow(sales1), min=10, max=50))
set.seed(104)
sales1$amount = round(runif(n=nrow(sales1), min=100, max=300))
head(sales1)

set.seed(110)
(productS2 <- product %>% sample_frac(.6)  %>% pull(productID))
set.seed(111)
(areaS2 <- region %>% sample_frac(.8)  %>% pull(areaID))
sales2 = expand.grid(productS2, areaS2)
head(sales2);
names(sales2) <- c('productID', 'areaID')
set.seed(113)
sales2$qty = round(runif(n=nrow(sales2), min=15, max=45))
set.seed(114)
sales2$amount = round(runif(n=nrow(sales2), min=80, max=350))
head(sales2)

sales12 = rbind(sales1, sales2)
sales12$profitPerc = sample(x=c(.1,.15,.16), size=nrow(sales12), replace=T, prob=c(.3, .4, .4))
sales123 <- sales12 %>% mutate(profit = round(amount * profitPerc)) %>% select(-c(profitPerc))
(rDate = seq.Date(from = as.Date('2020/01/01'), to=as.Date('2022/05/30'), length=nrow(sales123)))
rDate[lubridate::month(rDate,label=T) == 'May'] <- NA
sales123$saleDate = rDate
(locD <- sample(nrow(sales123), size=10))
head(sales123)
sales123[locD, 6]
sales123[locD, 6] <- NA
colSums(is.na(sales123))
sales123[locD, 6]

sales <- sales123 %>% mutate(year = lubridate::year(saleDate), month=lubridate::month(saleDate, label=T))

dim(sales)
names(sales)
(loc1 <- sample(nrow(sales), size=5))
(loc2 <- sample(nrow(sales), size=5))
names(sales)
sales[loc1, 4] <- NA

(sales3A = merge(x=sales, y=product, by='productID'))
names(sales3A)
names(region)
(sales3B = merge(x=sales3A, y=region, by='areaID'))
head(sales3B)
names(sales3B)
(locS <- sample(nrow(sales3B), size=10))
sales3B[locS, 14] <- NA
sales3B
names(sales3B)
sales3B[sample(x=100:200, size=7),12] <- NA
sales4 <- sales3B

sales4
colSums(is.na(sales4))


write.csv(sales4 , file='./data/sales.csv', row.names = F, na='')


#analyse data in tableau now
