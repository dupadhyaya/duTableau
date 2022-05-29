#list files of git hub repository

folder1 = 'E:/analytics/projects/duTableau'
dir(folder1)

datafolder1 = 'E:/analytics/projects/duTableau/data/'
dir(datafolder1)
pacman::p_load(dplyr, readxl, ggplot2, tidyr)

sampleStore = readxl::read_xls(path=paste0(datafolder1,'sampleSuperstore.xls'))
dim(sampleStore)
head(sampleStore)

?read_xlsx
globalStore = readxl::read_xls(path=paste0(datafolder1,'globalSuperstore.xls'), n_max=2)
dim(globalStore)
head(globalStore)
names(globalStore)
names1 <- c("RowID", "OrderID", "OrderDate", "ShipDate", "ShipMode",  "CustomerID", "CustomerName",  "Segment","City", "State", "Country","PostalCode", "Market", "Region", "ProductID", "Category","SubCategory","ProductName", "Sales", "Quantity", "Discount", "Profit","ShippingCost",  "OrderPriority")
globalStore = readxl::read_xls(path=paste0(datafolder1,'globalSuperstore.xls'), col_names = names1, skip=1)
names(globalStore)
dim(globalStore)
head(globalStore)

globalStore  %>%  ggplot(., aes(x=Region, fill=Region)) + geom_bar(stat='count', position = position_dodge2(.8)) + coord_flip()

globalStore  %>%  group_by(Region)  %>% summarise(n=n()) %>% ggplot(., aes(x=Region, y=n, fill=Region)) + geom_bar(stat='identity', position = position_dodge2(.8)) + coord_flip()

                                                  
