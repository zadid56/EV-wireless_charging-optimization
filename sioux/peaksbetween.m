function [pks, ipks] = peaksbetween(x)
% peaks and locations from vector x between zero crossings and location

if size(x,1)==1,       error('X must be a column vector'), end
if numel(x)~=length(x),error('X must be a column vector'), end

ix=intersect(find(diff(x)==1),find(x==0));     % zero crossing loc's
ix=[1;numel(x);ix];
ix=unique(sort(ix));
L=length(ix)-1;                       % one less peak than x'ings
ipk=zeros(L,1);
for i=1:L
  sx=x(ix(i):ix(i+1)-1);              % subvector between x'ings
  [~,ipk(i)]=max(abs(sx));            % peak location in subvector
end
ipks=ix(1:end-1)+ipk-1;               % max loc in original vector  
pks=x(ipks);                          % and signed max/min value
end
