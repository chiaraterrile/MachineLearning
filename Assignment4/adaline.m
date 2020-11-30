function [confusion_matrix] = adaline(data_set,eta,k)

% NB : per le modifiche vedi il primo algoritmo (caso k == 2)


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
% newx = [];
% neww = [];
r = [];
a = [];
X = [];
counter_error = 0;
error = 1;
n_iter = 0;

 % bisogna capire cosa fare con a e r una volta finito il for e cosa
 % centrano con la confusion matrix
 if nargin == 3
     if k <2 || k>n
         error('invalid value of k')
     end
     
     if k == 2 % split into one training set and one test set of equal size
         half =floor( n/2) ;
         training_set = data_set(1:half, :);
         test_set = data_set(half+1 : 2*half,:);
         x_training = training_set( :,1:d);
         t_training = training_set( :,g);
         x_test = test_set( :,1:d);
         t_test = test_set( :,g);
         
         while error ~= 0 || n_iter < 100000
            
            for l = 1:half
                
                r = x_training(l,:)*w;
                a = sign(r);
                delta = (t_training(l)-r); % qui è dove ho modificato ed è uguale per tutti i casi
                dw = eta *delta*x_training(l,:)';
                w = w + dw;
                
                newr = x_test * w;
                newa= sign(newr);
                if x_test(l) ~= newa
                    count_error = count_error + 1 ;
                end
            end
            error = count_error/(n-1);
            n_iter = n_iter +1;
            
            end
     end
     
     if k == n % leave-one-out cross validation
         %slides pag 16 (blocco6)
         %tolgo sempre una riga a ogni giro
        for i = 1:n
            X = x;
            target = t;
            %new training ad test sets
            X(i,:)=[];
            TestSet = x(i,:);
            
            target(i,:)=[];
            target_TestSet = t(i,:);
            while error ~= 0 || n_iter < 100000
            
            for l = 1:n-1
                
                r = X(l,:)*w;
                a = sign(r);
                delta = target(l)-r;
                dw = eta *delta*X(l,:)';
                w = w + dw;
                
                newr = TestSet * w;
                newa= sign(newr);
                if target_TestSet(l) ~= newa
                    count_error = count_error + 1 ;
                end
            end
            error = count_error/(n-1);
            n_iter = n_iter +1;
            
            end
            
       %calcolo R(TestSet)
        end
        
        if 2 < k < n % leave-one-out cross validation
         %slides pag 16 (blocco6)
         %tolgo sempre una riga a ogni giro
        for i = 1:n
            X = x;
            target = t;
            %new training ad test sets
            X(i:k,:)=[];
            TestSet = x(i:k,:);
            
            target(i:k,:)=[];
            target_TestSet = t(i:k,:);
            while error ~= 0 || n_iter < 100000
            
            for l = 1:n-k
                
                r = X(l,:)*w;
                a = sign(r);
                delta = target(l)- r;
                dw = eta *delta*X(l,:)';
                w = w + dw;
                
                newr = TestSet * w;
                newa= sign(newr);
                if target_TestSet(l) ~= newa
                    count_error = count_error + 1 ;
                end
            end
            error = count_error/(n-k);
            n_iter = n_iter +1;
            
            end
            
       %calcolo R(TestSet)
        end
        
 end
 
 end   
end