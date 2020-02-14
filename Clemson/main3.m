clear all
close all
clc

length_units = 6;
max_length = 5*length_units;
tls_lanes = cell([1,1000]);
tls_ind =zeros(1,1000);
tls_lengths = zeros(1,1000);
lanes_delay = cell([1,1000]);


net_struct = xml2struct('clemson.net.xml');

nj = size(net_struct.net.junction,2);
ntl = size(net_struct.net.tlLogic,2);
signal_times = zeros(ntl,10);
t_id = cell([1,ntl]);

for i=1:ntl
    t_id{i} = net_struct.net.tlLogic{i}.Attributes.id;
    np = size(net_struct.net.tlLogic{i}.phase,2);
    for j=1:np
        signal_times(i,j) = str2double(net_struct.net.tlLogic{i}.phase{j}.Attributes.duration);
    end
end

count=1;
for i=1:nj
    if (strcmp(net_struct.net.junction{i}.Attributes.type,'traffic_light'));
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


ne = size(net_struct.net.edge,2);
count = 1;

for i=1:ne
    nle = size(net_struct.net.edge{i}.lane,2);
    if (nle==1)
        lane_lengths(count) = str2double(net_struct.net.edge{i}.lane.Attributes.length);
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
end

tls_lengths = tls_lengths(1:tls_count);

end_pos = tls_lengths - 0.1;
start_pos = zeros(1,numel(end_pos));

clear index lane_lengths lanes

%queue calc

av_delay = zeros(1,numel(end_pos));
delay_struct = xml2struct('lanedump.xml');
nde = numel(delay_struct.meandata.interval.edge);
dcount = 1;

for i=1:nde
    ndl = numel(delay_struct.meandata.interval.edge{i}.lane);
    if (ndl==1)
        av_delay(dcount) = round(str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.waitingTime)/(str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.left)+eps));
        lanes_delay{dcount} = delay_struct.meandata.interval.edge{i}.lane.Attributes.id;
        dcount=dcount+1;
    else
        for j=1:ndl
            av_delay(dcount) = round(str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.waitingTime)/(str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.left)+eps));
            lanes_delay(dcount) = delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.id;
            dcount=dcount+1;
        end
    end
end
            
dcount = dcount-1;
av_delay = av_delay(1:dcount);
lanes_delay = lanes_delay(1:dcount);


%queue calc

% avq_length = zeros(1,numel(end_pos));
% queue_struct = xml2struct('queue.xml');
% qcount = numel(queue_struct.queue_dash_export.data);
% 
% for i=1:qcount
%     if(isfield(queue_struct.queue_dash_export.data{i}.lanes,'lane')==1)
%         if(numel(queue_struct.queue_dash_export.data{i}.lanes.lane)==1)
%             avq = mean(strcmp(tls_lanes,queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.id));
%             if (avq>0)
%                 indq = find((strcmp(tls_lanes,queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.id))==1);
%                 avq_length(indq) = avq_length(indq)+str2double(queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.queueing_length);
%             end
%         else
%             for j=1:numel(queue_struct.queue_dash_export.data{i}.lanes.lane)
%                 avq = mean(strcmp(tls_lanes,queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.id));
%                 if (avq>0)
%                     indq = find((strcmp(tls_lanes,queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.id))==1);
%                     avq_length(indq) = avq_length(indq)+str2double(queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.queueing_length);
%                 end
%             end
%         end
%     end
% end
% 
% no_lanes = 8;
% avq_length = avq_length/qcount;
% avl_ind = find(end_pos>max_length);
% 
% temp_lanes = tls_lanes;
% 
% tls_lanes_filt = tls_lanes(avl_ind);
% tls_ind_filt = tls_ind(avl_ind);
% end_pos_filt = end_pos(avl_ind);
% 
% tls_lanes = tls_lanes_filt;
% tls_ind = tls_ind_filt;
% end_pos = end_pos_filt;
% 
% avl_length = avq_length(avl_ind);
% [sortt sorti] = sort(avl_length,2,'descend');
% filt = sorti(1:no_lanes);
% % avq_ind = find(avq_length>mean(avq_length));
% % avl_ind = find(end_pos>max_length);
% % filt = intersect(avq_ind,avl_ind);
% 
% tls_lanes_filt = tls_lanes(filt);
% tls_ind_filt = tls_ind(filt);
% end_pos_filt = end_pos(filt);
% 
% tls_lanes = tls_lanes_filt;
% tls_ind = tls_ind_filt;
% end_pos = end_pos_filt;
% final_lanes = numel(end_pos);

