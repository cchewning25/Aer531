%Aer 351 Code 
%Written by Brian Caskey
%1/18/2020

clear,clc,close all

weight = 12000; %lb
Ixx = 2620; %slug-ft^2
Iyy = 30300; %slug-ft^2
Izz = 32300; %slug-ft^2
Ixy = 0; %slug-ft^2
Ixz = -190; %slug-ft^2
Iyz = 0; %slug-ft^2
S = 173.82; %ft^2 - Wing ref area
b = 25.25; %ft - wingspan
c_bar = 7.73; %ft - mean aerodynamic chord

%test variables to ensure function works
n1 = 1;
n2 = 1;
n3 = 0;
theta = 0;
phi = pi;
psi = 0;

%test calling function
[b1, b2, b3] = DCM(n1, n2, n3, theta, phi, psi)

%test variables to ensure function works
q_bar = 1;
m = weight/32.2;
T = 1;
Cl = 1;
Cn = 1;
Cm = 1;
theta = 0;
phi = 0;
psi = 0;
u = 1;
v = 1;
w = 1;
p = 1;
q = 1;
r = 1;
Cx = 1;
Cy = 1;
Cz = 1;
Ixx = 1;
Iyy = 1;
Izz = 1;
Ixz = 1;

[u_dot, v_dot, w_dot, p_dot, q_dot, r_dot, phi_dot, theta_dot, psi_dot, X_dot, Y_dot, h_dot] = eqOfMotion(q_bar, c_bar, Cl, Cn, Cm, m, S, b, T, theta, phi, psi, u, v, w, p, q, r, Cx, Cy, Cz, Ixx, Iyy, Izz, Ixz)












