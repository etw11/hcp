# hcp
contains code for downloading HCP data, loading cifti files into R, organizing contrasts into one big matrix called HCP_huge,
and performing linear mixed effects modeling at each vertex. I've also included the swarm file to run the LME due to the high
computational demands of that process.

also - just so you have it - i put in the initial script i started using to try and run a cluster analysis using FSL's PALM.
i didnt finish this, and youll need to revise it to use it on sex x contrast beta/p values but its a start. 
more info on running PALM with cifti files can be found here: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/PALM/Examples#Example_10:_Using_CIFTI_files
