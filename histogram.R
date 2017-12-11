# comparing the differences between our z-scores and "sample data 

z1 = read.table("50_Z.txt")
z2 = read.table("DDB1.top100.sig.SNPs.ZScores.txt")

f1 = read.table("gwasFscore")
f2 = read.table("eqtlFscore")

ld1 = data.matrix(read.table("50_LD.txt"))
ld2 = data.matrix(read.table("LDgwas"))

bins = seq(-10, 10)
hist(z2$V2, col="red", freq = FALSE, breaks=bins, xlab="z-score", main="GWAS sample data vs our simulation")
hist(f1$V2, col="blue", freq=FALSE, breaks=bins, add=T)
legend("topright", c("sample", "simulated"), fill=c("red", "blue"))

bins=seq(-15, 15)
hist(z1$V2, col="red", freq = FALSE, breaks=bins, xlab="z-score", main="EQTL sample data vs our simulation")
hist(f2$V2, col="blue", freq=FALSE, breaks=bins, add=T)
legend("topright", c("sample", "simulated"), fill=c("red", "blue"))

color.palette  <- colorRampPalette(c("#FC8D59", "#FFFFBF", "#91CF60"))(length(palette.breaks) - 1)

require(gplots)
heatmap.2(ld1, Rowv=NA, Colv=NA, col = heat.colors(256), , scale="column", dendrogram="none")
heatmap.2(ld2, Rowv=NA, Colv=NA, col = heat.colors(256), , scale="column",dendrogram="none")
dev.off()

