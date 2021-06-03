#### assembling HCP_huge
#### ethan whitman, 6/3/21

#### this is the R code I used to put together the HCP_huge and df_list objects needed for downstream analyses
#### HCP huge is an approx 50k x 50k matrix with rows being individual level contrasts (with each individual represented
#### multiple times) and the columns being the ~32k vertices on the right and left cortices, respectively. 

#### df_list is this same data, but each individual vertex is data.frame-ed into a list with demographic info to perform linear
#### mixed effects modeling at every vertex (easier this way using the map() function).


sinteractive --cpus-per-task=32 --mem=800g --gres=lscratch:500 --time=36:00:00
module load connectome-workbench
module load R
R

library(dplyr)

load("emotion1_m_female_left.R")
load("emotion1_m_female_right.R")
load("emotion1_m_male_left.R")
load("emotion1_m_male_right.R")
emotion1_m_female_left <- m_female_left
emotion1_m_female_right <- m_female_right
emotion1_m_male_left <- m_male_left
emotion1_m_male_right <- m_male_right
load("emotion2_m_female_left.R")
load("emotion2_m_female_right.R")
load("emotion2_m_male_left.R")
load("emotion2_m_male_right.R")
emotion2_m_female_left <- m_female_left
emotion2_m_female_right <- m_female_right
emotion2_m_male_left <- m_male_left
emotion2_m_male_right <- m_male_right
load("emotion3_m_female_left.R")
load("emotion3_m_female_right.R")
load("emotion3_m_male_left.R")
load("emotion3_m_male_right.R")
emotion3_m_female_left <- m_female_left
emotion3_m_female_right <- m_female_right
emotion3_m_male_left <- m_male_left
emotion3_m_male_right <- m_male_right
load("emotion6_m_female_left.R")
load("emotion6_m_female_right.R")
load("emotion6_m_male_left.R")
load("emotion6_m_male_right.R")
emotion6_m_female_left <- m_female_left
emotion6_m_female_right <- m_female_right
emotion6_m_male_left <- m_male_left
emotion6_m_male_right <- m_male_right

load("gambling1_m_female_left.R")
load("gambling1_m_female_right.R")
load("gambling1_m_male_left.R")
load("gambling1_m_male_right.R")
gambling1_m_female_left <- m_female_left
gambling1_m_female_right <- m_female_right
gambling1_m_male_left <- m_male_left
gambling1_m_male_right <- m_male_right
load("gambling2_m_female_left.R")
load("gambling2_m_female_right.R")
load("gambling2_m_male_left.R")
load("gambling2_m_male_right.R")
gambling2_m_female_left <- m_female_left
gambling2_m_female_right <- m_female_right
gambling2_m_male_left <- m_male_left
gambling2_m_male_right <- m_male_right
load("gambling3_m_female_left.R")
load("gambling3_m_female_right.R")
load("gambling3_m_male_left.R")
load("gambling3_m_male_right.R")
gambling3_m_female_left <- m_female_left
gambling3_m_female_right <- m_female_right
gambling3_m_male_left <- m_male_left
gambling3_m_male_right <- m_male_right
load("gambling6_m_female_left.R")
load("gambling6_m_female_right.R")
load("gambling6_m_male_left.R")
load("gambling6_m_male_right.R")
gambling6_m_female_left <- m_female_left
gambling6_m_female_right <- m_female_right
gambling6_m_male_left <- m_male_left
gambling6_m_male_right <- m_male_right

load("language1_m_female_left.R")
load("language1_m_female_right.R")
load("language1_m_male_left.R")
load("language1_m_male_right.R")
language1_m_female_left <- m_female_left
language1_m_female_right <- m_female_right
language1_m_male_left <- m_male_left
language1_m_male_right <- m_male_right
load("language2_m_female_left.R")
load("language2_m_female_right.R")
load("language2_m_male_left.R")
load("language2_m_male_right.R")
language2_m_female_left <- m_female_left
language2_m_female_right <- m_female_right
language2_m_male_left <- m_male_left
language2_m_male_right <- m_male_right
load("language3_m_female_left.R")
load("language3_m_female_right.R")
load("language3_m_male_left.R")
load("language3_m_male_right.R")
language3_m_female_left <- m_female_left
language3_m_female_right <- m_female_right
language3_m_male_left <- m_male_left
language3_m_male_right <- m_male_right
load("language4_m_female_left.R")
load("language4_m_female_right.R")
load("language4_m_male_left.R")
load("language4_m_male_right.R")
language4_m_female_left <- m_female_left
language4_m_female_right <- m_female_right
language4_m_male_left <- m_male_left
language4_m_male_right <- m_male_right

