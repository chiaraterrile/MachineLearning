function [w,x]= oneDimRegression(set,flagInterception)
    [r,c] = size(set);
    x = set(:,1);
    t = set(:,2);
if (flagInterception == 0) %without interception
    
    num = 0;
    den = 0 ;
for i = 1 :r
    num = num + x(i) * t(i);
    den =den + x(i)^2;
end
w = num/den;  
else if (flagInterception == 1) %with interception
    
    num_1 = 0;
    den_1 = 0 ;
    x_med = 0;
    t_med = 0;
    for i = 1 :r
        x_med = x_med + x(i);
        t_med = t_med + t(i);
    end
    x_med = x_med/r;
    t_med = t_med/r;
    for i = 1 :r
            num_1 = num_1 +((x(i)-x_med)*(t(i)-t_med));
            den_1 = den_1 + (x(i)-x_med)^2;
    end
    w1 = num_1/den_1;
    w0 = t_med - w1*x_med;
    w = [ w0 w1];
end

end