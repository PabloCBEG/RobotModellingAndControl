% -------------------------------------------------
% APARTADO B1 - Parámetros dinámicos
% -------------------------------------------------

function [s11,s22,s33,I11,I22,I33] = parametrosDinamicos
% DATOS DINÁMICOS DEL BRAZO DEL ROBOT
% Consigne datos numéricos, no simbólicos
L0 = 1;
L1 = 0.5;
L2 = 1;
L3A = 1;
L3B = 0.5;
rext = 0.1; %m
rint = 0.08;
rho = 5800; % kg/m3
m0 = 65.5965; % kg
m1 = 32.7982;
m2 = m0;
m3 = 98.3947;
% Eslabón 1
  s11 = [0, 0, L1/2]'; % (m)  Posición del cdg del eslabón 1
  I11=[ 0.817768453333333,  0,                  0;... % (kg.m2) Tensor de inercia del eslabón 1
        0,                  0.817768453333333,  0;...
        0,                  0,                  0.26894524] ; 

% Eslabón 2
  s22 = [-L2/2, 0, 0]'; % (m)  Posición del cdg del eslabón 2
  I22=[ 0.5378913,          0,                  0;... % (kg.m2) Tensor de inercia del eslabón 2
        0,                  5.73532065,         0;...
        0,                  0,                  5.73532065] ; 

% Eslabón 3
pcdm3a = [L3B, 0, -L3A/2];
pcdm3b = [L3B/2, 0, 0];
area = pi*(rext^2 - rint^2);
rho_lineal = rho*area; % kg/m
m3a = rho_lineal*L3A; m3b = rho_lineal*L3B;
  s33 = [(m3a*pcdm3a + m3b*pcdm3b)/m3]'; % (m)  Posición del cdg del eslabón 3
  I33=  [11.4706333622699,  0,                  2.73318560862358;... % (kg.m2) Tensor de inercia del eslabón 3
        0,                  13.3860498367935,   0;...
        2.73318560862358,   0,                  2.72225286618921] ; 
end