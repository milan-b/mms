function label = apply_nn(training_set, training_C, test_set)
% APPLY_NN Klasifikator na principu najblizih susjeda
%    LABEL = APPLY_NN(TRAINING_SET, TRAINING_C, TEST_SET) vraca vektor
%    oznaka klasa u koju su klasifikovani uzorci iz testnog skupa TEST_SET.
%    Trening uzorci su TRAINING_SET, a njihove oznake klasa u TRAINING_C.
%    U TRAINING_SET i TEST_SET uzorci su u redovima matrice. Broj elemenata 
%    u TRAINING_C je jednak broju redova u matrici TRAINING_SET. Broj
%    elemenata u vektoru LABEL mora biti jednak broju redova u matrici
%    TEST_SET.
%  

label = zeros(size(test_set, 1), 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Ovdje unesite vas kod.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for i = 1:length(test_set)
%    vec = test_set(i,:);
    %dist = zeros(length(trenig_set));
   % for j = 1:length(trening_set)
  %      dist = vec * trening_set(j,:)';
 %       ...
 
 dist = training_set * test_set';
 [~,i] = max(dist);
 
 label = training_C(i);
%return label;
