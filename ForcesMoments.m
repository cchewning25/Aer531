%Chris Chewning
%AERE 531 Aircraft Forces and Moments Function

%Outputs: Lift,Drag,Side Force,Rolling Moment,Pitching Moment,Yawing Moment
%Inputs: air density (rho),Total Velocity (Vt),Reference Area (S)...
%wingspan (b),mean geometric chord (cbar)

function [L,D,Fy,l,m,n] = ForcesMoments(rho,Vt,S,b,cbar)

qbar = .5*rho*Vt^2;

%Component Build Up

%CLtotal
CLwing = CL0w + CLa*alpha;  %coefficient of lift due to wing
CLht = CLat*alphat;         %coefficient of lift due to horizontal tail
CLtotal = CLwing + CLht;    %total coefficient of lift

%CDtotal
CDw = CDmin + Kw*Clwing^2;
CDht = CDminht + Kht*CLht^2;
CDvt = CDminvt;
CDtotal = CDw + CDht + CDvt;

%Cytotal


%Lift

Lwing = qbar*S*CLwing;
Lht = etaht*qbar*Sht*CLht;
L = Lwing + Lht*cosd(E-((q*cght)/(Vt))) - (Dht+Dvt)*sind(E-((q*cght)/(Vt)));

%Drag

Dwing = qbar*S*CDw;
Dht = etaht*qbar*Sht*CDht;
Dfus = qbar*S*cbar*Cmfus;
Dvt = etavt*qbar*Svt*CDvt;
D = Dwing + (Dht+Dvt)*cosd(E-((q*cght)/(Vt))) + Lht*sind(E-((q*cght)/(Vt))) + Dfus;

%Fy (Side Force)

Fy = qbar*S*Cytotal;


%L (Pitching Moment)

l = qbar*S*b*Cltotal;


%M (Rolling Moment)


m = qbar*S*cbar*Cmotal;



%N (Yawing Moment)



n = qbar*s*b*Cntotal;



















end
