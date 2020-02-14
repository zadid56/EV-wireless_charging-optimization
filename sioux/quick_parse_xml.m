function quick_parse_xml()

folder = GetCommandLineArgs();
cd (folder{6});

temp1 = strsplit(folder{6},'_');
temp2 = floor(str2double(temp1(2))/27)+1;
temp3 = load('tls_ind.mat');
temp3 = temp3.tls_ind;
temp4 = find(temp3==temp2);

EC = 0;
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
        if(isempty(find(temp4==temp5))==0)
            EC = EC+str2double(line((ind+15):(ind+20)));
        end
    end
end
fclose(fid);
save('EC.mat','EC');
cd('/home/mdzadik/SUMO_cluster/sioux');
end