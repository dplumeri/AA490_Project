*------------------------------------------------------------*;
* Score3: Creating Fixed Names;
*------------------------------------------------------------*;
LENGTH EM_EVENTPROBABILITY 8;
LABEL EM_EVENTPROBABILITY = 'Probability for level 85+ of Age_group';
EM_EVENTPROBABILITY = P_Age_group85_;
LENGTH EM_PROBABILITY 8;
LABEL EM_PROBABILITY = 'Probability of Classification';
EM_PROBABILITY =
max(
P_Age_group85_
,
P_Age_group65_84
,
P_Age_group25_44
,
P_Age_group18_24
,
P_Age_group0_17
);
LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for Age_group";
EM_CLASSIFICATION = I_Age_group;
LABEL EM_CLASSTARGET = 'Target Variable: Age_group';
EM_CLASSTARGET = F_Age_group;
