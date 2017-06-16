%%
% Zad 8

 ham = compute_document_representation('email_ham.txt', vocab, conf);
 apply_nn(training_set, training_C, ham)
 
 spam = compute_document_representation('email_spam.txt', vocab, conf);
 apply_nn(training_set, training_C, spam)
 
 % za binarni
 
 ham1 = double(ham > 0);
 spam1 = double(spam > 0);
 
 apply_nn(training_set1, training_C, ham1)

 apply_nn(training_set1, training_C, spam1)
 
 % zakljucak, binarni radi a obicni ne radi :)