load("relational1_m_female_left.R")
load("relational1_m_female_right.R")
load("relational1_m_male_left.R")
load("relational1_m_male_right.R")
relational1_m_female_left <- m_female_left
relational1_m_female_right <- m_female_right
relational1_m_male_left <- m_male_left
relational1_m_male_right <- m_male_right
load("relational2_m_female_left.R")
load("relational2_m_female_right.R")
load("relational2_m_male_left.R")
load("relational2_m_male_right.R")
relational2_m_female_left <- m_female_left
relational2_m_female_right <- m_female_right
relational2_m_male_left <- m_male_left
relational2_m_male_right <- m_male_right
load("relational3_m_female_left.R")
load("relational3_m_female_right.R")
load("relational3_m_male_left.R")
load("relational3_m_male_right.R")
relational3_m_female_left <- m_female_left
relational3_m_female_right <- m_female_right
relational3_m_male_left <- m_male_left
relational3_m_male_right <- m_male_right
load("relational4_m_female_left.R")
load("relational4_m_female_right.R")
load("relational4_m_male_left.R")
load("relational4_m_male_right.R")
relational4_m_female_left <- m_female_left
relational4_m_female_right <- m_female_right
relational4_m_male_left <- m_male_left
relational4_m_male_right <- m_male_right

load("social1_m_female_left.R")
load("social1_m_female_right.R")
load("social1_m_male_left.R")
load("social1_m_male_right.R")
social1_m_female_left <- m_female_left
social1_m_female_right <- m_female_right
social1_m_male_left <- m_male_left
social1_m_male_right <- m_male_right
load("social2_m_female_left.R")
load("social2_m_female_right.R")
load("social2_m_male_left.R")
load("social2_m_male_right.R")
social2_m_female_left <- m_female_left
social2_m_female_right <- m_female_right
social2_m_male_left <- m_male_left
social2_m_male_right <- m_male_right
load("social3_m_female_left.R")
load("social3_m_female_right.R")
load("social3_m_male_left.R")
load("social3_m_male_right.R")
social3_m_female_left <- m_female_left
social3_m_female_right <- m_female_right
social3_m_male_left <- m_male_left
social3_m_male_right <- m_male_right
load("social6_m_female_left.R")
load("social6_m_female_right.R")
load("social6_m_male_left.R")
load("social6_m_male_right.R")
social6_m_female_left <- m_female_left
social6_m_female_right <- m_female_right
social6_m_male_left <- m_male_left
social6_m_male_right <- m_male_right


