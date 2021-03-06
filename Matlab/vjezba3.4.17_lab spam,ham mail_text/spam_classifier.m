% Spam/ham klasifikator, glavni program

%% Formiraj model
conf = get_conf();
vocab = generate_vocabulary(conf);
[training_set, training_C, test_set, test_C] = ...
    compute_collection_representation(vocab, conf);

%% NN klasifikator

training_set1 = training_set > 0;
test_set1 = test_set > 0;

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
model = svmtrain(training_C, training_set);

[predicted_label_svm, accuracy, ~] = svmpredict(testing_C, test_set,model);

acc_svm = sum(predict_label_svm == test_C) / length(test_C)

cm_svm = conf_mat(predict_label_svm, test_C, 2)

