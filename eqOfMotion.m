%Aer 351 Code 
%Written by Brian Caskey
%1/18/2020


function [u_dot, v_dot, w_dot, p_dot, q_dot, r_dot, phi_dot, theta_dot, psi_dot, X_dot, Y_dot, h_dot] = eqOfMotion(q_bar, c_bar, Cl, Cn, Cm, m, S, b, T, theta, phi, psi, u, v, w, p, q, r, Cx, Cy, Cz, Ixx, Iyy, Izz, Ixz)
g = 32.2; %ft/s^2



%Translational eqOfMotion in body frame
u_dot = r*v - q*w + ((q_bar*S*Cx + T)/m) - g*sin(theta);
v_dot = p*w - r*u + ((q_bar*S*Cy)/m) + g*cos(theta)*sin(phi);
w_dot = q*u - p*v + ((q_bar*S*Cz)/m) + g*cos(theta)*cos(phi);


%Rotational eqOfMotion in body frame
p_dot = (Izz*q_bar*S*b*Cl + Ixz*q_bar*S*b*Cn - q*(Ixz*p*(Iyy - Ixx - Izz) + r*(Ixz^2 + Izz*(Izz - Iyy)))) / (Ixx*Izz - Ixz^2);
q_dot = (q_bar*S*c_bar*Cm - p*r*(Ixx - Izz) - Ixz*(p^2 - r^2)) / Iyy;
r_dot = (Ixz*q_bar*S*b*Cl + Ixx*q_bar*S*b*Cn + q*(Ixz*r*(Iyy-Ixx-Izz)+p*(Ixz^2 + Ixx*(Ixx-Iyy)))) / (Ixx*Izz - Ixz^2);


%Angular Velocity Components
phi_dot = p + tan(theta)*(q*sin(phi) + r*cos(phi));
theta_dot = q*cos(phi) - r*sin(phi);
psi_dot = sec(theta)*(q*sin(phi) + r*cos(phi));


%Inertial velocities in terms of the body velocities
A  =   [cos(theta)*cos(psi)     sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi)    cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi);
        cos(theta)*sin(psi)     sin(phi)*sin(theta)*sin(psi) + cos(phi)*cos(psi)    cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi);
            sin(theta)                       -sin(phi)*cos(theta)                                -cos(phi)*cos(theta);               ];

B = A*[u;v;w];
X_dot = B(1);
Y_dot = B(2);
h_dot = B(3);
  

end