load("wm1_m_female_left.R")
load("wm1_m_female_right.R")
load("wm1_m_male_left.R")
load("wm1_m_male_right.R")
wm1_m_female_left <- m_female_left
wm1_m_female_right <- m_female_right
wm1_m_male_left <- m_male_left
wm1_m_male_right <- m_male_right
load("wm2_m_female_left.R")
load("wm2_m_female_right.R")
load("wm2_m_male_left.R")
load("wm2_m_male_right.R")
wm2_m_female_left <- m_female_left
wm2_m_female_right <- m_female_right
wm2_m_male_left <- m_male_left
wm2_m_male_right <- m_male_right
load("wm3_m_female_left.R")
load("wm3_m_female_right.R")
load("wm3_m_male_left.R")
load("wm3_m_male_right.R")
wm3_m_female_left <- m_female_left
wm3_m_female_right <- m_female_right
wm3_m_male_left <- m_male_left
wm3_m_male_right <- m_male_right
load("wm4_m_female_left.R")
load("wm4_m_female_right.R")
load("wm4_m_male_left.R")
load("wm4_m_male_right.R")
wm4_m_female_left <- m_female_left
wm4_m_female_right <- m_female_right
wm4_m_male_left <- m_male_left
wm4_m_male_right <- m_male_right
load("wm5_m_female_left.R")
load("wm5_m_female_right.R")
load("wm5_m_male_left.R")
load("wm5_m_male_right.R")
wm5_m_female_left <- m_female_left
wm5_m_female_right <- m_female_right
wm5_m_male_left <- m_male_left
wm5_m_male_right <- m_male_right
load("wm6_m_female_left.R")
load("wm6_m_female_right.R")
load("wm6_m_male_left.R")
load("wm6_m_male_right.R")
wm6_m_female_left <- m_female_left
wm6_m_female_right <- m_female_right
wm6_m_male_left <- m_male_left
wm6_m_male_right <- m_male_right
load("wm7_m_female_left.R")
load("wm7_m_female_right.R")
load("wm7_m_male_left.R")
load("wm7_m_male_right.R")
wm7_m_female_left <- m_female_left
wm7_m_female_right <- m_female_right
wm7_m_male_left <- m_male_left
wm7_m_male_right <- m_male_right
load("wm8_m_female_left.R")
load("wm8_m_female_right.R")
load("wm8_m_male_left.R")
load("wm8_m_male_right.R")
wm8_m_female_left <- m_female_left
wm8_m_female_right <- m_female_right
wm8_m_male_left <- m_male_left
wm8_m_male_right <- m_male_right
load("wm9_m_female_left.R")
load("wm9_m_female_right.R")
load("wm9_m_male_left.R")
load("wm9_m_male_right.R")
wm9_m_female_left <- m_female_left
wm9_m_female_right <- m_female_right
wm9_m_male_left <- m_male_left
wm9_m_male_right <- m_male_right
load("wm10_m_female_left.R")
load("wm10_m_female_right.R")
load("wm10_m_male_left.R")
load("wm10_m_male_right.R")
wm10_m_female_left <- m_female_left
wm10_m_female_right <- m_female_right
wm10_m_male_left <- m_male_left
wm10_m_male_right <- m_male_right
load("wm11_m_female_left.R")
load("wm11_m_female_right.R")
load("wm11_m_male_left.R")
load("wm11_m_male_right.R")
wm11_m_female_left <- m_female_left
wm11_m_female_right <- m_female_right
wm11_m_male_left <- m_male_left
wm11_m_male_right <- m_male_right
load("wm14_m_female_left.R")
load("wm14_m_female_right.R")
load("wm14_m_male_left.R")
load("wm14_m_male_right.R")
wm14_m_female_left <- m_female_left
wm14_m_female_right <- m_female_right
wm14_m_male_left <- m_male_left
wm14_m_male_right <- m_male_right
load("wm15_m_female_left.R")
load("wm15_m_female_right.R")
load("wm15_m_male_left.R")
load("wm15_m_male_right.R")
wm15_m_female_left <- m_female_left
wm15_m_female_right <- m_female_right
wm15_m_male_left <- m_male_left
wm15_m_male_right <- m_male_right
load("wm16_m_female_left.R")
load("wm16_m_female_right.R")
load("wm16_m_male_left.R")
load("wm16_m_male_right.R")
wm16_m_female_left <- m_female_left
wm16_m_female_right <- m_female_right
wm16_m_male_left <- m_male_left
wm16_m_male_right <- m_male_right
load("wm17_m_female_left.R")
load("wm17_m_female_right.R")
load("wm17_m_male_left.R")
load("wm17_m_male_right.R")
wm17_m_female_left <- m_female_left
wm17_m_female_right <- m_female_right
wm17_m_male_left <- m_male_left
wm17_m_male_right <- m_male_right
load("wm18_m_female_left.R")
load("wm18_m_female_right.R")
load("wm18_m_male_left.R")
load("wm18_m_male_right.R")
wm18_m_female_left <- m_female_left
wm18_m_female_right <- m_female_right
wm18_m_male_left <- m_male_left
wm18_m_male_right <- m_male_right
load("wm19_m_female_left.R")
load("wm19_m_female_right.R")
load("wm19_m_male_left.R")
load("wm19_m_male_right.R")
wm19_m_female_left <- m_female_left
wm19_m_female_right <- m_female_right
wm19_m_male_left <- m_male_left
wm19_m_male_right <- m_male_right
load("wm20_m_female_left.R")
load("wm20_m_female_right.R")
load("wm20_m_male_left.R")
load("wm20_m_male_right.R")
wm20_m_female_left <- m_female_left
wm20_m_female_right <- m_female_right
wm20_m_male_left <- m_male_left
wm20_m_male_right <- m_male_right
load("wm21_m_female_left.R")
load("wm21_m_female_right.R")
load("wm21_m_male_left.R")
load("wm21_m_male_right.R")
wm21_m_female_left <- m_female_left
wm21_m_female_right <- m_female_right
wm21_m_male_left <- m_male_left
wm21_m_male_right <- m_male_right
load("wm22_m_female_left.R")
load("wm22_m_female_right.R")
load("wm22_m_male_left.R")
load("wm22_m_male_right.R")
wm22_m_female_left <- m_female_left
wm22_m_female_right <- m_female_right
wm22_m_male_left <- m_male_left
wm22_m_male_right <- m_male_right
load("wm27_m_female_left.R")
load("wm27_m_female_right.R")
load("wm27_m_male_left.R")
load("wm27_m_male_right.R")
wm27_m_female_left <- m_female_left
wm27_m_female_right <- m_female_right
wm27_m_male_left <- m_male_left
wm27_m_male_right <- m_male_right
load("wm28_m_female_left.R")
load("wm28_m_female_right.R")
load("wm28_m_male_left.R")
load("wm28_m_male_right.R")
wm28_m_female_left <- m_female_left
wm28_m_female_right <- m_female_right
wm28_m_male_left <- m_male_left
wm28_m_male_right <- m_male_right
load("wm29_m_female_left.R")
load("wm29_m_female_right.R")
load("wm29_m_male_left.R")
load("wm29_m_male_right.R")
wm29_m_female_left <- m_female_left
wm29_m_female_right <- m_female_right
wm29_m_male_left <- m_male_left
wm29_m_male_right <- m_male_right

