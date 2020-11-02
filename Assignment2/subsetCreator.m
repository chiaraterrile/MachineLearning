function [subset_5,subset_95] = subsetCreator(set)
[r,c] = size(set);
r_5 = round(r *0.05);
rand_number =randi([1, (r - r_5)]);
fprintf('random bla bla is %d \n', rand_number);
subset_5 = set(rand_number: (rand_number + r_5-1), :);
subset_95 = [(set(1:(rand_number -1) , :)); (set ((rand_number + r_5) : r, : ))] ;
end