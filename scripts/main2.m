close all
clc

EC = csvread('EC.csv');
DL = csvread('DL.csv');
tls_ind = csvread('tls_ind.csv');
x = zeros(100,1);
y = zeros(100,1);
b = [3.00	50	50
2.04	43	50
2.00	36	35
1.00	50	50
2.00	46	32
2.00	20	33
1.00	20	20
1.00	34	50
2.00	20	20
1.00	35	50
3.00	20	20
1.78	20	20
1.00	50	48
3.00	50	20
3.00	20	50
1.00	50	30
1.00	38	38
3.00	20	20
1.00	50	37
1.41	50	50];

for i=1:100
    k = tls_ind(i);
    x(i) = energycharged(EC,i,b(k,1),b(k,2),b(k,3),2);
    y(i) = control_delay(DL,i,b(k,1),b(k,2),b(k,3));
end


