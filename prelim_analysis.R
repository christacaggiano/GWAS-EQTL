# summary stats for simulated data 
# biostats BMI 206 
# c caggiano, s naing, m turner, 

# sets working directory 
setwd("/Users/Christa.Caggiano/Desktop/")

# loads genotypes 
geno = read.table("hapgen_out_chr1.txt.cases.gen")

# makes a new column with just the homozygous observations
geno$homozy = geno$V6 + geno$V8 
# gets number of homozygous and heterozygous 
counts = table(geno$homozy, geno$V7)

# prints this table 
print(counts)

# installs fancy fonts for no good reason 
quartzFonts(avenir = c("Avenir Book", "Avenir Black", "Avenir Book Oblique", 
                       "Avenir Black Oblique"))

par(family = 'avenir')
grid(col='grey')
barplot(counts, col=c("gray8", "grey20"), ylab = "counts", xlab="genotype",
        names=c("homozygous", "heterozygous"), border=NA)

allele_counts = table(geno$V4, geno$V5)
par(xpd=TRUE)
barplot(allele_counts, col=c("grey10", "grey20", "grey30", "grey40"), legend=rownames(allele_counts))
