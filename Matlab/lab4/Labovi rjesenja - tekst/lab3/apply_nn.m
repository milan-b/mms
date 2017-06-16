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

slicnosti = test_set * training_set'; % matrica slicnosti svakog test vektora sa svakim trening vektorom
[~,pozicije]=max(slicnosti,[],2); % pozicije najslicnijih trening vektora po vrstama (za svaki test vektor)
label = training_C(pozicije); % test vektorima se dodjeljuju labele njima najblizih trening vektora