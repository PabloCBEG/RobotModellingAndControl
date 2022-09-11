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
  L0 = 1; % Valor de ejemplo. Sustit�yalo por el que corresponda
  
  
  % Posici�n del extremo de la articulaci�n 3
  x = L0*sin(q1); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  y = L0*sin(q1); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  z = L0*sin(q1); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  % Orientaci�n (�ngulos de Euler) del marco de referencia 3
  phi   = q1+sin(q2+pi/2); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  theta = q1+sin(q2+pi/2); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  psi   = q1+sin(q2+pi/2); % Ecuaci�n de ejemplo. C�mbiela por su soluci�n
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  angEuler = [phi;theta;psi]; % �ngulos de Euler seg�n convenio ZXZ
end


  