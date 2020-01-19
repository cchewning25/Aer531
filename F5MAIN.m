%Aer 351 Code 
%Written by Brian Caskey
%1/18/2020

clear,clc,close all

% AIRCRAFT PROPERTIES
%===================================================
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



% INITIAL STATE VECTOR
%===================================================

pN = 0; %ft
pE = 0; %ft
pD = 5000; %ft
phi = 0; %rad
theta = 0; %rad
psi = 0; %rad
U = 100; %ft/s
V = 0; %ft/s
W = 0; %ft/s
P = 0; %rad/s
Q = 0; %rad/s
R = 0; %rad/s

X = [pN pE pD phi theta psi U V W P Q R]';


% CONTROL VECTOR
%=================================================

delta_t = 0;
delta_e = 0;
delta_a = 0;
delta_r = 0;

U_control = [delta_t delta_e delta_a delta_r]';


% HIGH-LEVEL FLIGHT INFORMATION
%=================================================

[rho, p, T, a] = atmostemp(pD);

V_T = sqrt(U^2 + V^2 + W^2); % Magnitude of velocity vector (ft/s)
q_bar = 0.5*rho*V_T^2; % Dynamic pressure (slug / ft*s^2)
M = V_T / a; % flight mach number



%[u_dot, v_dot, w_dot, p_dot, q_dot, r_dot, phi_dot, theta_dot, psi_dot, X_dot, Y_dot, h_dot] = eqOfMotion(q_bar, c_bar, Cl, Cn, Cm, m, S, b, T, theta, phi, psi, u, v, w, p, q, r, Cx, Cy, Cz, Ixx, Iyy, Izz, Ixz)












