library(tm)
library(wordcloud)
lords<-Corpus(DirSource("C:\\Users\\Dev Mehta\\OneDrive\\Desktop\\ISTE-Task/"))
lords<-tm_map(lords,tolower) 
lords<-tm_map(lords,removePunctuation)
lords<-tm_map(lords,removeNumbers)
lords<-tm_map(lords,stripWhitespace) 

tdm <- TermDocumentMatrix(lords)
m<- as.matrix(tdm)
v <- sort(rowSums(m),decreasing = TRUE)
d<-data.frame(word=names(v),freq=v)

wordcloud(d$word,d$freq,random.order = FALSE, rot.per = 0.3,scale=c(4,.5),
          max.words = 101, colors = brewer.pal(5,"Dark2"))
title(main = "Word Cloud - Budget Speech",font.main=1,cex.main=1.5)