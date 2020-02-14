function DL()

folder = GetCommandLineArgs();
cd (folder{6});

length_units = 6;
max_length = 36;
max_units = max_length/length_units;
tls_lanes = cell([1,1000]);
tls_ind =zeros(1,1000);
net_struct = xml2struct('sioux.net.xml');
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

clear index
index = find(tls_lengths > 200);
tls_lanes = tls_lanes(index);
tls_lengths = tls_lengths(index);
tls_speeds = tls_speeds(index);
tls_ind = tls_ind(index);
tls_count = numel(tls_lengths);

%%%%%%%%%%%%%%%%Get TLS Length and Speed End

clear index lane_lengths lane_speeds lanes

%Assumption

p1 = [20 35 50];
p2 = p1;
pt = [1 2 3];

no_green = numel(p1);
no_pt = numel(pt);
no_units = 3;

temp = strsplit(folder{6},'_');
case_no = str2double(temp{2});
x = no_green*no_green*no_pt*no_units;
k = floor(case_no/x)+1;
base = dec2base(mod(case_no,x),3,4);
l = str2double(base(1))+1;
m = str2double(base(2))+1;
n = str2double(base(3))+1;
o = str2double(base(4))+1;
np = size(net_struct.net.tlLogic{tls_ind(k)}.phase,2);
cycle = p1(m)+p2(n)+np*2+(np-4)*5;

delay_struct = xml2struct('lanedump.xml');
nde = numel(delay_struct.meandata.interval.edge);

for i=1:nde
    ndl = numel(delay_struct.meandata.interval.edge{i}.lane);
    if (ndl==1)
        if(isfield(delay_struct.meandata.interval.edge{i}.lane.Attributes,'waitingTime')==1)
            if(strcmp(delay_struct.meandata.interval.edge{i}.lane.Attributes.id,tls_lanes(k))==1)
                waittime = str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.waitingTime);
                v_total = str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.left)+str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.arrived)+str2double(delay_struct.meandata.interval.edge{i}.lane.Attributes.laneChangedFrom);
                av_delay = round(waittime/(v_total+eps));
            end
        end
    else
        for j=1:ndl
            if(isfield(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes,'waitingTime')==1)
                if(strcmp(delay_struct.meandata.interval.edge{i}.lane{j}.Attributes.id,tls_lanes(k))==1)
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
            if(strcmp(queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.id,tls_lanes(k))==1)
                q_length(i) = str2double(queue_struct.queue_dash_export.data{i}.lanes.lane.Attributes.queueing_length);
            end
        else
            for j=1:nq
                if(strcmp(queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.id,tls_lanes(k))==1)
                    q_length(i) = str2double(queue_struct.queue_dash_export.data{i}.lanes.lane{j}.Attributes.queueing_length);
                end
            end
        end
    end
end

clear queue_struct

cd('/home/mdzadik/SUMO_cluster/sioux');
q_length = round((q_length+1.5)/7.5);
v_ql = sum(peaksbetween(q_length'));
FVS = v_ql/(v_total+eps);
FVS(FVS>1)=1;
qlc=round((v_ql*cycle)/nt);
speed = tls_speeds(k)*2.237;

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

CD = round(av_delay+CF.*FVS);
if (CD>80)
    CD = 80;
end

cd (folder{6});
save('CD.mat','CD');
cd('/home/mdzadik/SUMO_cluster/sioux');

end