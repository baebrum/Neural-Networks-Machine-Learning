function [beta1, beta2, J_history] = trainNN(X, y, beta1, beta2, alpha, num_epochs)
%TRAINNN train the neural network model using backpropagation algorithm. It
%updates the weights, beta1 and beta2 using the training examples. It also
%generates the cost computed after each epoch. 

% useful values
[n, ~] = size(X); % n is number of training examples
num_hidden = length(beta1(:,1)); % number of hidden units (bias not included)
num_output = length(beta2(:,2)); % number of output units

J_history_old = zeros(num_epochs,1); % 

for epoch = 1:num_epochs
% for each training example, do the following
    Jd = 0;
    for d = 1:n
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the weights beta1 and
    %               beta2. The key steps are indicated as follows
    %
    %
    
 
        %% Step 1: forward propagate to generate the network output
        temp_a_layer2 = zeros(1,num_hidden);
        temp_a_layer3 = zeros(1, num_output);

        for i=1:num_hidden
            temp_a_layer2(i) = sigmoid(1*beta1(i,1) + ( X(d,:)*(beta1(i,2:end)')) );
        end
        for i=1:num_output
            temp_a_layer3(i) = sigmoid(1*beta2(i,1) + (temp_a_layer2)*beta2(i,2:end)');
        end
        
        %% Step 2: for each output unit, calculate its error term
        % Recall that the number of output units is num_output
        temp_delta_layer3 = zeros(1,num_output);
        for i=1:num_output
            temp_delta_layer3(i) = temp_a_layer3(i)*(1-temp_a_layer3(i))*(y(d,i)-temp_a_layer3(i));
        end
        
        %% Step 3: for each hidden unit, calculate its error term
        % Recall that number of hidden units is num_hidden+1
        temp_delta_layer2 = zeros(1,num_hidden);
        for i=1:num_hidden
            k_sum = 0;
            for counter=1:width(temp_delta_layer3)
                k_sum = k_sum + beta2(counter,i+1)*temp_delta_layer3(counter);
            end
            temp_delta_layer2(i) = temp_a_layer2(i)*(1-temp_a_layer2(i))*k_sum;
        end               

        %% Step 4: update the weights using the error terms
        % since there are two sets of weights we must use two for loops
        for beta1_row=1:height(beta1)
            for beta1_col=1:width(beta1)
                % we use the if else conditional due to the bias term
                if (beta1_col == 1)
                    beta1(beta1_row,beta1_col) = beta1(beta1_row,beta1_col) + alpha*temp_delta_layer2(beta1_row)*1;
                else
                    beta1(beta1_row,beta1_col) = beta1(beta1_row,beta1_col) + alpha*temp_delta_layer2(beta1_row)*X(beta1_row,beta1_col-1);
                end
            end
        end
        
        for beta2_row=1:height(beta2)
            for beta2_col=1:width(beta2)
                if (beta2_col == 1)
                    beta2(beta2_row,beta2_col) = beta2(beta2_row,beta2_col) + alpha*temp_delta_layer3(beta2_row)*1;
                else
                    beta2(beta2_row,beta2_col) = beta2(beta2_row,beta2_col) + alpha*temp_delta_layer3(beta2_row)*temp_a_layer2(beta2_col-1);
                end
            end
        end
        
        %% calculate the cost per epoch
        Jd = Jd + (y(d)-temp_a_layer3(1))^2;
    end

    % If the current cost is greater than the previous cost we must stop
    % running the neural network to prevent overfitting
    J_history_old(epoch) = Jd/2;
    if(epoch > 2)
        if (J_history_old(epoch) > J_history_old(epoch-1)) 
                J_history = zeros(epoch,1); %
                for i=1:epoch
                    J_history(i) = J_history_old(i);
                end
            break;
        elseif(epoch == num_epochs)
            J_history = zeros(epoch,1); 
            for i=1:epoch
                J_history(i) = J_history_old(i);
            end
        end
    end

end