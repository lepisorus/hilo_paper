# Highland/Lowland popgen in maize in Mexico and S. America

## Data Files

- highlow_gbs_hapmaps.gz (not tracked by git) 
- raw GBS data can be found here: http://files.figshare.com/1120798/highlow_gbs_hapmaps.gz 
- dat5.zip, list of SNPs with very high Fst values. see data_readme.md for description

##Notes

### Journal

I'm thinking we aim for PLoS Genetics first. Anybody rather go straight to genetics? If not, Sho please format for PLoS.

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

We see no enrichment of Fst or PHS for significant GWAS hits.  My inclination is to leave out GWAS.

