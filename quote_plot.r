library(ggplot2)
raw_quotes = read.csv("raw_quotes.csv", header=TRUE, stringsAsFactors=FALSE)
interp_quotes = read.csv("processed_quotes.csv", header=TRUE, stringsAsFactors=FALSE)
names(raw_quotes)<-c("id", "time", "value")
names(interp_quotes)<-c("id", "time", "value", "comment")
raw_quotes$time<-as.POSIXlt(raw_quotes$time, "UTC")
interp_quotes$time<-as.POSIXlt(interp_quotes$time, "UTC")
raw_quotes$group="imported quotes"
interp_quotes$group="processed quotes"
selected_rows = c("time", "value", "group")
dat = rbind(raw_quotes[,selected_rows], interp_quotes[,selected_rows])
plot = ggplot(aes(x=time, y=value, linetype=group), data = dat) + geom_line(alpha=0.5)
ggsave(filename="quote_plot.svg", plot=plot, width=8, height=3)
