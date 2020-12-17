function [subset1, subset2] = subsetCreator (data_set,digit1,digit2)
indexes1 = find(data_set(:,end)==digit1);
subset1 = data_set(indexes1,:);
%target1 = subset1(:,end);
subset1 = subset1(:,1:(end-1));

indexes2 = find(data_set(:,end)==digit2);
subset2 = data_set(indexes2,:);
%target2 = subset2(:,end);
subset2 = subset2(:,1:(end-1));

end