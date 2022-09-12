% -------------------------------------------------
% APARTADO A3 - Cinem�tica directa num�rica 
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCI�N DEBE DEVOLVER DOS VECTORES NUM�RICOS, POSICI�N Y ORIENTACI�N,
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBI�N NUM�RICO CON LAS TRES COORDENADAS ARTICULARES
% q1, q2 y q3

function [xyz,angEuler] = CinematicaDirecta(in)
  q1       = in(1);           % Posiciones articulares
  q2       = in(2);            
  q3       = in(3);

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS L�NEAS ----------
  % SUSTITUYA los valores L0, L1, etc por sus valores num�ricos  
    L0 = 1;
    L1 = 0.5;
    L2 = 1;
    L3A = 1;
    L3B = 0.5;
%     L3 = sqrt(L3A^2 + L3B^2);
%     L4 = 1.5;
%     L5 = 1.5;
%     L6 = 0.5;
  
  % Posici�n del extremo de la articulaci�n 3
    x = - cos(q2)*(L3A + q3) - L2*sin(q2);
    y = sin(q1)*sin(q2)*(L3A + q3) - L3B*cos(q1) - L1*cos(q1) - L2*cos(q2)*sin(q1);
    z = L0 - L1*sin(q1) - L3B*sin(q1) - cos(q1)*sin(q2)*(L3A + q3) + L2*cos(q1)*cos(q2);
  
  % Orientaci�n (�ngulos de Euler) del marco de referencia 3
    theta   = atan2(sqrt(sin(q1)^2 + (-cos(q1)*cos(q2))^2),-cos(q1)*sin(q2));
        % Showint theta up there bc we need it for the other angles
        % computation
    phi     = atan2(-cos(q2)/sin(theta),-sin(q1)*sin(q2)/sin(theta));
    psi     = atan2(sin(q1)/sin(theta),-cos(q1)*cos(q2)/sin(theta));
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  angEuler = [phi;theta;psi]; % �ngulos de Euler seg�n convenio ZXZ
  
%   subs(...,[],[]);
end


  