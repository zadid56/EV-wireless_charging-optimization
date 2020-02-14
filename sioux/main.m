% close all
% clc
% 
% length_units = 6;
% max_length = 36;
% max_units = max_length/length_units;
% tls_lanes = cell([1,1000]);
% tls_ind =zeros(1,1000);
% 
% net_struct = xml2struct('sioux.net.xml');
% 
% nj = size(net_struct.net.junction,2);
% ntl = size(net_struct.net.tlLogic,2);
% signal_max_green = zeros(ntl,10);
% signal_PT = zeros(ntl,1);
% t_id = cell([1,ntl]);
% 
% %%%%%%%%%%%%%%%%%%%%%%%Get Signal TImes
% 
% for i=1:ntl
%     t_id{i} = net_struct.net.tlLogic{i}.Attributes.id;
%     np = size(net_struct.net.tlLogic{i}.phase,2);
%     signal_PT(i) = str2double(net_struct.net.tlLogic{i}.param{1}.Attributes.value);
%     for j=1:np
%         signal_max_green(i,j) = str2double(net_struct.net.tlLogic{i}.phase{j}.Attributes.maxDur);
%     end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%Get Signal TImes End
% 
% %%%%%%%%%%%%%%%%%%%%%%Get TLS Lanes
% 
% count=1;
% for i=1:nj
%     if (strcmp(net_struct.net.junction{i}.Attributes.type,'traffic_light'))
%         j_id = net_struct.net.junction{i}.Attributes.id;
%         tind = find(strcmp(t_id,j_id)==1);
%         if(isempty(tind))
%             tind=ntl;
%         end
%         j_lanes = strsplit(net_struct.net.junction{i}.Attributes.incLanes);
%         nl = size(j_lanes,2);
%         tls_lanes(count:count+nl-1) = j_lanes;
%         tls_ind(count:count+nl-1) = tind;
%         count = count+nl;
%     end
% end
% 
% tls_count = count-1;
% tls_lanes = tls_lanes(1:tls_count);
% tls_ind = tls_ind(1:tls_count);
% 
% %%%%%%%%%%%%%%%%%Get TLS Lanes End
% 
% %%%%%%%%%%%%%%%%%%Get TLS Length and Speed
% 
% ne = size(net_struct.net.edge,2);
% count = 1;
% tls_lengths = zeros(1,tls_count);
% tls_speeds = zeros(1,tls_count);
% 
% for i=1:ne
%     nle = size(net_struct.net.edge{i}.lane,2);
%     if (nle==1)
%         lane_lengths(count) = str2double(net_struct.net.edge{i}.lane.Attributes.length);
%         lane_speeds(count) = str2double(net_struct.net.edge{i}.lane.Attributes.speed);
%         if (strfind(net_struct.net.edge{i}.lane.Attributes.id,':'))
%             temp = strsplit(net_struct.net.edge{i}.lane.Attributes.id,':');
%             lanes(count) = temp(2);
%             count = count+1;
%         else
%             temp = net_struct.net.edge{i}.lane.Attributes.id;
%             lanes(count) = cellstr(temp);
%             count = count+1;
%         end
%     else
%         for j=1:nle
%             lane_lengths(count) = str2double(net_struct.net.edge{i}.lane{j}.Attributes.length);
%             lane_speeds(count) = str2double(net_struct.net.edge{i}.lane{j}.Attributes.speed);
%             if (strfind(net_struct.net.edge{i}.lane{j}.Attributes.id,':'))
%                 temp = strsplit(net_struct.net.edge{i}.lane{j}.Attributes.id,':');
%                 lanes(count) = temp(2);
%                 count = count+1;
%             else
%                 temp = net_struct.net.edge{i}.lane{j}.Attributes.id;
%                 lanes(count) = cellstr(temp);
%                 count = count+1;
%             end
%         end
%     end
% end
% 
% for i=1:tls_count
%     index(i) = find(strcmp(lanes, tls_lanes(i))==1);
%     tls_lengths(i) = lane_lengths(index(i));
%     tls_speeds(i) = lane_speeds(index(i));
% end
% 
% %%%%%%%%%%%%%%%%Get TLS Length and Speed End
% 
% end_pos = tls_lengths - 0.1;
% start_pos = zeros(1,numel(end_pos));
% 
% clear index lane_lengths lane_speeds lanes
% 
% index = find(tls_lengths>200);
% end_pos = end_pos(index);
% start_pos = start_pos(index);
% tls_lanes = tls_lanes(index);
% tls_lengths = tls_lengths(index);
% tls_speeds = tls_speeds(index);
% tls_ind = tls_ind(index);
% tls_num = unique(tls_ind);
% tls_count = numel(tls_num);
% 
% save('tls_lanes.mat','tls_lanes');
% save('tls_lengths.mat','tls_lengths');
% save('end_pos.mat','end_pos');
% save('tls_ind.mat','tls_ind');
% save('tls_speeds.mat','tls_speeds');


%Assumption

p1 = [20 35 50];
p2 = p1;
no_green = numel(p1);

gt = [1 2 3];
no_gt = numel(gt); 

%Assumption end 

%Simulation run

cntr = 0;

for q=1:tls_count
    for k=1:no_gt
        for l=1:no_green
            for m=1:no_green
                temp_struct = net_struct;
                temp_struct.net.tlLogic{tls_num(q)}.param{1}.Attributes.value=num2str(gt(k));
                temp_struct.net.tlLogic{tls_num(q)}.phase{1}.Attributes.maxDur=num2str(p1(l));
                temp_struct.net.tlLogic{tls_num(q)}.phase{5}.Attributes.maxDur=num2str(p2(m));
                struct2xml(temp_struct,'sioux.net.xml');
				
				cd ('/scratch3/mdzadik/cases');
				mkdir(strcat('case_', num2str(cntr)));
				cd ('/home/mdzadik/SUMO_cluster/sioux');
				fold = strcat('/scratch3/mdzadik/cases/case_', num2str(cntr));
				cntr = cntr+1;
				copyfile('sioux.sumocfg', fold);
				copyfile('sioux_dua.rou.xml', fold);
				copyfile('sioux.net.xml', fold);
				copyfile('additionalFile.xml', fold);
				copyfile('xml2struct.m', fold);
				copyfile('struct2xml.m', fold);
                copyfile('tls_lanes.mat', fold);
                copyfile('tls_lengths.mat', fold);
                copyfile('tls_ind.mat', fold);
                copyfile('end_pos.mat', fold);
                copyfile('tls_speeds.mat', fold);
                copyfile('peaksbetween.m', fold);
				cd ('/home/mdzadik/SUMO_cluster/sioux');
				dlmwrite('input_sioux.txt',fold,'-append','delimiter','');
                
				clc;
				disp(cntr);
				clear temp_struct;
            end
        end
    end
end

%Simulation run end
