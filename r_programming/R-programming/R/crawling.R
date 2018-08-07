
############################# crawling ##############################


robhs <- read.csv("robhs.csv")
head(robhs)

url1 <- "http://www.lohbs.co.kr/lohbs_store.jsp"
doc1 <- read_html(url1) 
name <- html_nodes(doc1, xpath = "//*[@id]/tr") 
name <- html_nodes(doc1,x "tr.td") 
name
name <- html_text(name, trim =T) 
name





address <- html_nodes(doc1, xpath = "//*[@id="StoreBody"]/tr[5]")
address <- html_nodes(doc1, "span.address") 
address
address <- html_text(address, trim =T) 
address
index <- c(1:470)
address <- data.frame(address,index,out)
head(address)
address$out <- ifelse(address$index %% 2 == 1, 1, 2)
address <- subset(address, subset = (out == 1))
address <- data.frame(name,address)
head(address)
address$index <- NULL
address$out <- NULL

address_split <- data.frame(do.call('rbind', strsplit(as.character(address$address), split=" ", fixed=T))) 
head(address_split)
local <- address_split$X1
local2 <- address_split$X2
address <- cbind(address,local,local2)
head(address)

write.csv(address,file="watson.csv")