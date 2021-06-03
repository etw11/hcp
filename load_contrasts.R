####### load in individual level contrasts from the HCP database
####### ethan whitman, 6/3/21

####### this code is to load in all the invidiual level HCP contrasts into R as vectors and save them as .R objects
####### it relies on the R library ciftiTools (https://github.com/mandymejia/ciftiTools) which has OK documentation 
####### but is pretty slow. also - you can definitely find a way to more efficiently do this coding-wise but i was
####### being lazy when i wrote this. feel free to update and revise as needed.

####### each task has a handful of different contrasts (with motor and wm having 25+) i loaded them all here although
####### you'll probably not need all of them (some are just negative versions of others). good idea to look through the 
####### HCP manual to learn about what each task and contrast is exactly.




## this is some slurm stuff to set up the environment. also consider using spersist since theres no walltime
## if it's confusing, biowulf has alot of good documentation and siyuan and liza are very experienced with hpcs

# setwd("/Users/whitmanet/Documents/hcp_dl_clone/")

# sinteractive --cpus-per-task=32 --mem=500g --gres=lscratch:500 --time=36:00:00
# module load connectome-workbench
# module load R
# R

library(cifti)
library(ciftiTools)

ciftiTools.setOption("wb_path", "/usr/local/apps/connectome-workbench/1.4.2/wb_command")

# load in cifti



############################################################                       ############################################################
############################################################   EMOTION             ############################################################
############################################################                       ############################################################

print("EMOTION")

gid_emotion <- read.delim("gid_emotion", header = FALSE)
gid_male_emotion <- read.delim("gid_male_emotion", header = FALSE)
gid_female_emotion <- read.delim("gid_female_emotion", header = FALSE)


############################################################                       ############################################################
############################################################   FIRST CONTRAST      ############################################################
############################################################                       ############################################################



