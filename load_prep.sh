##### investigating HCP task fmri for evidence of sex biased activation
##### ethan whitman, 6/3/21

##### I used datalad to retrieve the preprocessed, individual-level contrasts + associated 
##### files for each person in the S900 release. this transfer takes a super long time.

module load datalad
module load git

while read -a field; do
sid=${field[0]}

datalad get $sid/MNINonLinear/Results/tfMRI_GAMBLING/tfMRI_GAMBLING_hp200_s4_level2.feat/

done < gid

while read -a field; do
sid=${field[0]}

datalad get $sid/MNINonLinear/Results/tfMRI_LANGUAGE/tfMRI_LANGUAGE_hp200_s4_level2.feat/

done < gid


while read -a field; do
sid=${field[0]}

datalad get $sid/MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2.feat/

done < gid

while read -a field; do
sid=${field[0]}

datalad get $sid/MNINonLinear/Results/tfMRI_RELATIONAL/tfMRI_RELATIONAL_hp200_s4_level2.feat/

done < gid

while read -a field; do
sid=${field[0]}

datalad get $sid/MNINonLinear/Results/tfMRI_SOCIAL/tfMRI_SOCIAL_hp200_s4_level2.feat/

done < gid

while read -a field; do
sid=${field[0]}

datalad get $sid/MNINonLinear/Results/tfMRI_WM/tfMRI_WM_hp200_s4_level2.feat/

done < gid

### transferring motion estimates for all runs of all tasks -  example shown with emotion

while read -a field; do
sid=${field[0]}

datalad get ${sid}/MNINonLinear/Results/tfMRI_EMOTION_LR/Movement_AbsoluteRMS_mean.txt
datalad get ${sid}/MNINonLinear/Results/tfMRI_EMOTION_RL/Movement_AbsoluteRMS_mean.txt

done < gid_emotion



#### average motion estimates for both runs across all tasks separately - example shown with emotion

while read -a field; do
sid=${field[0]}

cat ${sid}/MNINonLinear/Results/tfMRI_EMOTION_LR/Movement_AbsoluteRMS_mean.txt >> motor_LR.txt
cat ${sid}/MNINonLinear/Results/tfMRI_EMOTION_RL/Movement_AbsoluteRMS_mean.txt >> motor_RL.txt

done < gid_emotion