load("motor1_m_female_left.R")
load("motor1_m_female_right.R")
load("motor1_m_male_left.R")
load("motor1_m_male_right.R")
motor1_m_female_left <- m_female_left
motor1_m_female_right <- m_female_right
motor1_m_male_left <- m_male_left
motor1_m_male_right <- m_male_right
load("motor2_m_female_left.R")
load("motor2_m_female_right.R")
load("motor2_m_male_left.R")
load("motor2_m_male_right.R")
motor2_m_female_left <- m_female_left
motor2_m_female_right <- m_female_right
motor2_m_male_left <- m_male_left
motor2_m_male_right <- m_male_right
load("motor3_m_female_left.R")
load("motor3_m_female_right.R")
load("motor3_m_male_left.R")
load("motor3_m_male_right.R")
motor3_m_female_left <- m_female_left
motor3_m_female_right <- m_female_right
motor3_m_male_left <- m_male_left
motor3_m_male_right <- m_male_right
load("motor4_m_female_left.R")
load("motor4_m_female_right.R")
load("motor4_m_male_left.R")
load("motor4_m_male_right.R")
motor4_m_female_left <- m_female_left
motor4_m_female_right <- m_female_right
motor4_m_male_left <- m_male_left
motor4_m_male_right <- m_male_right
load("motor5_m_female_left.R")
load("motor5_m_female_right.R")
load("motor5_m_male_left.R")
load("motor5_m_male_right.R")
motor5_m_female_left <- m_female_left
motor5_m_female_right <- m_female_right
motor5_m_male_left <- m_male_left
motor5_m_male_right <- m_male_right
load("motor6_m_female_left.R")
load("motor6_m_female_right.R")
load("motor6_m_male_left.R")
load("motor6_m_male_right.R")
motor6_m_female_left <- m_female_left
motor6_m_female_right <- m_female_right
motor6_m_male_left <- m_male_left
motor6_m_male_right <- m_male_right
load("motor7_m_female_left.R")
load("motor7_m_female_right.R")
load("motor7_m_male_left.R")
load("motor7_m_male_right.R")
motor7_m_female_left <- m_female_left
motor7_m_female_right <- m_female_right
motor7_m_male_left <- m_male_left
motor7_m_male_right <- m_male_right
load("motor8_m_female_left.R")
load("motor8_m_female_right.R")
load("motor8_m_male_left.R")
load("motor8_m_male_right.R")
motor8_m_female_left <- m_female_left
motor8_m_female_right <- m_female_right
motor8_m_male_left <- m_male_left
motor8_m_male_right <- m_male_right
load("motor9_m_female_left.R")
load("motor9_m_female_right.R")
load("motor9_m_male_left.R")
load("motor9_m_male_right.R")
motor9_m_female_left <- m_female_left
motor9_m_female_right <- m_female_right
motor9_m_male_left <- m_male_left
motor9_m_male_right <- m_male_right
load("motor10_m_female_left.R")
load("motor10_m_female_right.R")
load("motor10_m_male_left.R")
load("motor10_m_male_right.R")
motor10_m_female_left <- m_female_left
motor10_m_female_right <- m_female_right
motor10_m_male_left <- m_male_left
motor10_m_male_right <- m_male_right
load("motor11_m_female_left.R")
load("motor11_m_female_right.R")
load("motor11_m_male_left.R")
load("motor11_m_male_right.R")
motor11_m_female_left <- m_female_left
motor11_m_female_right <- m_female_right
motor11_m_male_left <- m_male_left
motor11_m_male_right <- m_male_right
load("motor12_m_female_left.R")
load("motor12_m_female_right.R")
load("motor12_m_male_left.R")
load("motor12_m_male_right.R")
motor12_m_female_left <- m_female_left
motor12_m_female_right <- m_female_right
motor12_m_male_left <- m_male_left
motor12_m_male_right <- m_male_right
load("motor13_m_female_left.R")
load("motor13_m_female_right.R")
load("motor13_m_male_left.R")
load("motor13_m_male_right.R")
motor13_m_female_left <- m_female_left
motor13_m_female_right <- m_female_right
motor13_m_male_left <- m_male_left
motor13_m_male_right <- m_male_right
load("motor21_m_female_left.R")
load("motor21_m_female_right.R")
load("motor21_m_male_left.R")
load("motor21_m_male_right.R")
motor21_m_female_left <- m_female_left
motor21_m_female_right <- m_female_right
motor21_m_male_left <- m_male_left
motor21_m_male_right <- m_male_right
load("motor22_m_female_left.R")
load("motor22_m_female_right.R")
load("motor22_m_male_left.R")
load("motor22_m_male_right.R")
motor22_m_female_left <- m_female_left
motor22_m_female_right <- m_female_right
motor22_m_male_left <- m_male_left
motor22_m_male_right <- m_male_right
load("motor23_m_female_left.R")
load("motor23_m_female_right.R")
load("motor23_m_male_left.R")
load("motor23_m_male_right.R")
motor23_m_female_left <- m_female_left
motor23_m_female_right <- m_female_right
motor23_m_male_left <- m_male_left
motor23_m_male_right <- m_male_right
load("motor24_m_female_left.R")
load("motor24_m_female_right.R")
load("motor24_m_male_left.R")
load("motor24_m_male_right.R")
motor24_m_female_left <- m_female_left
motor24_m_female_right <- m_female_right
motor24_m_male_left <- m_male_left
motor24_m_male_right <- m_male_right
load("motor25_m_female_left.R")
load("motor25_m_female_right.R")
load("motor25_m_male_left.R")
load("motor25_m_male_right.R")
motor25_m_female_left <- m_female_left
motor25_m_female_right <- m_female_right
motor25_m_male_left <- m_male_left
motor25_m_male_right <- m_male_right
load("motor26_m_female_left.R")
load("motor26_m_female_right.R")
load("motor26_m_male_left.R")
load("motor26_m_male_right.R")
motor26_m_female_left <- m_female_left
motor26_m_female_right <- m_female_right
motor26_m_male_left <- m_male_left
motor26_m_male_right <- m_male_right