####### FACES



 m_male_left <- matrix(0, ncol = 29696, nrow = 377)
 m_male_right <- matrix(0, ncol = 29716, nrow = 377)
 m_female_left <- matrix(0, ncol = 29696, nrow = 472)
 m_female_right <- matrix(0, ncol = 29716, nrow = 472)
 
 c <- 1
 for (x in t(gid_male_emotion)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,1]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_emotion)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,1]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 1ST CONTRAST")
 
 save(m_male_left, file = "emotion1_m_male_left.R")
 save(m_male_right, file = "emotion1_m_male_right.R")
 save(m_female_left, file = "emotion1_m_female_left.R")
 save(m_female_right, file = "emotion1_m_female_right.R")



 ############################################################                       ############################################################
 ############################################################   SECOND CONTRAST     ############################################################
 ############################################################                       ############################################################
 
 
 ###### shapes
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = 377)
 m_male_right <- matrix(0, ncol = 29716, nrow = 377)
 m_female_left <- matrix(0, ncol = 29696, nrow = 472)
 m_female_right <- matrix(0, ncol = 29716, nrow = 472)
 
 c <- 1
 for (x in t(gid_male_emotion)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,2]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_emotion)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,2]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 2ND CONTRAST")
 
 
 save(m_male_left, file = "emotion2_m_male_left.R")
 save(m_male_right, file = "emotion2_m_male_right.R")
 save(m_female_left, file = "emotion2_m_female_left.R")
 save(m_female_right, file = "emotion2_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   THIRD CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### faces - shapes
 
 m_male_left <- matrix(0, ncol = 29696, nrow = 377)
 m_male_right <- matrix(0, ncol = 29716, nrow = 377)
 m_female_left <- matrix(0, ncol = 29696, nrow = 472)
 m_female_right <- matrix(0, ncol = 29716, nrow = 472)
 
 c <- 1
 for (x in t(gid_male_emotion)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,3]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_emotion)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,3]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 3RD CONTRAST")
 
 save(m_male_left, file = "emotion3_m_male_left.R")
 save(m_male_right, file = "emotion3_m_male_right.R")
 save(m_female_left, file = "emotion3_m_female_left.R")
 save(m_female_right, file = "emotion3_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   SIXTH CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### SHAPES - FACES
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = 377)
 m_male_right <- matrix(0, ncol = 29716, nrow = 377)
 m_female_left <- matrix(0, ncol = 29696, nrow = 472)
 m_female_right <- matrix(0, ncol = 29716, nrow = 472)
 
 c <- 1
 for (x in t(gid_male_emotion)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,6]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,6]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_emotion)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_left[,6]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_EMOTION/tfMRI_EMOTION_hp200_s4_level2.feat/emotion_contrast.dscalar.nii")$data$cortex_right[,6]
   c <- c+1
   setwd("..")
 }
 print("LOADED 6TH CONTRAST")
 
 
 save(m_male_left, file = "emotion6_m_male_left.R")
 save(m_male_right, file = "emotion6_m_male_right.R")
 save(m_female_left, file = "emotion6_m_female_left.R")
 save(m_female_right, file = "emotion6_m_female_right.R")
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ############################################################                       ############################################################
 ############################################################   GAMBLING            ############################################################
 ############################################################                       ############################################################
 
 
 print("GAMBLING")
 
 
 
 
 gid_gambling <- read.delim("gid_gambling", header = FALSE)
 gid_male_gambling <- read.delim("gid_gambling_male", header = FALSE)
 gid_female_gambling <- read.delim("gid_gambling_female", header = FALSE)
 
 
 ############################################################                       ############################################################
 ############################################################   FIRST CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ####### PUNISH
 
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_gambling)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_gambling)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_gambling)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_gambling)))
 
 c <- 1
 for (x in t(gid_male_gambling)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,1]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_gambling)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,1]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 1ST CONTRAST")
 
 save(m_male_left, file = "gambling1_m_male_left.R")
 save(m_male_right, file = "gambling1_m_male_right.R")
 save(m_female_left, file = "gambling1_m_female_left.R")
 save(m_female_right, file = "gambling1_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   SECOND CONTRAST     ############################################################
 ############################################################                       ############################################################
 
 
 ###### reward
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_gambling)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_gambling)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_gambling)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_gambling)))
 
 c <- 1
 for (x in t(gid_male_gambling)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,2]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_gambling)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,2]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 2ND CONTRAST")
 
 
 save(m_male_left, file = "gambling2_m_male_left.R")
 save(m_male_right, file = "gambling2_m_male_right.R")
 save(m_female_left, file = "gambling2_m_female_left.R")
 save(m_female_right, file = "gambling2_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   THIRD CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### punish - reward
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_gambling)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_gambling)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_gambling)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_gambling)))
 
 c <- 1
 for (x in t(gid_male_gambling)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,3]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_gambling)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,3]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 3RD CONTRAST")
 
 save(m_male_left, file = "gambling3_m_male_left.R")
 save(m_male_right, file = "gambling3_m_male_right.R")
 save(m_female_left, file = "gambling3_m_female_left.R")
 save(m_female_right, file = "gambling3_m_female_right.R")
 
 
 
 
 ############################################################                       ############################################################
 ############################################################   SIXTH CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### REWARD - PUNISH
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_gambling)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_gambling)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_gambling)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_gambling)))
 
 c <- 1
 for (x in t(gid_male_gambling)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,6]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,6]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_gambling)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_left[,6]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/gambling_contrast.dscalar.nii")$data$cortex_right[,6]
   c <- c+1
   setwd("..")
 }
 print("LOADED 6TH CONTRAST")
 
 
 save(m_male_left, file = "gambling6_m_male_left.R")
 save(m_male_right, file = "gambling6_m_male_right.R")
 save(m_female_left, file = "gambling6_m_female_left.R")
 save(m_female_right, file = "gambling6_m_female_right.R")
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ############################################################                       ############################################################
 ############################################################   RELATIONAL          ############################################################
 ############################################################                       ############################################################
 
 
 print("RELATIONAL")
 
 
 
 gid_relational <- read.delim("gid_relational", header = FALSE)
 gid_male_relational <- read.delim("gid_relational_male", header = FALSE)
 gid_female_relational <- read.delim("gid_relational_female", header = FALSE)
 
 
 ############################################################                       ############################################################
 ############################################################   FIRST CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ####### MATCH
 
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_relational)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_relational)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_relational)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_relational)))
 
 c <- 1
 for (x in t(gid_male_relational)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,1]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_relational)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,1]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 1ST CONTRAST")
 
 save(m_male_left, file = "relational1_m_male_left.R")
 save(m_male_right, file = "relational1_m_male_right.R")
 save(m_female_left, file = "relational1_m_female_left.R")
 save(m_female_right, file = "relational1_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   SECOND CONTRAST     ############################################################
 ############################################################                       ############################################################
 
 
 ###### REL
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_relational)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_relational)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_relational)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_relational)))
 
 c <- 1
 for (x in t(gid_male_relational)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,2]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_relational)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,2]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 2ND CONTRAST")
 
 
 save(m_male_left, file = "relational2_m_male_left.R")
 save(m_male_right, file = "relational2_m_male_right.R")
 save(m_female_left, file = "relational2_m_female_left.R")
 save(m_female_right, file = "relational2_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   THIRD CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### match - rel
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_relational)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_relational)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_relational)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_relational)))
 
 c <- 1
 for (x in t(gid_male_relational)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,3]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_relational)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,3]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 3RD CONTRAST")
 
 save(m_male_left, file = "relational3_m_male_left.R")
 save(m_male_right, file = "relational3_m_male_right.R")
 save(m_female_left, file = "relational3_m_female_left.R")
 save(m_female_right, file = "relational3_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   FOURTH CONTRAST     ############################################################
 ############################################################                       ############################################################
 
 
 #### rel - match
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_relational)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_relational)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_relational)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_relational)))
 
 c <- 1
 for (x in t(gid_male_relational)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,4]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,4]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_relational)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_left[,4]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/relational_contrast.dscalar.nii")$data$cortex_right[,4]
   c <- c+1
   setwd("..")
 }
 print("LOADED 4TH CONTRAST")
 
 save(m_male_left, file = "relational4_m_male_left.R")
 save(m_male_right, file = "relational4_m_male_right.R")
 save(m_female_left, file = "relational4_m_female_left.R")
 save(m_female_right, file = "relational4_m_female_right.R")
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ############################################################                       ############################################################
 ############################################################   SOCIAL              ############################################################
 ############################################################                       ############################################################
 
 
 print("SOCIAL")
 
 
 
 gid_social <- read.delim("gid_social", header = FALSE)
 gid_male_social <- read.delim("gid_social_male", header = FALSE)
 gid_female_social <- read.delim("gid_social_female", header = FALSE)
 
 
 ############################################################                       ############################################################
 ############################################################   FIRST CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ####### RANDOM
 
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_social)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_social)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_social)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_social)))
 
 c <- 1
 for (x in t(gid_male_social)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,1]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_social)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,1]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 1ST CONTRAST")
 
 save(m_male_left, file = "social1_m_male_left.R")
 save(m_male_right, file = "social1_m_male_right.R")
 save(m_female_left, file = "social1_m_female_left.R")
 save(m_female_right, file = "social1_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   SECOND CONTRAST     ############################################################
 ############################################################                       ############################################################
 
 
 ###### TOM
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_social)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_social)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_social)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_social)))
 
 c <- 1
 for (x in t(gid_male_social)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,2]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_social)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,2]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 2ND CONTRAST")
 
 
 save(m_male_left, file = "social2_m_male_left.R")
 save(m_male_right, file = "social2_m_male_right.R")
 save(m_female_left, file = "social2_m_female_left.R")
 save(m_female_right, file = "social2_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   THIRD CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### random - tom
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_social)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_social)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_social)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_social)))
 
 c <- 1
 for (x in t(gid_male_social)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,3]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_social)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,3]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 3RD CONTRAST")
 
 save(m_male_left, file = "social3_m_male_left.R")
 save(m_male_right, file = "social3_m_male_right.R")
 save(m_female_left, file = "social3_m_female_left.R")
 save(m_female_right, file = "social3_m_female_right.R")
 
 ############################################################                       ############################################################
 ############################################################   SIXTH CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### TOM-RANDOM
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_social)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_social)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_social)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_social)))
 
 c <- 1
 for (x in t(gid_male_social)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,6]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,6]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_social)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_left[,6]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/social_contrast.dscalar.nii")$data$cortex_right[,6]
   c <- c+1
   setwd("..")
 }
 print("LOADED 6TH CONTRAST")
 
 
 save(m_male_left, file = "social6_m_male_left.R")
 save(m_male_right, file = "social6_m_male_right.R")
 save(m_female_left, file = "social6_m_female_left.R")
 save(m_female_right, file = "social6_m_female_right.R")
 
 
 
 
 
 
 
 
 
 
 
 
 ############################################################                       ############################################################
 ############################################################   LANGUAGE            ############################################################
 ############################################################                       ############################################################
 
 
 
 print("LANGUAGE")
 
 
 
 gid_language <- read.delim("gid_language", header = FALSE)
 gid_male_language <- read.delim("gid_language_male", header = FALSE)
 gid_female_language <- read.delim("gid_language_female", header = FALSE)
 
 
 ############################################################                       ############################################################
 ############################################################   FIRST CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ####### MATH
 
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_language)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_language)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_language)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_language)))
 
 c <- 1
 for (x in t(gid_male_language)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,1]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_language)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,1]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,1]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 1ST CONTRAST")
 
 save(m_male_left, file = "language1_m_male_left.R")
 save(m_male_right, file = "language1_m_male_right.R")
 save(m_female_left, file = "language1_m_female_left.R")
 save(m_female_right, file = "language1_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   SECOND CONTRAST     ############################################################
 ############################################################                       ############################################################
 
 
 ###### STORY
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_language)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_language)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_language)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_language)))
 
 c <- 1
 for (x in t(gid_male_language)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,2]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_language)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,2]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,2]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 2ND CONTRAST")
 
 
 save(m_male_left, file = "language2_m_male_left.R")
 save(m_male_right, file = "language2_m_male_right.R")
 save(m_female_left, file = "language2_m_female_left.R")
 save(m_female_right, file = "language2_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   THIRD CONTRAST      ############################################################
 ############################################################                       ############################################################
 
 
 
 ##### MATH - STORY
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_language)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_language)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_language)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_language)))
 
 c <- 1
 for (x in t(gid_male_language)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,3]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_language)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,3]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,3]
   c <- c+1
   setwd("..")
 }
 
 print("LOADED IN 3RD CONTRAST")
 
 save(m_male_left, file = "language3_m_male_left.R")
 save(m_male_right, file = "language3_m_male_right.R")
 save(m_female_left, file = "language3_m_female_left.R")
 save(m_female_right, file = "language3_m_female_right.R")
 
 
 ############################################################                       ############################################################
 ############################################################   FOURTH CONTRAST     ############################################################
 ############################################################                       ############################################################
 
 
 #### STORY - MATH
 
 
 m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_language)))
 m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_language)))
 m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_language)))
 m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_language)))
 
 c <- 1
 for (x in t(gid_male_language)){
   setwd(as.character(get("x")))
   m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,4]
   m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,4]
   c <- c+1
   setwd("..")
 }
 
 c <- 1
 for (x in t(gid_female_language)){
   setwd(as.character(get("x")))
   m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_left[,4]
   m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/language_contrast.dscalar.nii")$data$cortex_right[,4]
   c <- c+1
   setwd("..")
 }
 print("LOADED 4TH CONTRAST")
 
 save(m_male_left, file = "language4_m_male_left.R")
 save(m_male_right, file = "language4_m_male_right.R")
 save(m_female_left, file = "language4_m_female_left.R")
 save(m_female_right, file = "language4_m_female_right.R")
 
 
 
 
 
 
 
 
 
 
 
 
