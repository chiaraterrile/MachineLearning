function []= NaiveBayesClassifierLaplace(TrainingSet,TestSet)

[n,g]=size(TrainingSet); 
d= g-1; %TrainingSet is a n x(d+1) matrix
[m,c]=size(TestSet); %TestSet is a m x c matrix
a = 1; %parameter for the smoothing

%% controlling the validity of the two data set

if(c<d)
    msg = 'The number of columns c is smaller than d';
    error(msg)
end
for i= 2: n 
    for j= 1:g
        if(TrainingSet(i,j)< 1)
            msg = 'The entry of the data set is < 1';
            error(msg)
        end
    end
end
for i= 2: m 
    for j= 1:c
        if(TestSet(i,j)< 1)
            msg = 'The entry of the data set is < 1';
            error(msg)
        end
    end
end

%% Naive Bayes classifier

% initialization of the counters 
counter_outlook_overcast_yes=0;
counter_outlook_rainy_yes=0;
counter_outlook_sunny_yes=0;
counter_temperature_hot_yes=0;
counter_temperature_cool_yes=0;
counter_temperature_mild_yes=0;
counter_humidity_high_yes =0;
counter_humidity_normal_yes =0;
counter_wind_present_yes = 0;
counter_wind_absent_yes=0;
counter_outlook_overcast_no=0;
counter_outlook_rainy_no=0;
counter_outlook_sunny_no=0;
counter_temperature_hot_no=0;
counter_temperature_cool_no=0;
counter_temperature_mild_no=0;
counter_humidity_high_no =0;
counter_humidity_normal_no =0;
counter_wind_present_no = 0;
counter_wind_absent_no=0;
counter_play_yes = 0;
counter_play_no = 0;

%target column 
for i= 2:n
    if(TrainingSet(i,g)==1)
        counter_play_yes = counter_play_yes+1 ;
        
    
    elseif(TrainingSet(i,g) == 2)
        counter_play_no = counter_play_no+1 ;
        
    end
   
end



P_play_yes = ( counter_play_yes+ a) /( n + (a*TrainingSet(1,g)));


%outlook column
for i= 2:n
    if(TrainingSet(i,g) == 1 && TrainingSet(i,1)==1)
        counter_outlook_overcast_yes = counter_outlook_overcast_yes+1 ;
        
    
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,1)==1)
        counter_outlook_overcast_no = counter_outlook_overcast_no+1;
        
    
    
    elseif(TrainingSet(i,g) == 1 && TrainingSet(i,1)==2)
        counter_outlook_rainy_yes = counter_outlook_rainy_yes+1 ;
        
   
    
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,1)==2)
        counter_outlook_rainy_no = counter_outlook_rainy_no+1;
    
    elseif(TrainingSet(i,g) == 1 && TrainingSet(i,1)==3)
        counter_outlook_sunny_yes = counter_outlook_sunny_yes+1 ;
        
    
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,1)==3)
        counter_outlook_sunny_no = counter_outlook_sunny_no+1 ;
        
    end
end

%probabilities outlook column

P_OvercastOutlookYes=( counter_outlook_overcast_yes + a) /( counter_play_yes + (a*TrainingSet(1,1)));
P_RainyOutlookYes = ( counter_outlook_rainy_yes + a) /( counter_play_yes + (a*TrainingSet(1,1)));
P_SunnyOutlookYes = ( counter_outlook_sunny_yes + a) /( counter_play_yes + (a*TrainingSet(1,1)));

tot_overcast= counter_outlook_overcast_yes + counter_outlook_overcast_no;
tot_rainy= counter_outlook_rainy_yes + counter_outlook_rainy_no;
tot_sunny= counter_outlook_sunny_yes + counter_outlook_sunny_no;