## concatenate left+right hemispheres

emotion1 <- rbind(data.frame(emotion1_m_male_left, emotion1_m_male_right), data.frame(emotion1_m_female_left, emotion1_m_female_right))
emotion2 <- rbind(data.frame(emotion2_m_male_left, emotion2_m_male_right), data.frame(emotion2_m_female_left, emotion2_m_female_right))
emotion3 <- rbind(data.frame(emotion3_m_male_left, emotion3_m_male_right), data.frame(emotion3_m_female_left, emotion3_m_female_right))
emotion6 <- rbind(data.frame(emotion6_m_male_left, emotion6_m_male_right), data.frame(emotion6_m_female_left, emotion6_m_female_right))
gambling1 <- rbind(data.frame(gambling1_m_male_left, gambling1_m_male_right), data.frame(gambling1_m_female_left, gambling1_m_female_right))
gambling2 <- rbind(data.frame(gambling2_m_male_left, gambling2_m_male_right), data.frame(gambling2_m_female_left, gambling2_m_female_right))
gambling3 <- rbind(data.frame(gambling3_m_male_left, gambling3_m_male_right), data.frame(gambling3_m_female_left, gambling3_m_female_right))
gambling6 <- rbind(data.frame(gambling6_m_male_left, gambling6_m_male_right), data.frame(gambling6_m_female_left, gambling6_m_female_right))
language1 <- rbind(data.frame(language1_m_male_left, language1_m_male_right), data.frame(language1_m_female_left, language1_m_female_right))
language2 <- rbind(data.frame(language2_m_male_left, language2_m_male_right), data.frame(language2_m_female_left, language2_m_female_right))
language3 <- rbind(data.frame(language3_m_male_left, language3_m_male_right), data.frame(language3_m_female_left, language3_m_female_right))
language4 <- rbind(data.frame(language4_m_male_left, language4_m_male_right), data.frame(language4_m_female_left, language4_m_female_right))
relational1 <- rbind(data.frame(relational1_m_male_left, relational1_m_male_right), data.frame(relational1_m_female_left, relational1_m_female_right))
relational2 <- rbind(data.frame(relational2_m_male_left, relational2_m_male_right), data.frame(relational2_m_female_left, relational2_m_female_right))
relational3 <- rbind(data.frame(relational3_m_male_left, relational3_m_male_right), data.frame(relational3_m_female_left, relational3_m_female_right))
relational4 <- rbind(data.frame(relational4_m_male_left, relational4_m_male_right), data.frame(relational4_m_female_left, relational4_m_female_right))
social1 <- rbind(data.frame(social1_m_male_left, social1_m_male_right), data.frame(social1_m_female_left, social1_m_female_right))
social2 <- rbind(data.frame(social2_m_male_left, social2_m_male_right), data.frame(social2_m_female_left, social2_m_female_right))
social3 <- rbind(data.frame(social3_m_male_left, social3_m_male_right), data.frame(social3_m_female_left, social3_m_female_right))
social6 <- rbind(data.frame(social6_m_male_left, social6_m_male_right), data.frame(social6_m_female_left, social6_m_female_right))