############################################################                       ############################################################
############################################################   WM                 ############################################################
############################################################                       ############################################################


print("WM")

gid_wm <- read.delim("gid_wm_missing", header = FALSE)
gid_male_wm <- read.delim("gid_wm_male_missing", header = FALSE)
gid_female_wm <- read.delim("gid_wm_female_missing", header = FALSE)


############################################################                       ############################################################
############################################################   FIRST CONTRAST      ############################################################
############################################################                       ############################################################



####### 2K BODY



m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,1]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,1]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,1]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,1]
  c <- c+1
  setwd("..")
}

print("LOADED IN 1ST CONTRAST")

save(m_male_left, file = "wm1_m_male_left.R")
save(m_male_right, file = "wm1_m_male_right.R")
save(m_female_left, file = "wm1_m_female_left.R")
save(m_female_right, file = "wm1_m_female_right.R")


############################################################                       ############################################################
############################################################   SECOND CONTRAST     ############################################################
############################################################                       ############################################################


###### L2BK_FACE


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,2]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,2]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,2]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,2]
  c <- c+1
  setwd("..")
}

print("LOADED IN 2ND CONTRAST")


save(m_male_left, file = "wm2_m_male_left.R")
save(m_male_right, file = "wm2_m_male_right.R")
save(m_female_left, file = "wm2_m_female_left.R")
save(m_female_right, file = "wm2_m_female_right.R")