%temperature column
for i= 2:n
    if(TrainingSet(i,g) == 1 && TrainingSet(i,2)==1)
        counter_temperature_hot_yes =  counter_temperature_hot_yes+1 ;
        
   
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,2)==1)
        counter_temperature_hot_no =  counter_temperature_hot_no+1 ;
        
    
    elseif(TrainingSet(i,g) == 1 && TrainingSet(i,2)==2)
         counter_temperature_cool_yes = counter_temperature_cool_yes+1 ;
        
    
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,2)==2)
         counter_temperature_cool_no = counter_temperature_cool_no+1 ;
        
    
    elseif(TrainingSet(i,g) == 1 && TrainingSet(i,2)==3)
        counter_temperature_mild_yes = counter_temperature_mild_yes+1 ;
        
 
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,2)==3)
        counter_temperature_mild_no = counter_temperature_mild_no+1 ;
        
    end
end

%probabilities temperature column

P_HotTemperatureYes = ( counter_temperature_hot_yes + a) /( counter_play_yes + (a*TrainingSet(1,2)));
P_CoolTemperatureYes = ( counter_temperature_cool_yes + a) /( counter_play_yes + (a*TrainingSet(1,2)));
P_MildTemperatureYes = ( counter_temperature_mild_yes + a) /( counter_play_yes + (a*TrainingSet(1,2)));

tot_hot = counter_temperature_hot_yes + counter_temperature_hot_no;
tot_cool=counter_temperature_cool_yes+counter_temperature_cool_no;
tot_mild=counter_temperature_mild_yes+counter_temperature_mild_no;

%humidity column
for i= 2:n
    if(TrainingSet(i,g) == 1 && TrainingSet(i,3)==1)
        counter_humidity_high_yes = counter_humidity_high_yes+1 ;
        
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,3)==1)
        counter_humidity_high_no = counter_humidity_high_no+1 ;
        
   
    elseif(TrainingSet(i,g) == 1 && TrainingSet(i,3)==2)
        counter_humidity_normal_yes = counter_humidity_normal_yes+1 ;
        
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,3)==2)
        counter_humidity_normal_no = counter_humidity_normal_no+1 ;
        
    end
   
end
%probabilities humidity column
P_HighHumidityYes = ( counter_humidity_high_yes + a) /( counter_play_yes + (a*TrainingSet(1,3)));
P_NormalHumidityYes = ( counter_humidity_normal_yes + a) /( counter_play_yes + (a*TrainingSet(1,3)));

tot_high = counter_humidity_high_yes+counter_humidity_high_no;
tot_normal = counter_humidity_normal_yes +counter_humidity_normal_no;

%windy column
for i= 2:n
    if(TrainingSet(i,g) == 1 && TrainingSet(i,4)==1)
        counter_wind_absent_yes = counter_wind_absent_yes+1 ;
       
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,4)==1)
        counter_wind_absent_no = counter_wind_absent_no+1 ;
        
   
    elseif(TrainingSet(i,g) == 1 && TrainingSet(i,4)==2)
        counter_wind_present_yes = counter_wind_present_yes+1 ;
        
    elseif(TrainingSet(i,g) == 2 && TrainingSet(i,4)==2)
        counter_wind_present_no = counter_wind_present_no+1 ;
    end
   
end

%probabilities windy column

P_WindAbsentYes = ( counter_wind_absent_yes + a) /( counter_play_yes + (a*TrainingSet(1,4)));
P_WindPresentYes = ( counter_wind_present_yes + a) /( counter_play_yes + (a*TrainingSet(1,4)));

tot_wind_present= counter_wind_present_yes+counter_wind_present_no;
tot_wind_absent = counter_wind_absent_yes+counter_wind_absent_no;

%classification of the TestSet
num= [1 1 1 1];
den=[1 1 1 1];

