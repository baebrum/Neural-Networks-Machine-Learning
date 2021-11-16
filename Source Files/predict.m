function p = predict(beta1, beta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(beta1, beta2, X) outputs the probability of the output to 
%   1, given input X and trained weights of a neural network (beta1, beta2)

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1); % 

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. 
%
%
[n, ~] = size(X); % n is number of training examples
num_hidden = length(beta1(:,1)); % number of hidden units (bias not included)
num_output = length(beta2(:,2)); % number of output units

for d = 1:n
    temp_a_layer2 = zeros(1,num_hidden);
    temp_a_layer3 = zeros(1, num_output);

    for i=1:num_hidden
        temp_a_layer2(i) = sigmoid(1*beta1(i,1) + ( X(d,:)*(beta1(i,2:end)')) );
    end
    for i=1:num_output
        temp_a_layer3(i) = sigmoid(1*beta2(i,1) + (temp_a_layer2)*beta2(i,2:end)');
    end
    if(temp_a_layer3 > 0.5)
        p(d) = 1;
    else
        p(d) = 0;
    end
end


% =========================================================================


end
