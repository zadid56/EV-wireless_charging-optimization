 function [c ceq] = constraint_fcn2(x)
   c = 6*sum(x(1:6).*x(7:12))-30;
   ceq=[];
 end