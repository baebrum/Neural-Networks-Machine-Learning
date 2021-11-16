function accuracy = evaluateAccuracy(beta1, beta2, X, y)
%EVALUATEACCURACY calculates the prediction accuracy of the learned 
%neural network model using the testing data 

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the percentage of accurately predicted examples 
%
%
total = 0;

% predict function using betas and inputs 
predicted_value = predict(beta1, beta2, X);
%compute percentage of correct predicted values with actual values
for sample_i=1:height(X)
    if y(sample_i) == predicted_value(sample_i)
        total = total + 1;
    end
end
accuracy = total/height(X);
% ============================================================

end