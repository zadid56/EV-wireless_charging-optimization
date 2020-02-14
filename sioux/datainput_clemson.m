function Data= datainput_clemson
%from http://www.aridolan.com/ga/gaa/MultiVarMin.html
%--------------------------------------------------------------------------
%Copyright (c) 2012 by Juliane Mueller
%
% This file is part of the surrogate model module toolbox.
%
%--------------------------------------------------------------------------
%Author information
%Juliane Mueller
%Tampere University of Technology, Finland
%juliane.mueller2901@gmail.com
%--------------------------------------------------------------------------

global units Comb_pos cflag

max1 = size(Comb_pos,2);
max2 = numel(cflag);
                                                           
%define objective function
Data.objfunction=@fitness_fcn;

%define constraints function
Data.constraint{1}=@constraint_fcn;
Data.constraint{2}=@constraint_fcn2;

Data.xlow=ones(1,2*units);%variabe lower bounds

Data.xup=[max1*ones(1,units) max2*ones(1,units)]; %variabe upper bounds

Data.dim= 2*units; %problem dimension

Data.integer=(1:2*units); %indices of integer variables

Data.continuous = []; %indices of continuous variables

end %function