wm1 <- rbind(data.frame(wm1_m_male_left, wm1_m_male_right), data.frame(wm1_m_female_left, wm1_m_female_right))
wm2 <- rbind(data.frame(wm2_m_male_left, wm2_m_male_right), data.frame(wm2_m_female_left, wm2_m_female_right))
wm3 <- rbind(data.frame(wm3_m_male_left, wm3_m_male_right), data.frame(wm3_m_female_left, wm3_m_female_right))
wm4 <- rbind(data.frame(wm4_m_male_left, wm4_m_male_right), data.frame(wm4_m_female_left, wm4_m_female_right))
wm5 <- rbind(data.frame(wm5_m_male_left, wm5_m_male_right), data.frame(wm5_m_female_left, wm5_m_female_right))
wm6 <- rbind(data.frame(wm6_m_male_left, wm6_m_male_right), data.frame(wm6_m_female_left, wm6_m_female_right))
wm7 <- rbind(data.frame(wm7_m_male_left, wm7_m_male_right), data.frame(wm7_m_female_left, wm7_m_female_right))
wm8 <- rbind(data.frame(wm8_m_male_left, wm8_m_male_right), data.frame(wm8_m_female_left, wm8_m_female_right))
wm9 <- rbind(data.frame(wm9_m_male_left, wm9_m_male_right), data.frame(wm9_m_female_left, wm9_m_female_right))
wm10 <- rbind(data.frame(wm10_m_male_left, wm10_m_male_right), data.frame(wm10_m_female_left, wm10_m_female_right))
wm11 <- rbind(data.frame(wm11_m_male_left, wm11_m_male_right), data.frame(wm11_m_female_left, wm11_m_female_right))
wm14 <- rbind(data.frame(wm14_m_male_left, wm14_m_male_right), data.frame(wm14_m_female_left, wm14_m_female_right))
wm15 <- rbind(data.frame(wm15_m_male_left, wm15_m_male_right), data.frame(wm15_m_female_left, wm15_m_female_right))
wm16 <- rbind(data.frame(wm16_m_male_left, wm16_m_male_right), data.frame(wm16_m_female_left, wm16_m_female_right))
wm17 <- rbind(data.frame(wm17_m_male_left, wm17_m_male_right), data.frame(wm17_m_female_left, wm17_m_female_right))
wm18 <- rbind(data.frame(wm18_m_male_left, wm18_m_male_right), data.frame(wm18_m_female_left, wm18_m_female_right))
wm19 <- rbind(data.frame(wm19_m_male_left, wm19_m_male_right), data.frame(wm19_m_female_left, wm19_m_female_right))
wm20 <- rbind(data.frame(wm20_m_male_left, wm20_m_male_right), data.frame(wm20_m_female_left, wm20_m_female_right))
wm21 <- rbind(data.frame(wm21_m_male_left, wm21_m_male_right), data.frame(wm21_m_female_left, wm21_m_female_right))
wm22 <- rbind(data.frame(wm22_m_male_left, wm22_m_male_right), data.frame(wm22_m_female_left, wm22_m_female_right))
wm27 <- rbind(data.frame(wm27_m_male_left, wm27_m_male_right), data.frame(wm27_m_female_left, wm27_m_female_right))
wm28 <- rbind(data.frame(wm28_m_male_left, wm28_m_male_right), data.frame(wm28_m_female_left, wm28_m_female_right))
wm29 <- rbind(data.frame(wm29_m_male_left, wm29_m_male_right), data.frame(wm29_m_female_left, wm29_m_female_right))

