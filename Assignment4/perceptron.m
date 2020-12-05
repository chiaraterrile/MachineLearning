function [confusion_matrix] = perceptron(data_set,eta,k)

[n,g] = size(data_set); % n is the number of observations
d = g-1; %number of feautures
if (eta < 0)
    error('negative values of eta are not accepted')
end
x = data_set(:,1:d);
t = data_set(:,g);
%dobbiamo generare d valori compresi tra -1 e 1
w = rand(1,d)';
theta = 0.001; %threshold
count_error = 0;
errors = 1;
n_iter = 0;
err = 1;


if nargin == 3
    if k <2 || k>n
        error('invalid value of k')
    end
    %% case k = 2
    if k == 2 % split into one training set and one test set of equal size
        half = n/2 ;
        training_set = data_set(1:half, :);
        test_set = data_set(half+1 : end,:);
        x_training = training_set( :,1:d);
        t_training = training_set( :,g);
        x_test = test_set( :,1:d);
        t_test = test_set( :,g);
        
        
        while ( n_iter < 10000)  && (err > 0.1 )
            
            for j = 1:half
                
                r = x_training(j,:)*w ;
                a = sign(r);
                delta = 0.5*(t_training(j)-a);
                dw = eta *delta*x_training(j,:)';
                w = w + dw;
            end
            n_iter = n_iter +1;
            errors(n_iter) = abs(r -a);
            err = mean(errors);
            
            
        end
        r = x_test*w ;
        a = sign(r);
        confusion_matrix = confusionmat(t_test,a');
    end
    
    %% case k == n
    if k == n % leave-one-out cross validation
        
        for i = 1:n
            for j = 1: n
                Xtraining = x;
                Ttraining = t;
                %new training ad test sets
                Xtraining(j,:)=[];
                X{i} = Xtraining;
                TestSet{i} = x(j,:);
                
                Ttraining(j,:)=[];
                target{i} = Ttraining;
                target_TestSet{i} = t(j,:);
                
            end
        end
        
        for i = 1:n
            for j = 1: (n-1)
                while ( n_iter < 10000)  && (err > 0.1 )
                    r = X{i}(j,:)*w ;
                    a{i} = sign(r);
                    delta = 0.5*(X{i}(j)-a{i});
                    dw = eta *delta*X{i}(j,:)';
                    w = w + dw;
                    
                    
                    n_iter = n_iter +1;
                    errors(n_iter) = abs(r -a{i});
                    err = mean(errors);
                end
                r =  TestSet{i}*w ;
                a{i} = sign(r);
                confusion_matrix{i} = confusionmat(target_TestSet{i},a{i}');
            end
        end
    end
    
    
    %% case 2 < k < n
    
    
    if k>2 && k<n
        
        for i = 1 : k
            for j = 1:(n-round(n/k))
                Xtraining = x;
                Ttraining = t;
                %new training ad test sets
                Xtraining(j:(j+round(n/k)-1),:)=[];
                X{i} = Xtraining;
                
                Xtest = x(j:j+round(n/k)-1 ,:);
                TestSet{i} = Xtest;
                
                Ttraining(j:j+round(n/k)-1,:)=[];
                target{i} = Ttraining;
                target_TestSet{i} = t(j:j+round(n/k)-1,:);
                
            end
        end
        
        for i = 1:k
            for j = 1:(n-round(n/k))
                while ( n_iter < 10000)  && (err > 0.1 )
                    r = X{i}(j,:)*w ;
                    a{i} = sign(r);
                    delta = 0.5*(X{i}(j)-a{i});
                    dw = eta *delta*X{i}(j,:)';
                    w = w + dw;
                    
                    
                    n_iter = n_iter +1;
                    errors(n_iter) = abs(r -a{i});
                    err = mean(errors);
                end
                r =  TestSet{i}*w ;
                a{i} = sign(r);
                confusion_matrix{i} = confusionmat(target_TestSet{i},a{i}');
            end
        end
        
        
    end
end
end