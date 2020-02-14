close all
clc

folder = '/scratch3/mdzadik/cases2/case_4';
cd (folder);

EC = zeros(94,1);
fid = fopen('battery.xml','rt'); % 'rt' means "read text"
while ~feof(fid)
    line = fgetl(fid);
    ind = strfind(line,'energyCharged=');
    ind2 = strfind(line,'chargingStationId=');
    if(isempty(ind)==0)
        if(isnumeric(str2double(line(ind2+26)))==1 && isnan(str2double(line(ind2+26)))==0)
            temp5 = strsplit(line((ind2+19):(ind2+26)),'_');
            temp5 = str2double(temp5(3));
        else
            if(isnumeric(str2double(line(ind2+25)))==1 && isnan(str2double(line(ind2+25)))==0)
                temp5 = strsplit(line((ind2+19):(ind2+25)),'_');
                temp5 = str2double(temp5(3));
            else
                temp5 = 0;
            end
        end
        if(temp5~=0)
            EC(temp5) = EC(temp5)+str2double(line((ind+15):(ind+20)));
        end
    end
end
fclose(fid);
cd('/home/mdzadik/SUMO_cluster/sioux');
save('EC4.mat','EC');