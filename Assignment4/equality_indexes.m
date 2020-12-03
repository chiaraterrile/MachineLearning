function [accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix)

c00 = confusion_matrix(1,1);
c01 = confusion_matrix(1,2);
c10 = confusion_matrix(2,1);
c11 = confusion_matrix(2,2);

accuracy = (c00 + c11)/100;
error_rate = 1 - accuracy ;

sensitivity = c11 / (c11 +c10);
specificity = c00 / (c00 + c01);

precision = c11/(c11 + c01);

end