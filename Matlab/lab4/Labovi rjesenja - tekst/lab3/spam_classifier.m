% Spam/ham klasifikator, glavni program

%% Formiraj model
conf = get_conf();
vocab = generate_vocabulary(conf);
[training_set, training_C, test_set, test_C] = ...
    compute_collection_representation(vocab, conf);

%% NN klasifikator

predict_label_nn = apply_nn(training_set, training_C, test_set);

acc_nn = sum(predict_label_nn == test_C) / length(test_C)

cm_nn = conf_mat(predict_label_nn, test_C, 2)

%% SVM klasifikator

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ovdje ubaciti pozive funkcija za obucavanje SVM i klasifikaciju. U
% vektoru predict_label_svm (dimenzije 200x1) treba da budu oznake poruka 
% iz trening skupa koje je vratila SVM. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ne radi mi SVM tako da nisam siguran za ovo :D
model = svmtrain(training_C, training_set); % mozda treba dodati parametre tipa -b ili neki drugi
predict_label_svm = svmpredict(double(test_C), test_set, model); % i ovdje se mogu dodavati neki parametri


acc_svm = sum(predict_label_svm == test_C) / length(test_C)

cm_svm = conf_mat(predict_label_svm, test_C, 2)

