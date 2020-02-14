close all
clc

length_units = 6;
max_length = 30;
max_units = max_length/length_units;
tls_lanes = cell([1,1000]);
tls_ind =zeros(1,1000);

net_struct = xml2struct('clemson.net.xml');

nj = size(net_struct.net.junction,2);
ntl = size(net_struct.net.tlLogic,2);
signal_max_green = zeros(ntl,10);
signal_PT = zeros(ntl,1);
t_id = cell([1,ntl]);

%%%%%%%%%%%%%%%%%%%%%%%Get Signal TImes

for i=1:ntl
    t_id{i} = net_struct.net.tlLogic{i}.Attributes.id;
    np = size(net_struct.net.tlLogic{i}.phase,2);
    signal_PT(i) = str2double(net_struct.net.tlLogic{i}.param{1}.Attributes.value);
    for j=1:np
        signal_max_green(i,j) = str2double(net_struct.net.tlLogic{i}.phase{j}.Attributes.maxDur);
    end
end

%%%%%%%%%%%%%%%%%%%%%%Get Signal TImes End

%%%%%%%%%%%%%%%%%%%%%%Get TLS Lanes

count=1;
for i=1:nj
    if (strcmp(net_struct.net.junction{i}.Attributes.type,'traffic_light'))
        j_id = net_struct.net.junction{i}.Attributes.id;
        tind = find(strcmp(t_id,j_id)==1);
        if(isempty(tind))
            tind=ntl;
        end
        j_lanes = strsplit(net_struct.net.junction{i}.Attributes.incLanes);
        nl = size(j_lanes,2);
        tls_lanes(count:count+nl-1) = j_lanes;
        tls_ind(count:count+nl-1) = tind;
        count = count+nl;
    end
end

tls_count = count-1;
tls_lanes = tls_lanes(1:tls_count);
tls_ind = tls_ind(1:tls_count);

%%%%%%%%%%%%%%%%%Get TLS Lanes End

%%%%%%%%%%%%%%%%%%Get TLS Length and Speed

ne = size(net_struct.net.edge,2);
count = 1;
tls_lengths = zeros(1,tls_count);
tls_speeds = zeros(1,tls_count);

for i=1:ne
    nle = size(net_struct.net.edge{i}.lane,2);
    if (nle==1)
        lane_lengths(count) = str2double(net_struct.net.edge{i}.lane.Attributes.length);
        lane_speeds(count) = str2double(net_struct.net.edge{i}.lane.Attributes.speed);
        if (strfind(net_struct.net.edge{i}.lane.Attributes.id,':'))
            temp = strsplit(net_struct.net.edge{i}.lane.Attributes.id,':');
            lanes(count) = temp(2);
            count = count+1;
        else
            temp = net_struct.net.edge{i}.lane.Attributes.id;
            lanes(count) = cellstr(temp);
            count = count+1;
        end
    else
        for j=1:nle
            lane_lengths(count) = str2double(net_struct.net.edge{i}.lane{j}.Attributes.length);
            lane_speeds(count) = str2double(net_struct.net.edge{i}.lane{j}.Attributes.speed);
            if (strfind(net_struct.net.edge{i}.lane{j}.Attributes.id,':'))
                temp = strsplit(net_struct.net.edge{i}.lane{j}.Attributes.id,':');
                lanes(count) = temp(2);
                count = count+1;
            else
                temp = net_struct.net.edge{i}.lane{j}.Attributes.id;
                lanes(count) = cellstr(temp);
                count = count+1;
            end
        end
    end
end

for i=1:tls_count
    index(i) = find(strcmp(lanes, tls_lanes(i))==1);
    tls_lengths(i) = lane_lengths(index(i));
    tls_speeds(i) = lane_speeds(index(i));
end

%%%%%%%%%%%%%%%%Get TLS Length and Speed End

end_pos = tls_lengths - 0.1;
start_pos = zeros(1,numel(end_pos));

clear index lane_lengths lane_speeds lanes

%Assumption

units = [2 4 6];
no_units = numel(units);

p1 = [20 35 50];
p2 = p1;
no_green = numel(p1);

add_struct = xml2struct('additionalFile.xml');


%Assumption end


%Simulation run


for k=1:tls_count
    struct2xml(net_struct,'clemson.net.xml');
    for l=1:no_green
        for m=1:no_green
            temp_struct = net_struct;
            temp_struct.net.tlLogic{tls_ind(k)}.phase{1}.Attributes.maxDur=num2str(p1(l));
            temp_struct.net.tlLogic{tls_ind(k)}.phase{5}.Attributes.maxDur=num2str(p2(m));
            
            for n=1:no_units
                start_pos = end_pos(k) - units(n)*length_units;
                add_struct.additional.chargingStation.Attributes.lane = tls_lanes{k};
                add_struct.additional.chargingStation.Attributes.endPos = num2str(end_pos(k));
                add_struct.additional.chargingStation.Attributes.startPos = num2str(start_pos);
                
                cd ('/home/mdzadik/SUMO_cluster/');
                mkdir(strcat('case_', num2str(k-1)));
                cd ('/home/mdzadik/SUMO_cluster/clemson');
                fold = strcat('/home/mdzadik/SUMO_cluster/case_', num2str(k-1));
                copyfile('clemson.sumocfg', fold);
                copyfile('clemson.rou.xml', fold);
                copyfile('xml2struct.m', fold);
                copyfile('struct2xml.m', fold);
                cd (fold);
                struct2xml(temp_struct,'clemson.net.xml');
                clear temp_struct
                struct2xml(add_struct,'additionalFile.xml');
                cd ('/home/mdzadik/SUMO_cluster/cross3ltl');
                dlmwrite('input_test.txt',fold,'-append','delimiter','');
                
            end
        end
    end
end

%Optimization run

% nvars = 3*no_lanes;
% lb=[0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 15 15 15 15 15 15 15 15 15 15 15 15];
% ub=[1 1 1 1 1 1 1 1 1 1 1 1 5 5 5 5 5 5 5 5 5 5 5 5 42 42 27 27 42 42 27 27 27 27 27 27];
% IntCon=1:nvars;
% f=@fitness_fcn;
% con=@constraint_fcn;
%
% [x fval,exitflag,output,population,scores] = ga(f,nvars,[],[],[],[],lb,ub,con,IntCon);

%Optimization run ends







