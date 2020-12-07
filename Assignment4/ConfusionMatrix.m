function [confusion_matrix] = ConfusionMatrix (t, a, class1, class2)
      n = size(t,1);
      count11 = 0;
      count12 = 0;
      count22 = 0;
      count21 = 0;
     
 for l = 1:n
       
                if t(l) == class1  && a(l) == class1
                    count11 = count11 + 1 ;
                
                elseif t(l) == class2 && a(l) == class2
                      count22 = count22 + 1 ; 
                      
                elseif  t(l) == class1 && a(l) == class2
                      count12 = count12 + 1 ;
                      
                elseif  t(l) == class2 && a(l) == class1
                      count21 = count21 + 1 ;
                end
 end
     
    
confusion_matrix = [ (count11/n)*100 (count12/n)*100 ; (count21/n)*100 (count22/n)*100  ]; %the parameters of the confusion matrix are expressed in percentage
   
end