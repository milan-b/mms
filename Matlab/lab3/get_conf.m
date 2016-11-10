function conf = get_conf()

% lista putanja do trening fajlova
conf.training_filepath = {'emails\spamtraining', 'emails\hamtraining'};
% klase kojim pripadaju trening fajlovi
conf.training_classes = [1; 2];

% lista putanja do testnih fajlova
conf.test_filepath = {'emails\spamtesting', 'emails\hamtesting'};
% klase kojim pripadaju testni fajlovi
conf.test_classes = [1; 2];

% minimalna duzina rijeci
conf.minlen = 1;

% minimalan broj pojavljivanja da bi rijec dospjela u rjecnik
conf.mintf = 1;