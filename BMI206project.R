#set directory
setwd("~/Desktop/GWAS-EQTL-master/")

#import haps data

hapscases = read.table("hapgen_out_chr1.txt.cases.haps")
hapscontrols = read.table("hapgen_out_chr1.txt.controls.haps")

#creates one matrix with all individuals -- first 100 cols are cases, cols 101-200 are controls
hapsall = cbind(hapscases,hapscontrols)

N = ncol(hapsall)/2

genos = matrix(0,nrow=nrow(hapsall),ncol=2*N)

#sequence to sum genos into {0,1,2}
people = seq(1,(ncol(hapsall)-1),2)

for (j in people)
    genos[,j] = hapsall[,j] + hapsall[,(j+1)]

#remove all-zero columns
genos = genos[,colSums(genos) != 0]

#standardize the genotype matrix by column
stdgenos = scale(genos,center=TRUE,scale=TRUE)

#filter out monomorphic alleles and allels with MAF<=0.01 --- could change this filtering and see how results compare


#calculate LD matrix
LD = cor(t(genos))

