
function [rho, p, T, a] = atmostemp(h)

[T_si,a_si,P_si,rho_si] = atmosisa(h/3.2808);

T = T_si*9/5;
a = a_si*3.281;
p = P_si/47.880258888889;
rho = rho_si/515.378819;

end
