function [T] = TaskCreator(T,digit)
for i = 1: size(T,1)
    if T(i,1) == digit
        T(i,1) = 1;
    else
        T(i,1) = -1;
    end
end

end