############################################################                       ############################################################
############################################################   THIRD CONTRAST      ############################################################
############################################################                       ############################################################



##### L2BK PLACE

m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,3]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,3]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,3]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,3]
  c <- c+1
  setwd("..")
}

print("LOADED IN 3RD CONTRAST")

save(m_male_left, file = "wm3_m_male_left.R")
save(m_male_right, file = "wm3_m_male_right.R")
save(m_female_left, file = "wm3_m_female_left.R")
save(m_female_right, file = "wm3_m_female_right.R")


############################################################                       ############################################################
############################################################   FOURTH CONTRAST     ############################################################
############################################################                       ############################################################


#### R2BK_TOOL


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,4]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,4]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,4]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,4]
  c <- c+1
  setwd("..")
}
print("LOADED 4TH CONTRAST")

save(m_male_left, file = "wm4_m_male_left.R")
save(m_male_right, file = "wm4_m_male_right.R")
save(m_female_left, file = "wm4_m_female_left.R")
save(m_female_right, file = "wm4_m_female_right.R")


############################################################                       ############################################################
############################################################   FIFTH CONTRAST      ############################################################
############################################################                       ############################################################



#### R0BK_BODY


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,5]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,5]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,5]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,5]
  c <- c+1
  setwd("..")
}
print("LOADED 5TH CONTRAST")

save(m_male_left, file = "wm5_m_male_left.R")
save(m_male_right, file = "wm5_m_male_right.R")
save(m_female_left, file = "wm5_m_female_left.R")
save(m_female_right, file = "wm5_m_female_right.R")


############################################################                       ############################################################
############################################################   SIXTH CONTRAST      ############################################################
############################################################                       ############################################################



##### T0BK_FACE


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,6]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,6]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,6]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,6]
  c <- c+1
  setwd("..")
}
print("LOADED 6TH CONTRAST")


save(m_male_left, file = "wm6_m_male_left.R")
save(m_male_right, file = "wm6_m_male_right.R")
save(m_female_left, file = "wm6_m_female_left.R")
save(m_female_right, file = "wm6_m_female_right.R")


