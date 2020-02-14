function y = energycharged(EC,lane,GT,g1,g2,WCU)

units = [2 4 6];
p1 = [20 35 50];
p2 = p1;
pt = [1 2 3];

temp2 = combvec(p2,p1,pt);
temp2 = temp2';
temp2 = fliplr(temp2);

if(isempty(intersect(units,WCU))==0)
    a = find(WCU==units);
    lane_ind = (lane-1)*81+a;
    F = scatteredInterpolant(temp2,EC(lane_ind:3:lane_ind+78));
    y = F(GT,g1,g2);
else
    y = 0;
end

end