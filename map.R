#### linear mixed effects modeling on HCP_huge
#### ethan whitman, 6/3/21

#### running LME on each column of HCP_huge to generate cifti files of beta terms for sex, contrast, and sex*contrast

#### this is done using the lme() function from the package nlme (https://cran.r-project.org/web/packages/nlme/nlme.pdf)
#### definitely a good idea to read up on LME modeling to understand how this function works/what is happening
#### here conceptually. 


## you'll definitely want an spersist node with lots of memory since this takes a really long time to run

spersist --cpus-per-task=32 --mem=800g --gres=lscratch:500
module load connectome-workbench
module load R
R

library(nlme)
library(purrr)

load("df_list.R")

# Loop through HCP_huge to extract F stats for each voxel

all_con <- map(df_list, function(d){
  anova(lme(v~ SEX*CONTRAST, random = ~1 | ID, data = d, 
            control = lmeControl(maxIter = 75, msMaxIter = 75, niterEM = 50,
                                 returnObject = TRUE, msVerbose = TRUE)))
})

save(all_con, file = "all_con.R")
