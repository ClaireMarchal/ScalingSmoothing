#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# test if there are 3 arguments: if not, return an error
if (length(args)!=3) {
   stop("Two arguments must be supplied (input, output scaled and output scaled/smoothed file names)", call.=FALSE)
}

EL<-read.table(args[1],header=FALSE)
EL[,4]<-scale(EL[,4])
write.table(EL,args[2],row.names=F,col.names=F,quote=F,sep="\t")

merge_norm<-EL
names(merge_norm)<-c("chr","start","stop","value")

chrs=grep(levels(as.factor(merge_norm$chr)),pattern="[_XYM]",invert=TRUE,value=TRUE)
AllLoess=data.frame()
for(Chr in chrs){
	RTb=subset(merge_norm, merge_norm$chr==Chr)
	lspan=300000/(max(RTb$start)-min(RTb$start));
	RTla=loess(RTb[,4] ~ RTb$start, span=lspan);
	RTl=data.frame(c(rep(Chr,times=RTla$n)), RTla$x, merge_norm[which(merge_norm$chr==Chr & merge_norm$start %in% RTla$x),3],RTla$fitted);
	if(length(AllLoess)!=0){
		AllLoess=rbind(AllLoess,RTl)};
	if(length(AllLoess)==0){
	AllLoess=RTl}}

write.table(AllLoess,args[3],row.names=F,col.names=F,quote=F,sep="\t")