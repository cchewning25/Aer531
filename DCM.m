%Aer 351 Code 
%Written by Brian Caskey
%1/18/2020

function [b1, b2, b3] = DCM(n1, n2, n3, theta, phi, psi)

B = [1 0 0; 0 cos(phi) sin(phi); 0 -sin(phi) cos(phi)] * [cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)] * [cos(psi) sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1]*[n1; n2; n3];

b1 = B(1);
b2 = B(2);
b3 = B(3);

end