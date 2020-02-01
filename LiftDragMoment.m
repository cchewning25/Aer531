clear,clc



function LDM = LiftDragMoment(q_bar, alpha)

opts = detectImportOptions('LiftDragMoment_Coeff.xlsx'); %detects import options
opts.SelectedVariableNames = [3];   %imports only 3rd column of data

T = readmatrix('LiftDragMoment_Coeff.xlsx', opts);

CL_0_w      = T(1);
CL_alpha_w  = T(2);
CD_min_w    = T(3);
CM_w        = T(4);
CL_alpha_t  = T(5);
CD_min_t    = T(6);
CL_alpha_h  = T(7);
CD_min_h    = T(8);
CM_alpha_f  = T(9);
CD_f        = T(10);


S           = T(11); %reference wing area
c           = T(12); %reference chord
b           = T(13); %reference span
AR_w        = b/c;


%Eqns 17-24
CL_w = CL_0_w + CL_alpha_w*alpha;
CD_w = CD_min_w + K_w*(CL_w^2);     %-what is K_w??
E = 2*(CL_0_w + CL_alpha_w * (alpha - alpha*(cg_t + cg_w)/V))/(pi*AR_w);



end