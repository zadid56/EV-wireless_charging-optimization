function DL_calc()

%folder = GetCommandLineArgs();
%cd (folder{6});
case_fold = '/scratch3/mdzadik/cases/case_377';
cd(case_fold);

net_struct = xml2struct('sioux.net.xml');

%%%%%%%%%%%%%%%%%%%%%%Load Files

a = load('tls_lanes.mat');
tls_lanes = a.tls_lanes;
a = load('tls_speeds.mat');
tls_speeds = a.tls_speeds;
a = load('tls_ind.mat');
tls_ind = a.tls_ind;

%%%%%%%%%%%%%%%%Load Files end

%Assumption

p1 = [20 35 50];
p2 = p1;
pt = [1 2 3];

no_green = numel(p1);
no_pt = numel(pt);

%temp = strsplit(folder{6},'_');
temp = strsplit(case_fold,'_');
case_no = str2double(temp{2});
x = no_green*no_green*no_pt;
temp2 = floor(case_no/x)+1;
k = find(tls_ind==temp2);
base = dec2base(mod(case_no,x),3,3);
m = str2double(base(2))+1;
n = str2double(base(3))+1;
np = size(net_struct.net.tlLogic{temp2}.phase,2);
cycle = p1(m)+p2(n)+np*2+(np-4)*5;

delay_struct = xml2struct('lanedump.xml');
nde = numel(delay_struct.meandata.interval.edge);
waittime = 0;
v_total = 0;

for i=1:nde
    ndl = numel(delay_struct.meandata.interval.edge{i}.lane);
    if (ndl==1)
        if(isfield(delay_struct.meandata.interval.edge{i}.lane.Attributes,'waitingTime')==1)
            if(sum(ismember(tls_lanes(k),delay_struct.meandata.interval.edge{i}.lane.Attributes.id))~=0)
                waittime = waittime + str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.waitingTime);
                v_total = v_total + str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.left)+str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.arrived)+str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.laneChangedFrom);
                %av_delay = round(waittime/(v_total+eps));
            end
        end
    else
        for j=1:ndl
            if(isfield(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes,'waitingTime')==1)
                if(sum(ismember(tls_lanes(k),delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.id))~=0)
                    waittime = waittime + str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.waitingTime);
                    v_total = v_total + str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.left)+str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.arrived)+str2double(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.laneChangedFrom);
                    %av_delay = round(waittime/(v_total+eps));
                end
            end
        end
    end
end

av_delay = round(waittime/(v_total+eps));

clear delay_struct

queue_struct = xml2struct('queue.xml');
nt = size(queue_struct.queue_dash_export.data,2);
q_length = zeros(1,nt);

for i=1:nt
    if (isfield(queue_struct.queue_dash_export.data{i}.lanes,'lane')==1)
        nq = size(queue_struct.queue_dash_export.data{i}.lanes.lane,2);
        if (nq==1)
            if(sum(ismember(tls_lanes(k),queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.id))~=0)
                q_length(i) = str2double(queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.queueing_length);
            end
        else
            for j=1:nq
                if(sum(ismember(tls_lanes(k),queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.id))~=0)
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
qlc=round((v_ql*cycle)/nt);
speed = mean(tls_speeds(k)*2.237);

if ((qlc<=7 && speed<=37) || (qlc>=20 && speed>45))
    CF = 5;
end
if ((qlc>=8 && qlc<=19 && speed<=37) || (qlc>=20 && speed>37 && speed<=45))
    CF = 2;
end
if ((qlc>=8 && qlc<=19 && speed>45) || (qlc<=7 && speed>37 && speed<=45))
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

CD = round(av_delay+CF.*FVS);
if (CD>80)
    CD = 80;
end

disp(CD);
save('CD.mat','CD');
cd('/home/mdzadik/SUMO_cluster/sioux');

end