## pivotTable 패키지 설치
install.packages("rpivotTable")
library(rpivotTable)

bakery2

rpivotTable(bakery2,rows="promotion", cols="season" ,vals = "coffee"
            ,aggregatorName = "Sum", rendererName = "Table",width="100%",
            height="400px",na.rm = TRUE)
