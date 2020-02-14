close all
clc

no_cases = 459;
no_intersections = 17;
EC = zeros(no_cases,5);
DL = zeros(no_cases,5);

intersections = 1:no_intersections;
p1 = [20 35 50];
p2 = p1;
pt = [1 2 3];
WCU = [2 4 6];

no_var = no_cases/no_intersections;

for i=0:(no_cases-1)
    k = floor(i/no_var)+1;
    base = dec2base(mod(i,no_var),3,3);
    l = str2double(base(1))+1;
    m = str2double(base(2))+1;
    n = str2double(base(3))+1;
    
    EC(i+1,1) = intersections(k);
    EC(i+1,2) = pt(l);
    EC(i+1,3) = p1(m);
    EC(i+1,4) = p2(n);
    
    DL(i+1,1) = intersections(k);
    DL(i+1,2) = pt(l);
    DL(i+1,3) = p1(m);
    DL(i+1,4) = p2(n);
    
    fold = strcat('/scratch3/mdzadik/cases/case_', num2str(i));
    cd(fold);
    
    temp = load('EC.mat');
    temp = temp.EC;
    EC(i+1,5) = temp;
    
    temp2 = load('CD.mat');
    temp2 = temp2.CD;
    DL(i+1,5) = temp2;
end

cd('/home/mdzadik/SUMO_cluster/sioux');

save('EC.mat','EC');
save('DL.mat','DL');


    
    
    
    
    
    
    