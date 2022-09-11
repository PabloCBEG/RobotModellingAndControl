% -------------------------------------------------
% APARTADO B1 - Parámetros dinámicos
% -------------------------------------------------

function [s11,s22,s33,I11,I22,I33] = parametrosDinamicos
% DATOS DINÁMICOS DEL BRAZO DEL ROBOT
% Consigne datos numéricos, no simbólicos
% Eslabón 1
  s11 = [0 ,0  ,0 ]'; % (m)  Posición del cdg del eslabón 1
  I11=[ 0,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 1
        0,  0,  0;...
        0,  0,  0 ] ; 

% Eslabón 2
  s22 = [0 ,0  ,0 ]'; % (m)  Posición del cdg del eslabón 2
  I22=[ 0,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 2
        0,  0,  0;...
        0,  0,  0 ] ; 

% Eslabón 3
  s33 = [0 ,0  ,0 ]'; % (m)  Posición del cdg del eslabón 3
  I33=[ 0,  0,  0;... % (kg.m2) Tensor de inercia del eslabón 3
        0,  0,  0;...
        0,  0,  0 ] ; 
end