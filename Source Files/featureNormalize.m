function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is a sample data. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

for feature_index = 1:width(X_norm)
    mu(feature_index) = mean(X_norm(:,feature_index)); % mean of each feature
    sigma(feature_index) = std(X_norm(:,feature_index)); % st dev of each feature
    for datapoint_index = 1:height(X_norm)
        X_norm(datapoint_index, feature_index) = (X_norm(datapoint_index, feature_index)-mu(feature_index))/sigma(feature_index); % normalize
    end
end

% ============================================================

end