############################################################                       ############################################################
############################################################   SEVENTH CONTRAST      ############################################################
############################################################                       ############################################################



##### A0BK_PLACE


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,7]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,7]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,7]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,7]
  c <- c+1
  setwd("..")
}
print("LOADED 7TH CONTRAST")


save(m_male_left, file = "wm7_m_male_left.R")
save(m_male_right, file = "wm7_m_male_right.R")
save(m_female_left, file = "wm7_m_female_left.R")
save(m_female_right, file = "wm7_m_female_right.R")


############################################################                       ############################################################
############################################################   EIGHTH CONTRAST     ############################################################
############################################################                       ############################################################



##### C0BK_TOOL


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,8]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,8]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,8]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,8]
  c <- c+1
  setwd("..")
}
print("LOADED 8TH CONTRAST")


save(m_male_left, file = "wm8_m_male_left.R")
save(m_male_right, file = "wm8_m_male_right.R")
save(m_female_left, file = "wm8_m_female_left.R")
save(m_female_right, file = "wm8_m_female_right.R")




############################################################                       ############################################################
############################################################   NINTH CONTRAST      ############################################################
############################################################                       ############################################################



##### L2BK


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,9]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,9]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,9]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,9]
  c <- c+1
  setwd("..")
}
print("LOADED 9TH CONTRAST")


save(m_male_left, file = "wm9_m_male_left.R")
save(m_male_right, file = "wm9_m_male_right.R")
save(m_female_left, file = "wm9_m_female_left.R")
save(m_female_right, file = "wm9_m_female_right.R")





############################################################                       ############################################################
############################################################   TENTH CONTRAST      ############################################################
############################################################                       ############################################################



##### L0BK


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,10]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,10]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,10]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,10]
  c <- c+1
  setwd("..")
}
print("LOADED 10TH CONTRAST")


save(m_male_left, file = "wm10_m_male_left.R")
save(m_male_right, file = "wm10_m_male_right.R")
save(m_female_left, file = "wm10_m_female_left.R")
save(m_female_right, file = "wm10_m_female_right.R")




############################################################                       ############################################################
############################################################   ELEVENTH CONTRAST   ############################################################
############################################################                       ############################################################



##### 2bk - 0bk


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,11]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,11]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,11]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,11]
  c <- c+1
  setwd("..")
}
print("LOADED 11TH CONTRAST")


save(m_male_left, file = "wm11_m_male_left.R")
save(m_male_right, file = "wm11_m_male_right.R")
save(m_female_left, file = "wm11_m_female_left.R")
save(m_female_right, file = "wm11_m_female_right.R")


############################################################                       ############################################################
############################################################   FOURTEENTH CONTRAST ############################################################
############################################################                       ############################################################



##### 0BK-2BK


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,14]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,14]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,14]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,14]
  c <- c+1
  setwd("..")
}
print("LOADED 14TH CONTRAST")


save(m_male_left, file = "wm14_m_male_left.R")
save(m_male_right, file = "wm14_m_male_right.R")
save(m_female_left, file = "wm14_m_female_left.R")
save(m_female_right, file = "wm14_m_female_right.R")



############################################################                       ############################################################
############################################################   FIFTEENTH CONTRAST ############################################################
############################################################                       ############################################################



##### BODY


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,15]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,15]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,15]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,15]
  c <- c+1
  setwd("..")
}
print("LOADED 15TH CONTRAST")


save(m_male_left, file = "wm15_m_male_left.R")
save(m_male_right, file = "wm15_m_male_right.R")
save(m_female_left, file = "wm15_m_female_left.R")
save(m_female_right, file = "wm15_m_female_right.R")







############################################################                       ############################################################
############################################################   SIXTEENTH CONTRAST  ############################################################
############################################################                       ############################################################



##### FACE


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,16]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,16]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,16]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,16]
  c <- c+1
  setwd("..")
}
print("LOADED 16TH CONTRAST")


save(m_male_left, file = "wm16_m_male_left.R")
save(m_male_right, file = "wm16_m_male_right.R")
save(m_female_left, file = "wm16_m_female_left.R")
save(m_female_right, file = "wm16_m_female_right.R")







############################################################                        ############################################################
############################################################   SEVENTEENTH CONTRAST ############################################################
############################################################                        ############################################################



##### place


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,17]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,17]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,17]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,17]
  c <- c+1
  setwd("..")
}
print("LOADED 17TH CONTRAST")


save(m_male_left, file = "wm17_m_male_left.R")
save(m_male_right, file = "wm17_m_male_right.R")
save(m_female_left, file = "wm17_m_female_left.R")
save(m_female_right, file = "wm17_m_female_right.R")





############################################################                        ############################################################
############################################################   EIGHTEENTH CONTRAST  ############################################################
############################################################                        ############################################################