motor1 <- rbind(data.frame(motor1_m_male_left, motor1_m_male_right), data.frame(motor1_m_female_left, motor1_m_female_right))
motor2 <- rbind(data.frame(motor2_m_male_left, motor2_m_male_right), data.frame(motor2_m_female_left, motor2_m_female_right))
motor3 <- rbind(data.frame(motor3_m_male_left, motor3_m_male_right), data.frame(motor3_m_female_left, motor3_m_female_right))
motor4 <- rbind(data.frame(motor4_m_male_left, motor4_m_male_right), data.frame(motor4_m_female_left, motor4_m_female_right))
motor5 <- rbind(data.frame(motor5_m_male_left, motor5_m_male_right), data.frame(motor5_m_female_left, motor5_m_female_right))
motor6 <- rbind(data.frame(motor6_m_male_left, motor6_m_male_right), data.frame(motor6_m_female_left, motor6_m_female_right))
motor7 <- rbind(data.frame(motor7_m_male_left, motor7_m_male_right), data.frame(motor7_m_female_left, motor7_m_female_right))
motor8 <- rbind(data.frame(motor8_m_male_left, motor8_m_male_right), data.frame(motor8_m_female_left, motor8_m_female_right))
motor9 <- rbind(data.frame(motor9_m_male_left, motor9_m_male_right), data.frame(motor9_m_female_left, motor9_m_female_right))
motor10 <- rbind(data.frame(motor10_m_male_left, motor10_m_male_right), data.frame(motor10_m_female_left, motor10_m_female_right))
motor11 <- rbind(data.frame(motor11_m_male_left, motor11_m_male_right), data.frame(motor11_m_female_left, motor11_m_female_right))
motor12 <- rbind(data.frame(motor12_m_male_left, motor12_m_male_right), data.frame(motor12_m_female_left, motor12_m_female_right))
motor13 <- rbind(data.frame(motor13_m_male_left, motor13_m_male_right), data.frame(motor13_m_female_left, motor13_m_female_right))
motor21 <- rbind(data.frame(motor21_m_male_left, motor21_m_male_right), data.frame(motor21_m_female_left, motor21_m_female_right))
motor22 <- rbind(data.frame(motor22_m_male_left, motor22_m_male_right), data.frame(motor22_m_female_left, motor22_m_female_right))
motor23 <- rbind(data.frame(motor23_m_male_left, motor23_m_male_right), data.frame(motor23_m_female_left, motor23_m_female_right))
motor24 <- rbind(data.frame(motor24_m_male_left, motor24_m_male_right), data.frame(motor24_m_female_left, motor24_m_female_right))
motor25 <- rbind(data.frame(motor25_m_male_left, motor25_m_male_right), data.frame(motor25_m_female_left, motor25_m_female_right))
motor26 <- rbind(data.frame(motor26_m_male_left, motor26_m_male_right), data.frame(motor26_m_female_left, motor26_m_female_right))

## concatenate all contrasts together

contrast_by_vertex <-rbind(emotion1,
                           emotion2,
                           emotion3,
                           emotion6,
                           gambling1,
                           gambling2,
                           gambling3,
                           gambling6,
                           language1,
                           language2,
                           language3,
                           language4,
                           relational1,
                           relational2,
                           relational3,
                           relational4,
                           social1,
                           social2,
                           social3,
                           social6,
                           wm1,
                           wm2,
                           wm3,
                           wm4,
                           wm5,
                           wm6,
                           wm7,
                           wm8,
                           wm9,
                           wm10,
                           wm11,
                           wm14,
                           wm15,
                           wm16,
                           wm17,
                           wm18,
                           wm19,
                           wm20,
                           wm21,
                           wm22,
                           wm27,
                           wm28,
                           wm29,
                           motor1,
                           motor2,
                           motor3,
                           motor4,
                           motor5,
                           motor6,
                           motor7,
                           motor8,
                           motor9,
                           motor10,
                           motor11,
                           motor12,
                           motor13,
                           motor21,
                           motor22,
                           motor23,
                           motor24,
                           motor25,
                           motor26)

gid_emotion <- read.delim("gid_emotion", header = FALSE)
gid_male_emotion <- read.delim("gid_male_emotion", header = FALSE)
gid_female_emotion <- read.delim("gid_female_emotion", header = FALSE)
gid_gambling <- read.delim("gid_gambling", header = FALSE)
gid_male_gambling <- read.delim("gid_gambling_male", header = FALSE)
gid_female_gambling <- read.delim("gid_gambling_female", header = FALSE)
gid_relational <- read.delim("gid_relational", header = FALSE)
gid_male_relational <- read.delim("gid_relational_male", header = FALSE)
gid_female_relational <- read.delim("gid_relational_female", header = FALSE)
gid_social <- read.delim("gid_social", header = FALSE)
gid_male_social <- read.delim("gid_social_male", header = FALSE)
gid_female_social <- read.delim("gid_social_female", header = FALSE)
gid_language <- read.delim("gid_language", header = FALSE)
gid_male_language <- read.delim("gid_language_male", header = FALSE)
gid_female_language <- read.delim("gid_language_female", header = FALSE)
gid_wm <- read.delim("gid_wm_missing", header = FALSE)
gid_male_wm <- read.delim("gid_wm_male_missing", header = FALSE)
gid_female_wm <- read.delim("gid_wm_female_missing", header = FALSE)
gid_motor <- read.delim("gid_motor", header = FALSE)
gid_male_motor <- read.delim("gid_motor_male", header = FALSE)
gid_female_motor <- read.delim("gid_motor_female", header = FALSE)


## combine into HCP_huge

