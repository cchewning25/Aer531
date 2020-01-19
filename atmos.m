%Aer 351 Code 
%Written by Brian Caskey
%1/18/2020


function [rho, p, T, a] = atmos(h)
% Will return free stream air density, pressure, temperature, and speed of
% sound at varying altitudes h


    A = [0.238e-2   0.211e4     0.288e3     0.112e4;
        -0.3561e-2 -0.378e4     0.991e2    -0.192e3;
         0.234e-2   0.261e4     0.346e1    -0.134e2;
        -0.100e-2  -0.780e3    -0.909e1    -0.775e1;
        -0.757e-5   0.752e2     0.696e1     0.347e1;
         0.233e-3   0           0           0      ;
        -0.218e-4   0           0           0      ;];


    rho =   A(1,1) + h*A(2,1) + (h^2)*A(3,1) + (h^3)*A(4,1) + (h^4)*A(5,1) + (h^5)*A(6,1) + (h^8)*A(7,1)

    p   =   A(1,2) + h*A(2,2) + (h^2)*A(3,2) + (h^3)*A(4,2) + (h^4)*A(5,2)

    if h < 36200
        T =     A(1,3) + h*A(2,3) + (h^3)*A(3,3) + (h^4)*A(4,3) + (h^5)*A(5,3)
        a = A(1,4) + h*A(2,4) + (h^2)*A(3,4) + (h^3)*A(4,4) + (h^5)*A(5,4)
    else
        T = 389.97 %Rankine
        a = 968.08 %ft/s
    end

end
