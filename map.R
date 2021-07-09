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


# break df_list into 12ths to run in parallel on biowulf


df_list_1 <- df_list[1:4951]
df_list_2 <- df_list[4952:9902]
df_list_3 <- df_list[9903:14853]
df_list_4 <- df_list[14854:19804]
df_list_5 <- df_list[19805:24755]
df_list_6 <- df_list[24756:29706]
df_list_7 <- df_list[29707:34657]
df_list_8 <- df_list[34658:39608]
df_list_9 <- df_list[39609:44559]
df_list_10 <- df_list[44560:49510]
df_list_11 <- df_list[49511:54461]
df_list_12 <- df_list[54462:59412]

save(df_list_1, file = "df_list_1.R")
save(df_list_2, file = "df_list_2.R")
save(df_list_3, file = "df_list_3.R")
save(df_list_4, file = "df_list_4.R")
save(df_list_5, file = "df_list_5.R")
save(df_list_6, file = "df_list_6.R")
save(df_list_7, file = "df_list_7.R")
save(df_list_8, file = "df_list_8.R")
save(df_list_9, file = "df_list_9.R")
save(df_list_10, file = "df_list_10.R")
save(df_list_11, file = "df_list_11.R")
save(df_list_12, file = "df_list_12.R")


# youre gonna want to submit this as a swarm job with the twelfths because doing it regularly would take weeks to finish running

library(nlme)
library(purrr)

load("df_list_.R")

all_con <- map(df_list, function(d){
  anova(lme(v~ SEX*CONTRAST, random = ~1 | ID, data = d, 
            control = lmeControl(maxIter = 75, msMaxIter = 75, niterEM = 50,
                                 returnObject = TRUE, msVerbose = TRUE)))
})

save(all_con, file = "all_con.R")

# putting betas into vectors to then make into cifti files


sex_p_val <- matrix(0, ncol=1, nrow=59412)
sex_f_val <- matrix(0, ncol=1, nrow=59412)
contrast_p_val <- matrix(0, ncol=1, nrow=59412)
contrast_f_val <- matrix(0, ncol=1, nrow=59412)
sexcontrast_p_val <- matrix(0, ncol=1, nrow=59412)
sexcontrast_f_val <- matrix(0, ncol=1, nrow=59412)
for (i in 1:(length(all_con))){
sex_p_val[i] <- all_con[[i]][2,4]
sex_f_val[i] <- all_con[[i]][2,3]

contrast_p_val[i] <- all_con[[i]][3,4]
contrast_f_val[i] <- all_con[[i]][3,3]

sexcontrast_p_val[i] <- all_con[[i]][4,4]
sexcontrast_f_val[i] <- all_con[[i]][4,3]
}


# put data into cifti file

template <- read_cifti("100206/MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")

template$data$cortex_left[,1] <- sex_f_val[1:29696]
template$data$cortex_right[,1] <- sex_f_val[29697:59412]
template$data$cortex_left[,2] <- sex_p_val[1:29696]
template$data$cortex_right[,2] <- sex_p_val[29697:59412]
template$data$cortex_left[,3] <- contrast_f_val[1:29696]
template$data$cortex_right[,3] <- contrast_f_val[29697:59412]
template$data$cortex_left[,4] <- contrast_p_val[1:29696]
template$data$cortex_right[,4] <- contrast_p_val[29697:59412]
template$data$cortex_left[,5] <- sexcontrast_f_val[1:29696]
template$data$cortex_right[,5] <- sexcontrast_f_val[29697:59412]
template$data$cortex_left[,6] <- sexcontrast_p_val[1:29696]
template$data$cortex_right[,6] <- sexcontrast_p_val[29697:59412]

write_cifti(template, cifti_fname = "all_con.dscalar.nii")




