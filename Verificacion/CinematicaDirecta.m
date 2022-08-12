% -------------------------------------------------
% APARTADO A3 - Cinemática directa numérica 
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCIÓN DEBE DEVOLVER DOS VECTORES NUMÉRICOS, POSICIÓN Y ORIENTACIÓN,
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBIÉN NUMÉRICO CON LAS TRES COORDENADAS ARTICULARES
% q1, q2 y q3

function [xyz,angEuler] = CinematicaDirecta(in)
  q1       = in(1);           % Posiciones articulares
  q2       = in(2);            
  q3       = in(3);

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
  % SUSTITUYA los valores L0, L1, etc por sus valores numéricos  
    L0 = 1;
    L1 = 0.5;
    L2 = 1;
    L3A = 1;
    L3B = 0.5;
    L3 = sqrt(L3A^2 + L3B^2);
    L4 = 1.5;
    L5 = 1.5;
    L6 = 0.5;
  
  % Posición del extremo de la articulación 3
  x = cos(q2)*(L3A + q3) + L2*sin(q2);
  y = L1*cos(q1) + L3B*cos(q1) + sin(q1)*sin(q2)*(L3A + q3) - L2*cos(q2)*sin(q1);
  z = L0 + L1*sin(q1) + L3B*sin(q1) - cos(q1)*sin(q2)*(L3A + q3) + L2*cos(q1)*cos(q2);
  
  % Orientación (Ángulos de Euler) del marco de referencia 3
  phi   = pi/2;
  theta = -pi/2 - q2;
  psi   = -q1;
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  angEuler = [phi;theta;psi]; % Ángulos de Euler según convenio ZXZ
end


  