##### tool


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,18]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,18]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,18]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,18]
  c <- c+1
  setwd("..")
}
print("LOADED 18TH CONTRAST")


save(m_male_left, file = "wm18_m_male_left.R")
save(m_male_right, file = "wm18_m_male_right.R")
save(m_female_left, file = "wm18_m_female_left.R")
save(m_female_right, file = "wm18_m_female_right.R")






############################################################                       ############################################################
############################################################   NINTEENTH CONTRAST  ############################################################
############################################################                       ############################################################



##### BODY-AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,19]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,19]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,19]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,19]
  c <- c+1
  setwd("..")
}
print("LOADED 6TH CONTRAST")


save(m_male_left, file = "wm19_m_male_left.R")
save(m_male_right, file = "wm19_m_male_right.R")
save(m_female_left, file = "wm19_m_female_left.R")
save(m_female_right, file = "wm19_m_female_right.R")



############################################################                       ############################################################
############################################################   20TH CONTRAST       ############################################################
############################################################                       ############################################################



##### face-avg


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,20]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,20]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,20]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,20]
  c <- c+1
  setwd("..")
}
print("LOADED 20TH CONTRAST")


save(m_male_left, file = "wm20_m_male_left.R")
save(m_male_right, file = "wm20_m_male_right.R")
save(m_female_left, file = "wm20_m_female_left.R")
save(m_female_right, file = "wm20_m_female_right.R")


############################################################                       ############################################################
############################################################   21ST CONTRAST       ############################################################
############################################################                       ############################################################



##### PLACE-AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,21]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,21]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,21]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,21]
  c <- c+1
  setwd("..")
}
print("LOADED 21ST CONTRAST")


save(m_male_left, file = "wm21_m_male_left.R")
save(m_male_right, file = "wm21_m_male_right.R")
save(m_female_left, file = "wm21_m_female_left.R")
save(m_female_right, file = "wm21_m_female_right.R")



############################################################                       ############################################################
############################################################   22ND CONTRAST       ############################################################
############################################################                       ############################################################



##### tool - avg


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,22]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,22]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,22]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,22]
  c <- c+1
  setwd("..")
}
print("LOADED 22nd CONTRAST")


save(m_male_left, file = "wm22_m_male_left.R")
save(m_male_right, file = "wm22_m_male_right.R")
save(m_female_left, file = "wm22_m_female_left.R")
save(m_female_right, file = "wm22_m_female_right.R")




############################################################                       ############################################################
############################################################   27TH CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG FACE


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,27]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,27]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,27]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,27]
  c <- c+1
  setwd("..")
}
print("LOADED 27TH CONTRAST")


save(m_male_left, file = "wm27_m_male_left.R")
save(m_male_right, file = "wm27_m_male_right.R")
save(m_female_left, file = "wm27_m_female_left.R")
save(m_female_right, file = "wm27_m_female_right.R")



############################################################                       ############################################################
############################################################   28TH CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG PLACE


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,28]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,28]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,28]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,28]
  c <- c+1
  setwd("..")
}
print("LOADED 28TH CONTRAST")


save(m_male_left, file = "wm28_m_male_left.R")
save(m_male_right, file = "wm28_m_male_right.R")
save(m_female_left, file = "wm28_m_female_left.R")
save(m_female_right, file = "wm28_m_female_right.R")


############################################################                       ############################################################
############################################################   29TH CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG TOOL


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_wm)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_wm)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_wm)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_wm)))

c <- 1
for (x in t(gid_male_wm)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,29]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,29]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_wm)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_left[,29]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/wm_contrast.dscalar.nii")$data$cortex_right[,29]
  c <- c+1
  setwd("..")
}
print("LOADED 29TH CONTRAST")


save(m_male_left, file = "wm29_m_male_left.R")
save(m_male_right, file = "wm29_m_male_right.R")
save(m_female_left, file = "wm29_m_female_left.R")
save(m_female_right, file = "wm29_m_female_right.R")

















############################################################                       ############################################################
############################################################   MOTOR               ############################################################
############################################################                       ############################################################


print("MOTOR")



gid_motor <- read.delim("gid_motor", header = FALSE)
gid_male_motor <- read.delim("gid_motor_male", header = FALSE)
gid_female_motor <- read.delim("gid_motor_female", header = FALSE)


############################################################                       ############################################################
############################################################   FIRST CONTRAST      ############################################################
############################################################                       ############################################################



####### CUE



m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,1]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,1]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,1]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,1]
  c <- c+1
  setwd("..")
}

print("LOADED IN 1ST CONTRAST")

save(m_male_left, file = "motor1_m_male_left.R")
save(m_male_right, file = "motor1_m_male_right.R")
save(m_female_left, file = "motor1_m_female_left.R")
save(m_female_right, file = "motor1_m_female_right.R")


