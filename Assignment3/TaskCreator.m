function [T_Training,T_Test] = TaskCreator(T_Training,T_Test,digit)
for i = 1: size(T_Training,1)
    if T_Training(i,1) == digit
        T_Training(i,1) = 1;
    else
        T_Training(i,1) = 0;
    end
end
for i = 1: size(T_Test,1)
    if T_Test(i,1) == digit
        T_Test(i,1) = 1;
    else
        T_Test(i,1) = 0;
    end
end