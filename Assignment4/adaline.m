function [confusion_matrix,n_iter] = adaline(data_set,eta,k,class1,class2)

[n,g] = size(data_set); % n is the number of observations
d = g-1; %number of feautures

if (eta < 0)
    error('negative values of eta are not accepted')
end

if k <2 || k>n
    error('invalid value of k')
end

x = data_set(:,1:d); % data set
t = data_set(:,g); % target set

w = rand(1,d)';

count_err = 0;
n_iter = 0;
err = 1;
meanMatrix = 0;
min_err = 1;
%% case k = 2

    if k == 2 % split into one training set and one test set of equal size
        half =floor( n/2) ;
        training_set = data_set(1:half, :);
        test_set = data_set(half+1 : 2*half,:);
        x_training = training_set( :,1:d);
        t_training = training_set( :,g);
        x_test = test_set( :,1:d);
        t_test = test_set( :,g);
        
        while  (n_iter < 10000)  && (min_err > 0.1)
            
            for j = 1:half
                
                r = x_training(j,:)*w;
                a = sign(r);
                delta = (t_training(j)-r);
                dw = eta *delta*x_training(j,:)';
                w = w + dw;
                min_err = immse(t_training(j), r');
            end
            n_iter = n_iter +1;
            if t_training(j) ~= a
                count_err = count_err +1 ;
            end
            err = count_err / (n_iter*(half));
     
        end
        r = x_test*w ;
        a = sign(r);
        confusion_matrix = ConfusionMatrix(t_test,a', class1, class2);
  
    end
    
%% case k = n

    if k == n % leave-one-out cross validation
        
        for i = 1:n
            X = x;
            target = t;
            %new training ad test sets
            X(i,:)=[];
            TestSet = x(i,:);
            
            target(i,:)=[];
            target_TestSet = t(i,:);
            while  n_iter < 10000 && (min_err > 0.1)
                
                for j = 1:n-1
                    
                    r = X(j,:)*w;
                    a = sign(r);
                    delta = (target(j)-r);
                    dw = eta *delta*X(j,:)';
                    w = w + dw;
                    min_err = immse(target(j), r');
                end
                n_iter = n_iter +1;
                if target(j)~= a
                    count_err = count_err +1 ;
                end
                err = count_err/(n_iter*(n-1));
            end
            r = TestSet*w ;
            a = sign(r);
            confusion_matrix{i} = ConfusionMatrix(target_TestSet,a', class1, class2);
        end
        
        for i = 1 : n
            
            meanMatrix = (meanMatrix + confusion_matrix{i});
        end
        confusion_matrix = meanMatrix/n;
        
        
    end
    
%% case 2 < k < n 
    
    if k >2  && k<n % leave-one-out cross validation
        for i = 1:k
            Xtraining = x;
            Ttraining = t;
            %new training ad test sets
            Xtraining(i:(i+round(n/k)-1),:)=[];
            Xtest = x(i:i+round(n/k)-1 ,:);
            
            Ttraining(i:i+round(n/k)-1,:)=[];
            target_TestSet = t(i:i+round(n/k)-1,:);
            
            while  (n_iter < 10000)   && (min_err > 0.1)
                
                for j = 1:(n-round(n/k))
                    
                    r = Xtraining(j,:)*w;
                    a = sign(r);
                    delta = (Ttraining(j)-r);
                    dw = eta *delta*Xtraining(j,:)';
                    w = w + dw;
                    min_err = immse(Ttraining(j), r');
                end
                n_iter = n_iter +1;
                if Ttraining(j) ~= a
                    count_err = count_err +1;
                end
                err = count_err/(n_iter*(n-round(n/k)));

            end
            r = Xtest*w ;
            a = sign(r);
            confusion_matrix{i} = ConfusionMatrix(target_TestSet,a', class1, class2);
        end
       
        for i = 1 : k
            meanMatrix = (meanMatrix + confusion_matrix{i});
        end
        confusion_matrix = meanMatrix/k;
        
        
    end

end