%queue calc end

%optimization run

% units = [1 3 5];
% cycle = signal_times(:,1)+signal_times(:,5);
% cycle = cycle';
% minG = 15*ones(1,numel(cycle));
% maxG = cycle - minG;
% 
% p1 = [minG' signal_times(:,1) maxG']; 
% p2 = [maxG' signal_times(:,5) minG']; 
 
% add_struct = xml2struct('additionalFile.xml');
% EC = zeros(final_lanes,3,3);
% TT = zeros(final_lanes,3,3);
% 
% nvars = 18;
% lb=[0 0 0 0 0 0 1 1 1 1 1 1 15 15 15 15 15 15];
% ub=[1 1 1 1 1 1 5 5 5 5 5 5 42 42 42 42 42 42];
% IntCon=1:18;
% f=@fitness_fcn2;
% con=@constraint_fcn2;
% 
% [x fval,exitflag,output,population,scores] = ga(f,nvars,[],[],[],[],lb,ub,con,IntCon);

%optimization run ends


%simulation run

% for k=6:final_lanes
%     for l=1:3
%         for m=1:3
%             
%             start_pos = end_pos(k) - units(m)*length_units;
%         
%     add_struct.additional.chargingStation.Attributes.lane = tls_lanes{k};
%     add_struct.additional.chargingStation.Attributes.endPos = num2str(end_pos(k));
%     add_struct.additional.chargingStation.Attributes.startPos = num2str(start_pos);
% 
% struct2xml(add_struct,'additionalFile.xml');
% 
% temp_struct = net_struct;
% 
% temp_struct.net.tlLogic{tls_ind(k)}.phase{1}.Attributes.duration=num2str(p1(tls_ind(k),l));
% temp_struct.net.tlLogic{tls_ind(k)}.phase{5}.Attributes.duration=num2str(p2(tls_ind(k),l));
% 
% struct2xml(temp_struct,'clemson.net.xml');
% 
% clear temp_struct
% 
% import traci.constants
% 
% system(['sumo -c ' 'C:\Users\mdzadik\Dropbox\My_Research\Smart_Cities\My_Work\Simulation\Clemson\clemson.sumocfg&']);
% 
% % Initialize TraCI
% traci.init(8813);
% step=0;
% 
% while traci.simulation.getMinExpectedNumber()>0
%     traci.simulationStep();
%     step=step+1;
% end
% 
% pause(5);
% 
% traci.close();
% 
% system('taskkill /F /IM cmd.exe');
% 
% pause(5);
% 
% battery_struct = xml2struct('battery.xml');
% 
% for i=1:step
%     if (isfield(battery_struct.battery_dash_export.timestep{i},'vehicle')==1)
%         n = size(battery_struct.battery_dash_export.timestep{i}.vehicle,2);
%         for j=1:n
%             if (n==1)
%                 EC(k,l,m) = EC(k,l,m) + str2double(battery_struct.battery_dash_export.timestep{i}.vehicle.Attributes.energyCharged);
%             else
%                 EC(k,l,m) = EC(k,l,m) + str2double(battery_struct.battery_dash_export.timestep{i}.vehicle{j}.Attributes.energyCharged);
%             end
%         end
%     end
% end
% 
% clear battery_struct
% 
% summary_struct = xml2struct('summary.xml');
% TT(k,l,m) = str2double(summary_struct.summary.step{step}.Attributes.meanTravelTime);
% 
% clear summary_struct
% 
% save('EC.mat','EC');
% save('TT.mat','TT');
% 
%         end
%     end 
% end



%simulation run ends






        
        