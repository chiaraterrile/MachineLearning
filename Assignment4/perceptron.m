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
% newx = [];
% neww = [];
r = [];
a = [];
X = [];
count_error = 0;
errors = 1;
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
         
         while  ((n_iter < 10000)  && (errors ~= 0))
            
            for l = 1:half
                
                r = x_training(l,:)*w;
                a = sign(r);
                delta = 0.5*(t_training(l)-a);
                dw = eta *delta*x_training(l,:)';
                w = w + dw;
                %disp(w)
                newr = x_test * w;
                newa= sign(newr);
                
                if t_test(l) ~= newa
                    count_error = count_error + 1 ;
                end
                
            end
            
           
            n_iter = n_iter +1;
            errors = count_error/(n_iter*(n-1));
            %disp (errors)
            disp(n_iter);
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
           while  ((n_iter < 10000)  && (errors ~= 0))
            
            for l = 1:n-1
                
                r = X(l,:)*w;
                a = sign(r);
                delta = 0.5*(target(l)-a);
                dw = eta *delta*X(l,:)';
                w = w + dw;
                
                newr = TestSet * w;
                newa= sign(newr);
                if target_TestSet(1) ~= newa
                    count_error = count_error + 1 ;
                end
            end
            n_iter = n_iter +1;
            errors = count_error/(n_iter*(n-1));%SBAGLIATO N-1
            
            end
            
       %calcolo R(TestSet)
        end
     end  
        if k>2 && k<n % leave-one-out cross validation
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
           while  ((n_iter < 10000)  && (errors ~= 0))
            
            for l = 1:n-k
                
                r = X(l,:)*w;
                a = sign(r);
                delta = 0.5*(target(l)-a);
                dw = eta *delta*X(l,:)';
                w = w + dw;
                
                newr = TestSet * w;
                newa= sign(newr);
                for j = 1:size(target_TestSet,2)
                if target_TestSet(j) ~= newa
                    count_error = count_error + 1 ;
                end
                end
            end
            n_iter = n_iter +1;

            errors = count_error/(n_iter*(n-1));
            
            end
            
       %calcolo R(TestSet)
        end
        
        end
 
    
 
      count11 = 0;
      count12 = 0;
      count22 = 0;
      count21 = 0;
     
      for l = 1:n
                
                r = x(l,:)*w;
                a = sign(r);
               
                if t(l) == 1 && a == 1
                    count11 = count11 + 1 ;
                
                elseif t(l) == -1 && a == -1
                      count22 = count22 + 1 ; 
                      
                elseif  t(l) == 1 && a == -1
                      count12 = count12 + 1 ;
                      
                elseif  t(l) == -1 && a == 1
                      count21 = count21 + 1 ;
                end
      end
     
%       disp(count11/n)
%       disp(count12/n)
%       disp(count21/n)
%       disp(count22/n)
      
      confusion_matrix = [ count11/n count12/n ; count21/n count22/n  ];
    % confusion_matrix=[];
end