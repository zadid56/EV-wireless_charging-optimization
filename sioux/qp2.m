close all
clc

TT = zeros(10000,1);
fid = fopen('lanedump.xml','rt'); % 'rt' means "read text"
end_str = '</meandata>';
count = 0;
while(1)
    line = fgetl(fid);
    ind = strfind(line,'traveltime=');
    if(contains(line,end_str))
        break;
    end
    if(isempty(ind)==0)
        count = c
		TT(count) = str2double(line((ind+12):(ind+18)));
    end
end
fclose(fid);