############################################################                       ############################################################
############################################################   SECOND CONTRAST     ############################################################
############################################################                       ############################################################


###### LF


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,2]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,2]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,2]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,2]
  c <- c+1
  setwd("..")
}

print("LOADED IN 2ND CONTRAST")


save(m_male_left, file = "motor2_m_male_left.R")
save(m_male_right, file = "motor2_m_male_right.R")
save(m_female_left, file = "motor2_m_female_left.R")
save(m_female_right, file = "motor2_m_female_right.R")


############################################################                       ############################################################
############################################################   THIRD CONTRAST      ############################################################
############################################################                       ############################################################



##### LH

m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,3]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,3]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,3]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,3]
  c <- c+1
  setwd("..")
}

print("LOADED IN 3RD CONTRAST")

save(m_male_left, file = "motor3_m_male_left.R")
save(m_male_right, file = "motor3_m_male_right.R")
save(m_female_left, file = "motor3_m_female_left.R")
save(m_female_right, file = "motor3_m_female_right.R")


############################################################                       ############################################################
############################################################   FOURTH CONTRAST     ############################################################
############################################################                       ############################################################


#### RF


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,4]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,4]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,4]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,4]
  c <- c+1
  setwd("..")
}
print("LOADED 4TH CONTRAST")

save(m_male_left, file = "motor4_m_male_left.R")
save(m_male_right, file = "motor4_m_male_right.R")
save(m_female_left, file = "motor4_m_female_left.R")
save(m_female_right, file = "motor4_m_female_right.R")


############################################################                       ############################################################
############################################################   FIFTH CONTRAST      ############################################################
############################################################                       ############################################################



#### RH


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,5]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,5]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,5]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,5]
  c <- c+1
  setwd("..")
}
print("LOADED 5TH CONTRAST")

save(m_male_left, file = "motor5_m_male_left.R")
save(m_male_right, file = "motor5_m_male_right.R")
save(m_female_left, file = "motor5_m_female_left.R")
save(m_female_right, file = "motor5_m_female_right.R")


############################################################                       ############################################################
############################################################   SIXTH CONTRAST      ############################################################
############################################################                       ############################################################



##### T


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,6]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,6]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,6]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,6]
  c <- c+1
  setwd("..")
}
print("LOADED 6TH CONTRAST")


save(m_male_left, file = "motor6_m_male_left.R")
save(m_male_right, file = "motor6_m_male_right.R")
save(m_female_left, file = "motor6_m_female_left.R")
save(m_female_right, file = "motor6_m_female_right.R")


############################################################                       ############################################################
############################################################   SEVENTH CONTRAST      ############################################################
############################################################                       ############################################################



##### AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,7]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,7]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,7]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,7]
  c <- c+1
  setwd("..")
}
print("LOADED 7TH CONTRAST")


save(m_male_left, file = "motor7_m_male_left.R")
save(m_male_right, file = "motor7_m_male_right.R")
save(m_female_left, file = "motor7_m_female_left.R")
save(m_female_right, file = "motor7_m_female_right.R")



############################################################                       ############################################################
############################################################   EIGHTH CONTRAST     ############################################################
############################################################                       ############################################################



##### CUE-AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,8]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,8]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,8]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,8]
  c <- c+1
  setwd("..")
}
print("LOADED 8TH CONTRAST")


save(m_male_left, file = "motor8_m_male_left.R")
save(m_male_right, file = "motor8_m_male_right.R")
save(m_female_left, file = "motor8_m_female_left.R")
save(m_female_right, file = "motor8_m_female_right.R")




############################################################                       ############################################################
############################################################   NINTH CONTRAST      ############################################################
############################################################                       ############################################################



##### LF-AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,9]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,9]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,9]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,9]
  c <- c+1
  setwd("..")
}
print("LOADED 9TH CONTRAST")


save(m_male_left, file = "motor9_m_male_left.R")
save(m_male_right, file = "motor9_m_male_right.R")
save(m_female_left, file = "motor9_m_female_left.R")
save(m_female_right, file = "motor9_m_female_right.R")



############################################################                       ############################################################
############################################################   TENTH CONTRAST      ############################################################
############################################################                       ############################################################



##### LH-AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,10]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,10]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,10]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,10]
  c <- c+1
  setwd("..")
}
print("LOADED 10TH CONTRAST")


save(m_male_left, file = "motor10_m_male_left.R")
save(m_male_right, file = "motor10_m_male_right.R")
save(m_female_left, file = "motor10_m_female_left.R")
save(m_female_right, file = "motor10_m_female_right.R")


############################################################                       ############################################################
############################################################   ELEVENTH CONTRAST   ############################################################
############################################################                       ############################################################



##### RF-AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,11]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,11]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,11]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,11]
  c <- c+1
  setwd("..")
}
print("LOADED 11TH CONTRAST")


