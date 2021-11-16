%% SDSU Machine Learning Course (EE600/CompE596)
%% Programming Assignment:  Neural Network 
%
%  Instructions
%  ------------
% 
%  Dataset comes from: 
%   http://networkrepository.com/pima-indians-diabetes.php
% 
% 
%  This file contains code that helps you get started on the
%  neural network assignment. 
%
%  You will need to complete the following functions in this 
%  assignment
%
%     loadData.m
%     featureNormalize.m
%     trainNN.m
%     evaluateAccuracy.m
%     predict.m
%     sigmoid.m
%
%  For this part of the assignment, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).


% Initialization
clear ; close all; clc

%% =========== Part 1: Data Preprocessing =============
% Instructions: The following code loads data into matlab, splits the 
%               data into two sets, and performs feature normalization. 
%               You will need to complete code in loadData.m, and 
%               featureNormalize.m
%

%% Load data
fprintf('Loading data ...\n');

% ====================== YOUR CODE HERE ======================
[X_train, y_train, X_test, y_test] = loadData();

% ============================================================

[n, m] = size(X_train); % n is the number of total data examples
                        % m is the number of features
                        
% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

%% Normalize the features. 
% ====================== YOUR CODE HERE ======================
[Xn_train, mu, sigma] = featureNormalize(X_train);

% ============================================================

num_train = length(y_train); % number of training examples


%% ================ Part 2: Training Neural Network ============

fprintf('Running backpropagation ...\n');

% Instructions: The following code applies backpropagation algorithm to 
%               estimate the parameters in a neural network model with 
%               a single hidden layer. 
%               You should complete code in trainNN.m, and sigmoid.m
%
%               Try running the backpropagation algorithm with 
%               different values of alpha and num_hidden and see which 
%               one gives you the best result.
%

%% Setup the parameters you will use for this assignment
% ====================== YOUR CODE HERE ======================
alpha = 0.01; %0.001; % you should change this
num_epochs = 3000; % you should change this 

num_hidden = width(X_train);   % number of hidden units (not including the bia unit)
num_output = 1;   % number output unit

% ============================================================

% m is number of features

% initialize the weights: beta1 and beta2 
beta1 = rand(num_hidden, m+1); % weights associated with links between input and hidden layers
beta2 = rand(num_output, num_hidden+1); % weights associated with links between hidden and output layers

%% Run backpropagation 
% ====================== YOUR CODE HERE ======================
[beta1, beta2, J_history] = trainNN(Xn_train, y_train, beta1, beta2, alpha, num_epochs);

% ============================================================

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of epochs');
ylabel('Cost J');

%% ========== Part 3: Evaluate performance =============

fprintf('Evaluate the prediction accuracy ...\n');

% Instructions: The following code evaluates the performance of
%               the trained neural network model. You should 
%               complete code in evaluateAccuracy.m, predict.m
%

num_test = length(y_test); % number of testing examples

% normalize input features of the testing set
Xn_test = (X_test - mu)./sigma;

% ====================== YOUR CODE HERE ======================
accuracy = evaluateAccuracy(beta1, beta2, Xn_test, y_test);

% ============================================================

% Display the prediction accuracy
fprintf('Accuracy:\n %f\n', accuracy);
fprintf('\n');



