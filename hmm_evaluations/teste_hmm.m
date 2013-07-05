TRANS = [.9 .1; .05 .95;];

EMIS = [1/6, 1/6, 1/6, 1/6];

seq = [.2 .3 .0 .1; .3 .3 .0 .1; .0 .0 .1 .2; .0 .0 .0 .0];

[TRANS_EST2, EMIS_EST2] = hmmtrain(seq, TRANS, EMIS)

