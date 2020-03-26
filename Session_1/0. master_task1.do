* Author: Glenn Magerman
* Version: December 2019

*----------------------
* 0. Prelims and macros
*----------------------
// folder management
clear all
qui di c(os)												
if c(os) == "MacOSX" {
	global folder 	"~/Dropbox/Research/Papers/current/project" 	// laptop
	}
	
	else if c(os) == "Unix" {
	global folder 	"/home/gmagerman/research/projects/project" 	// server
	}
		
	else {
	global folder 	"D:/User Documents/MAGERMG/project"        		// NBB
}

global task1		"$folder/task1_foo" 
global raw			"$folder/task1_foo/data/raw"
global tmp			"$task1/data/tmp"	
global clean     	"$task1/data/clean"
global code		  	"$task1/code/current"
global output		"$task1/output/current"

// panel data management
global start    	2002									
global end      	2014


*---------
* Packages
*---------
	ssc install reghdfe

*--------------
* code pipeline
*--------------

	do "$code/1. input_datasets.do"
	do "$code/2. stuff.do"	 
	
	
/*______________________________________________________________________________

Input: 
- Network with 0/1 info on buyer-supplier linkages.
- firm selection based on (i) firm criteria (e.g. size), (ii) sector of buyer.

Transformations:
- import raw datasets.
- estimate latent embeddingsvectors.
- calculate simil_ik and comp_ik, pairwise measures for supplier pairs.

Output: 
- embeddingsvectors (K dimensions per supplier i).
- similarity and complementarity matrix for all supplier pairs (i,k)
______________________________________________________________________________*/	

/*
// delete and create new folders
foreach x in tmp clean output {
	cap !rm -rf ${`x'}
	cap mkdir ${`x'}
}
*/	

clear