HCP_huge <- data.frame(ID = c(rep(c(unlist(gid_male_emotion), unlist(gid_female_emotion)), 4),
                              rep(c(unlist(gid_male_gambling), unlist(gid_female_gambling)), 4),
                              rep(c(unlist(gid_male_language), unlist(gid_female_language)), 4),
                              rep(c(unlist(gid_male_relational), unlist(gid_female_relational)), 4),
                              rep(c(unlist(gid_male_social), unlist(gid_female_social)), 4),
                              rep(c(unlist(gid_male_wm), unlist(gid_female_wm)), 23),
                              rep(c(unlist(gid_male_motor), unlist(gid_female_motor)), 19)),
                       
                       SEX = c(rep(c(rep("M", length(t(gid_male_emotion))), rep("F", length(t(gid_female_emotion)))), 4),
                               rep(c(rep("M", length(t(gid_male_gambling))), rep("F", length(t(gid_female_gambling)))), 4),
                               rep(c(rep("M", length(t(gid_male_language))), rep("F", length(t(gid_female_language)))), 4),
                               rep(c(rep("M", length(t(gid_male_relational))), rep("F", length(t(gid_female_relational)))), 4),
                               rep(c(rep("M", length(t(gid_male_social))), rep("F", length(t(gid_female_social)))), 4),
                               rep(c(rep("M", length(t(gid_male_wm))), rep("F", length(t(gid_female_wm)))), 23),
                               rep(c(rep("M", length(t(gid_male_motor))), rep("F", length(t(gid_female_motor)))), 19)),
                       
                       CONTRAST = c(rep("faces", (length(t(gid_male_emotion)) + length(t(gid_female_emotion)))),
                                    rep("shapes", (length(t(gid_male_emotion)) + length(t(gid_female_emotion)))),
                                    rep("faces_shapes", (length(t(gid_male_emotion)) + length(t(gid_female_emotion)))),
                                    rep("shapes_faces", (length(t(gid_male_emotion)) + length(t(gid_female_emotion)))), 
                                    rep("punish",  (length(t(gid_male_gambling)) + length(t(gid_female_gambling)))),
                                    rep("reward", (length(t(gid_male_gambling)) + length(t(gid_female_gambling)))),
                                    rep("punish_reward", (length(t(gid_male_gambling)) + length(t(gid_female_gambling)))),
                                    rep("reward_punish", (length(t(gid_male_gambling)) + length(t(gid_female_gambling)))),
                                    rep("math", (length(t(gid_male_language)) + length(t(gid_female_language)))),
                                    rep("story", (length(t(gid_male_language)) + length(t(gid_female_language)))),
                                    rep("math_story", (length(t(gid_male_language)) + length(t(gid_female_language)))),
                                    rep("story_math", (length(t(gid_male_language)) + length(t(gid_female_language)))),
                                    rep("match", (length(t(gid_male_relational)) + length(t(gid_female_relational)))),
                                    rep("rel", (length(t(gid_male_relational)) + length(t(gid_female_relational)))),
                                    rep("match_rel", (length(t(gid_male_relational)) + length(t(gid_female_relational)))),
                                    rep("rel_match", (length(t(gid_male_relational)) + length(t(gid_female_relational)))),
                                    rep("random", (length(t(gid_male_social)) + length(t(gid_female_social)))),
                                    rep("tom", (length(t(gid_male_social)) + length(t(gid_female_social)))),
                                    rep("random_tom", (length(t(gid_male_social)) + length(t(gid_female_social)))),
                                    rep("tom_random", (length(t(gid_male_social)) + length(t(gid_female_social)))),
                                    rep("two2bk_body", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("l2bk_face", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("l2bk_place",(length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("r2bk_tool", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("r0bk_body", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("t0bk_face", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("a0bk_place",(length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("c0bk_tool",(length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("l2bk", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("l0bk", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("twobk_0bk", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("zeroback_2bk", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("body",(length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("face", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("place", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("tool", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("body_avg", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("face_avg",(length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("place_avg", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("tool_avg", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("avg_face", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("avg_place", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("avg_tool", (length(t(gid_male_wm)) + length(t(gid_female_wm)))),
                                    rep("cue", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("lf", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("lh", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("rf", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("rh", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("t", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("avg",(length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("cue_avg", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("lf_avg", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("lh_avg", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("rf_avg", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("rh_avg",(length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("t_avg", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("avg_cue",(length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("avg_lf", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("avg_lh", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("avg_rf", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("avg_rh", (length(t(gid_male_motor)) + length(t(gid_female_motor)))),
                                    rep("avg_t", (length(t(gid_male_motor)) + length(t(gid_female_motor))))),
                       
                       contrast_by_vertex)

# save so you dont have to run this every time lol

save(HCP_huge, file = "HCP_huge.R")


# break out columns in HCP_huge into df_list

df_list <- list()
c <- 1
for (i in 4:59415){
  df_list[[paste0('d', c)]] <- data.frame(HCP_huge[c(1:3, i)])
  colnames(df_list[[paste0('d', c)]]) <- c("ID", "SEX", "CONTRAST", "v")
  c <- c+1
}

save(df_list, file = "df_list.R")
