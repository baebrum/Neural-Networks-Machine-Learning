function [X_train, y_train, X_test, y_test] = loadData()
%   LOADDATA imports data downloaded from 
%   http://networkrepository.com/pima-indians-diabetes.php
%   and splits the dataset into two sets: training set and testing set
%

 % ====================== YOUR CODE HERE ======================
    % Instructions: Import spreadsheets data, extract the first
    % 8 columns and store them as X. Extract the last column and 
    % store it as y. 
    %
    % Randomly pick 70% of the data examples as the training set and the 
    % the rest as the testing set
    %
    % Hint: You might find the 'readtable' and 'table2array' functions useful.
    %
table = readtable('pima-indians-diabetes.csv');
X = table2array(table(:,1:8)); % first 8 columns assigned to X
y = table2array(table(:,end)); % last column assigned to y

rows_x = height(X);
rows_y = height(y);

sample_percent = 0.7;
random_permutation = randperm(rows_x); % random permutation of number of rows

X_train = X(random_permutation(1:round(sample_percent*rows_x)),:); % 70 percent of datapoints to X_train
X_test = X(random_permutation(round(sample_percent*rows_x)+1:end),:); % 30 percent of datapoints to X_test

y_train = y(random_permutation(1:round(sample_percent*rows_y)),:); % 70 percent of datapoint to y_train
y_test = y(random_permutation(round(sample_percent*rows_y)+1:end),:); % 30 percent of datapoints to y_test

% ============================================================
end