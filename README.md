# Highland/Lowland popgen in maize in Mexico and S. America

## Data Files

- highlow_gbs_hapmaps.gz (not tracked by git) -- all GBS data from all individuals. on Farm and on JRI laptop.
- dat5.zip, list of SNPs with very high Fst values. see data_readme.md for description

##Notes

###Define parallel adaptation

We don't want to try to distinguish between parallel and convergenet evolution.
We do need to define what we mean carefully. 
Do we just mean "are the same loci used"? 
That seems to be what we're saying in intro, but then the theoretical analysis only evaluates mutation vs. gene flow and can't (?) say much about standing variation.

###Missing sweeps

Once concern repeatedly raised by GC is how many selected loci we may be missing. Is this a reasonable back-of-the-envelop?:

	width<-function(s,c){ return(0.01*s/c) } 
	snps=90000
	#uses width of diversity reduction in sweep result. better result to use?
	prob<-function(s,c){ return(width(s,c)*snps*2/2.3E9) }
	#twice width to include either side of SNP
	loci=1:100
	#plug in s, assume rec per bp is ~1E-8
	pbinom(round(loci/2,0),loci,prob(0.01,1E-8))

	#alternatively assume need to be in high LD (say 100bp on either side), so we "tag" 200bp per SNP.  
	#then prob becomes
	snps*200/2.3E9
	#which sucks worse

The first bit gives us that we should pick up majority of strongly selected sites (s=0.01) but for weaker selection (s=0.001) our chance of missing all the sites remains substantial until number of selected sites >>50

The other concern is what about sites which are not tagged by any locus in the genome? 
I argue these are few, as we see no fixed differences, and we have high diversity, so something under selection that has arisen to appreciable frequency should be in LD w/ a SNP. 
Thoughts?

###GWAS

We see no enrichment of Fst or PHS for significant GWAS hits.  But what about:

- difference in allele frequency (a la Turchin?)
- Bergian analysis? Probably too much to add
- instead do GWAS on difference between high and cold? perhaps just cite Munjal et al. in prep?
- incorporate full-on GWAS of all traits? (again, too much to add at this point)

###Paste Bin

Needs to go in discussion to compare genetic architecture:
	While the large number of environmental factors implies that a large number of adaptive changes may be required to colonize high altitude environments, evidence of selection in multiple mammal species consistent with the idea that parallel adaptation depends on the genetic architecture of individual traits.\cite[]{Yi_2010_20595611,Simonson_2010_20466884,Storz_2007_17397259,Qiu_2012_22751099}.