save(m_male_left, file = "motor11_m_male_left.R")
save(m_male_right, file = "motor11_m_male_right.R")
save(m_female_left, file = "motor11_m_female_left.R")
save(m_female_right, file = "motor11_m_female_right.R")

############################################################                       ############################################################
############################################################   TWELFTH CONTRAST    ############################################################
############################################################                       ############################################################



##### RH-AVG


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,12]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,12]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,12]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,12]
  c <- c+1
  setwd("..")
}
print("LOADED 12TH CONTRAST")


save(m_male_left, file = "motor12_m_male_left.R")
save(m_male_right, file = "motor12_m_male_right.R")
save(m_female_left, file = "motor12_m_female_left.R")
save(m_female_right, file = "motor12_m_female_right.R")



############################################################                       ############################################################
############################################################   THIRTEENTH CONTRAST ############################################################
############################################################                       ############################################################



##### t-avg


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,13]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,13]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,13]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,13]
  c <- c+1
  setwd("..")
}
print("LOADED 13TH CONTRAST")


save(m_male_left, file = "motor13_m_male_left.R")
save(m_male_right, file = "motor13_m_male_right.R")
save(m_female_left, file = "motor13_m_female_left.R")
save(m_female_right, file = "motor13_m_female_right.R")



############################################################                       ############################################################
############################################################   21ST CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG-CUE


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,21]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,21]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,21]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,21]
  c <- c+1
  setwd("..")
}
print("LOADED 21ST CONTRAST")


save(m_male_left, file = "motor21_m_male_left.R")
save(m_male_right, file = "motor21_m_male_right.R")
save(m_female_left, file = "motor21_m_female_left.R")
save(m_female_right, file = "motor21_m_female_right.R")






############################################################                       ############################################################
############################################################   22ND CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG - LF


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,22]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,22]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,22]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,22]
  c <- c+1
  setwd("..")
}
print("LOADED 22ND CONTRAST")


save(m_male_left, file = "motor22_m_male_left.R")
save(m_male_right, file = "motor22_m_male_right.R")
save(m_female_left, file = "motor22_m_female_left.R")
save(m_female_right, file = "motor22_m_female_right.R")







############################################################                       ############################################################
############################################################   23RD CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG-LH


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,23]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,23]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,23]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,23]
  c <- c+1
  setwd("..")
}
print("LOADED 6TH CONTRAST")


save(m_male_left, file = "motor23_m_male_left.R")
save(m_male_right, file = "motor23_m_male_right.R")
save(m_female_left, file = "motor23_m_female_left.R")
save(m_female_right, file = "motor23_m_female_right.R")



############################################################                       ############################################################
############################################################   24TH CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG-RF


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,24]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,24]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,24]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,24]
  c <- c+1
  setwd("..")
}
print("LOADED 24TH CONTRAST")


save(m_male_left, file = "motor24_m_male_left.R")
save(m_male_right, file = "motor24_m_male_right.R")
save(m_female_left, file = "motor24_m_female_left.R")
save(m_female_right, file = "motor24_m_female_right.R")



############################################################                       ############################################################
############################################################   25TH CONTRAST       ############################################################
############################################################                       ############################################################



##### avg - rh


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,25]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,25]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,25]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,25]
  c <- c+1
  setwd("..")
}
print("LOADED 25TH CONTRAST")


save(m_male_left, file = "motor25_m_male_left.R")
save(m_male_right, file = "motor25_m_male_right.R")
save(m_female_left, file = "motor25_m_female_left.R")
save(m_female_right, file = "motor25_m_female_right.R")


############################################################                       ############################################################
############################################################   26TH CONTRAST       ############################################################
############################################################                       ############################################################



##### AVG - T


m_male_left <- matrix(0, ncol = 29696, nrow = length(t(gid_male_motor)))
m_male_right <- matrix(0, ncol = 29716, nrow = length(t(gid_male_motor)))
m_female_left <- matrix(0, ncol = 29696, nrow = length(t(gid_female_motor)))
m_female_right <- matrix(0, ncol = 29716, nrow = length(t(gid_female_motor)))

c <- 1
for (x in t(gid_male_motor)){
  setwd(as.character(get("x")))
  m_male_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,26]
  m_male_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,26]
  c <- c+1
  setwd("..")
}

c <- 1
for (x in t(gid_female_motor)){
  setwd(as.character(get("x")))
  m_female_left[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_left[,26]
  m_female_right[c,] <- read_cifti("MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/motor_contrast.dscalar.nii")$data$cortex_right[,26]
  c <- c+1
  setwd("..")
}
print("LOADED 26TH CONTRAST")


save(m_male_left, file = "motor26_m_male_left.R")
save(m_male_right, file = "motor26_m_male_right.R")
save(m_female_left, file = "motor26_m_female_left.R")
save(m_female_right, file = "motor26_m_female_right.R")

