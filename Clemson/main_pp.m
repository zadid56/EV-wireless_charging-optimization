close all
clc

input = '/home/mdzadik/SUMO_cluster/';
cd (input);

battery_struct = xml2struct('battery.xml');
step = numel(battery_struct.battery_dash_export.timestep);
for i=1:step
    if (isfield(battery_struct.battery_dash_export.timestep{i},'vehicle')==1)
        n = size(battery_struct.battery_dash_export.timestep{i}.vehicle,2);
        for j=1:n
            if (n==1)
                EC = EC + str2double(battery_struct.battery_dash_export.timestep{i}.vehicle.Attributes.energyCharged);
            else
                EC = EC + str2double(battery_struct.battery_dash_export.timestep{i}.vehicle{j}.Attributes.energyCharged);
            end
        end
    end
end

clear battery_struct

delay_struct = xml2struct('lanedump.xml');
nde = numel(delay_struct.meandata.interval.edge);

for i=1:nde
    ndl = numel(delay_struct.meandata.interval.edge{i}.lane);
    if (ndl==1)
        if(isfield(delay_struct.meandata.interval.edge{i}.lane.Attributes,'waitingTime')==1)
            if(strcmp(delay_struct.meandata.interval.edge{i}.lane.Attributes.id,lanes(k))==1)
                waittime = str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.waitingTime);
                v_total = str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.left)+str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.arrived)+str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.laneChangedFrom);
                av_delay = round(waittime/(v_total+eps));
            end
        end
    else
        for j=1:ndl
            if(isfield(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes,'waitingTime')==1)
                if(strcmp(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.id,lanes(k))==1)
                    waittime = str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.waitingTime);
                    v_total = str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.left)+str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.arrived)+str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.laneChangedFrom);
                    av_delay = round(waittime/(v_total+eps));
                end
            end
        end
    end
end

clear delay_struct

queue_struct = xml2struct('queue.xml');
nt = size(queue_struct.queue_dash_export.data,2);
q_length = zeros(1,nt);

for i=1:nt
    if (isfield(queue_struct.queue_dash_export.data{i}.lanes,'lane')==1)
        nq = size(queue_struct.queue_dash_export.data{i}.lanes.lane,2);
        if (nq==1)
            if(strcmp(queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.id,lanes(k))==1)
                q_length(i) = str2double(queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.queueing_length);
            end
        else
            for j=1:nq
                if(strcmp(queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.id,lanes(k))==1)
                    q_length(i) = str2double(queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.queueing_length);
                end
            end
        end
    end
end

clear queue_struct

q_length = round((q_length+1.5)/7.5);
v_ql = sum(peaksbetween(q_length'));
FVS = v_ql/(v_total+eps);
FVS(FVS>1)=1;
qlc=round((v_ql*90)/nt);
speed = speeds(k);

if ((qlc<=7 && speed<=37) || qlc>=20 && speed>45)
    CF = 5;
end
if ((qlc>=8 && qlc<=19 && speed<=37) || qlc>=20 && speed>37 && speed<=45)
    CF = 2;
end
if ((qlc>=8 && qlc<=19 && speed>45) || qlc<=7 && speed>37 && speed<=45)
    CF = 7;
end
if (qlc>=20 && speed<=37)
    CF = -1;
end
if (qlc>=8 && qlc<=19 && speed>37 && speed<=45)
    CF = 4;
end
if (qlc<=7 && speed>45)
    CF = 9;
end

DL = round(av_delay+CF.*FVS);
if (DL>80)
    DL = 80;
end

save('EC.mat','EC');
save('DL.mat','DL');








        
        