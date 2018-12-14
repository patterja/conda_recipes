#!/usr/bin/env Rscript

require(EPIC)
require(ggplot2)
require(reshape2)
require(argparse)

parser <- ArgumentParser()
parser$add_argument("bulk",help="A matrix of the gene expression from each bulk sample.")
parser$add_argument("-r", "--reference", default="TRef", help="A string or file defining the reference cells.") 
parser$add_argument("-w", "--withothercells", action="store_true", default=TRUE, help="If EPIC should allow for an additional cell type for which no gene expression reference profile is available.")
parser$add_argument("-m", "--mRNA_cell", default=NULL, help="The amount of mRNA for each of the reference cells and of the other uncharacterized (cancer) cell.")
parser$add_argument("-g", "--sigGenes",default=NULL, help="Gene names to use as signature for the deconvolution.")
parser$add_argument("-e", "--scaleExprs", default=TRUE, help="If the bulk samples and reference gene expression profiles should be rescaled.")
parser$add_argument("-c", "--constrainedSum", default=TRUE, help="If the sum of all cell types should be constrained to be < 1.")
parser$add_argument("-b", "--rangeBasedOptim", default=FALSE, help="If EPIC should be run using range based optimization.")
args <- parser$parse_args()

# Check Args
if (file_test("-f", args$reference)) {
    reference = list()
    reference$refProfiles = read.csv(args$reference, sep="\t", row.names=1, header=TRUE)
    reference$sigGenes = scan(args$sigGenes, character())
} else {
    reference = args$reference
}

if (is.null(args$sigGenes)) {
    sigGenes = args$sigGenes
} else if(file_test("-f", args$sigGenes)) {
    sigGenes = scan(args$sigGenes, character())
}

if (is.null(args$mRNA_cell)) {
    mRNA_cell = args$mRNA_cell
} else if(file_test("-f", args$mRNA_cell)) {
    mRNA_cell = scan(args$mRNA_cell, character())
}

# Run EPIC
bulk = read.csv(args$bulk, sep="\t", row.names=1, header=TRUE)
cat(args$withothercells)
res <- EPIC(bulk=bulk, reference=reference, withOtherCells=args$withothercells, mRNA_cell=mRNA_cell, sigGenes=sigGenes, scaleExprs=args$scaleExprs, constrainedSum=args$constrainedSum, rangeBasedOptim=args$rangeBasedOptim)

# Write results
write.table(res$mRNAProportions, file="epic_mRNAProportions.tsv", sep="\t", quote=FALSE)
write.table(res$cellFractions, file="epic_cellFractions.tsv", sep="\t", quote=FALSE)
write.table(res$fit.gof, file="epic_gof.tsv", sep="\t", quote=FALSE)

# Make plot
res.df <- melt(res$cellFractions)
colnames(res.df) <- c("Sample","Cell_type", "value")
head(res.df)
res.plot <- ggplot(res.df,aes(x=Sample,y=value,fill=Cell_type)) + 
    geom_bar(stat = "identity", position = "stack") + 
    labs(x=NULL, y="Cell %") +
    theme_minimal() + 
    theme(axis.text.x = element_text(angle = 90))
#res.plot

# Save plot
#ggsave("epic_cellFractions.png", plot=res.plot)
pdf("epic_cellFractions.pdf")
print(res.plot)
dev.off()
