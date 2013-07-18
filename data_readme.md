# Filtered SNPs

file = filteredSNPs.zip
List of all SNPs used in study after filtering for quality, HWE, missing data, etc. 

### Column:

1st: chromosome
2nd: SNP ID (start with S1-10_: GBS, others: 55-k SNP)
3rd: allele 1/2 in Mexico pops (only allele 1 is shown if monomorphic)
4th: Position
5th: Sample size in Mex low (-9 if monomorphic)
6th: Sample size in Mex high
7th: Freq allele 1 in Mex low
8th: Freq allele 2 in Mex low
9th: Freq allele 1 in Mex high
10th: Freq allele 2 in Mex high
11th: Fst between Mex low and high
12th: Fst P-value under Model I
13th: Fst P-value under Model II
14th: allele 1/2 in SA pops (only allele 1 is shown if monomorphic)
15th: Sample size in SA low
16th: Sample size in SA high
17th: Freq allele 1 in SA low
18th: Freq allele 2 in SA low
19th: Freq allele 1 in SA high
20th: Freq allele 2 in SA high
21th: Fst between SA low and high
22th: Fst P-value under Model I
23th: Fst P-value under Model III

#Outlier SNPs

File is fst_outlier_snps.zip, the list of SNPs with very high Fst values.
You find chr1-10.out that are tab-delimited files.
Each line contains the information of each SNP.
SNPs are divided by "###" into "Genetic Unit" as defined in our manuscript 

### Columns:
1st: chromosome
2nd: position on a chromosome ver. 2
3rd: First/Second alleles (allele 1 and 2 below)
4th: Freq. teosinte 1
5th: Freq. teosinte 2
6th: Freq. Mex low 1
7th: Freq. Mex low 2
8th: Freq. Mex high 1
9th: Freq. Mex high 2
10th: Freq. SA low 1
11th: Freq. SA low 2
12th: Freq. SA high 1
13th: Freq. SA high 2
14th: A1: Significant Fst values both in Mex and SA
        B1: Significant Fst values in Mex, polymorphic in SA
        B2: Significant Fst values in Mex, monomorphic in SA
        C1: Significant Fst values in SA, polymorphic in Mex
        C2: Significant Fst values in SA, monomorphic in Mex
15-18th: P-value of PHS
19th: my memo
20th: 1: PHS test is consistent with Fst test
        0: inconsistent
        2: complicated pattern
21th: describe something if teosinte and maize have three alleles, 
22th: Genes on which or near to which a SNP is located
23th: SNPs on exons
24th: SNPs on introns
25th: SNPs on UTRs
26th: SNPs on intergenic regions, <10kp from the nearest gene
27th: SNPs on or near miRNA (all are "NA")
