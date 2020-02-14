close all
clc

lanedump = xml2struct('lanedump.xml');
volume = zeros(76,2);

for i=1:76
    volume(i,1) = str2double(lanedump.meandata.interval.edge{i}.Attributes.id);
    for j=1:2
        volume(i,2) = volume(i,2) + str2double(lanedump.meandata.interval.edge{i}.lane{j}.Attributes.left);
    end
end

volume = sortrows(volume);