for i = 2:m 
    if(TestSet(i,1)==1) %overcast
        num(1,i-1)= P_OvercastOutlookYes*num(1,i-1);
        den(1,i-1)= ((tot_overcast+a)/(n+a*TestSet(1,1)))*den(1,i-1);
    elseif(TestSet(i,1)==2)%rainy
        num(1,i-1)= P_RainyOutlookYes*num(1,i-1);
        den(1,i-1)= ((tot_rainy+a)/(n+a*TestSet(1,1)))*den(1,i-1);
    elseif(TestSet(i,1)==3)%sunny
        num(1,i-1)= P_SunnyOutlookYes*num(1,i-1);
        den(1,i-1)= ((tot_sunny+a)/(n+a*TestSet(1,1)))*den(1,i-1);
    else
        disp('Invalid attribute in the TestSet');
    end
    if(TestSet(i,2)==1) %hot
        num(1,i-1) = P_HotTemperatureYes*num(1,i-1);
        den(1,i-1) = ((tot_hot+a)/(n+a*TestSet(1,2)))*den(1,i-1);
    elseif(TestSet(i,2)==2)%cool
        num(1,i-1)= P_CoolTemperatureYes*num(1,i-1);
        den(1,i-1)= ((tot_cool+a)/(n+a*TestSet(1,2)))*den(1,i-1);
    elseif(TestSet(i,2)==3)%mild
        num(1,i-1)= P_MildTemperatureYes*num(1,i-1);
        den(1,i-1)= ((tot_mild+a)/(n+a*TestSet(1,2)))*den(1,i-1);
    else
        disp('Invalid attribute in the TestSet');

    end
    
    if(TestSet(i,3)==1) %high
        num(1,i-1) = P_HighHumidityYes*num(1,i-1);
        den(1,i-1) = ((tot_high+a)/(n+a*TestSet(1,3)))*den(1,i-1);
    elseif(TestSet(i,3)==2)%normal
        num(1,i-1)= P_NormalHumidityYes*num(1,i-1);
        den(1,i-1)= ((tot_normal+a)/(n+a*TestSet(1,3)))*den(1,i-1);
    else
        disp('Invalid attribute in the TestSet');

    end  
     if(TestSet(i,4)==1) %wind absent
        num(1,i-1) = P_WindAbsentYes*num(1,i-1);
        den(1,i-1) = ((tot_wind_absent+a)/(n+a*TestSet(1,4)))*den(1,i-1);
     elseif(TestSet(i,4)==2)%wind present
        num(1,i-1)= P_WindPresentYes*num(1,i-1);
        den(1,i-1)= ((tot_wind_present+a)/(n+a*TestSet(1,4)))*den(1,i-1);
     else
        disp('Invalid attribute in the TestSet');

    end
    
end

num = P_play_yes.*num;

P_yes_1line = num(1,1)/den(1,1);
P_yes_2line = num(1,2)/den(1,2);
P_yes_3line = num(1,3)/den(1,3);
P_yes_4line = num(1,4)/den(1,4);
P_yes = [P_yes_1line,P_yes_2line,P_yes_3line,P_yes_4line];

%% results and error rate

disp('NaiveBayesClassifier using Laplace smoothing');

%obtained classification
[rYes,cYes] = size(P_yes);

for i=1:cYes
    if(P_yes(1,i)>0.5)
            fprintf('The classification for pattern %d of the Test Set is: YOU CAN PLAY TENNIS\n', i);
    else
            fprintf('The classification for pattern %d of the Test Set is: YOU CAN NOT PLAY TENNIS\n', i);

    end
end
    

%error rate computation in case the target is present
if(c == g)
errorCounter=0;
    for i = 2:m
        if(TestSet(i,5)==1)
            fprintf('The target for pattern %d of the Test Set is: YES\n', i);
            if(P_yes(1,(i-1))<0.5)
                 errorCounter= errorCounter+1;
            end
        else
            fprintf('The target for pattern %d of the Test Set is: NO\n', i);
            if(P_yes(1,(i-1))>0.5)
                 errorCounter= errorCounter+1;
            end

        end
    end

    
    errorRate = errorCounter/(m-1);
    fprintf('The error rate is %f\n', errorRate);
end



