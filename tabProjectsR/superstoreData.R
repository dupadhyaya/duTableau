#list files of git hub repository

folder1 = 'E:/analytics/projects/duTableau'
dir(folder1)

datafolder1 = 'E:/analytics/projects/duTableau/data/'
dir(datafolder1)

library(readxl)

sampleStore = readxl::read_xls(path=paste0(datafolder1,'sampleSuperstore.xls'))
dim(sampleStore)
head(sampleStore)

?read_xlsx
globalStore = readxl::read_xls(path=paste0(datafolder1,'globalSuperstore.xls'), n_max=2)
dim(globalStore)
head(globalStore)
names(globalStore)
names1 <- c("RowID", "OrderID", "OrderDate", "ShipDate", "ShipMode",  "CustomerID", "CustomerName",  "Segment","City", "State", "Country","PostalCode", "Market", "Region", "ProductID", "Category","SubCategory","ProductName", "Sales", "Quantity", "Discount", "Profit","ShippingCost",  "OrderPriority")
globalStore = readxl::read_xls(path=paste0(datafolder1,'globalSuperstore.xls'), n_max=2, col_names = names1)
names(globalStore)
