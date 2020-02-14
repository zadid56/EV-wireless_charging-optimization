function y = control_delay(DL,lane,GT,g1,g2)

p1 = [20 35 50];
p2 = p1;
pt = [1 2 3];

temp2 = combvec(p2,p1,pt);
temp2 = temp2';
temp2 = fliplr(temp2);
lane_ind = (lane-1)*27+1;
F = scatteredInterpolant(temp2,DL(lane_ind:lane_ind+26));
y = F(GT,g1,g2);

end


