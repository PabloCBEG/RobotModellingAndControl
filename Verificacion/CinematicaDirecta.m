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
  L0 = 1; % Valor de ejemplo. Sustitúyalo por el que corresponda
  
  
  % Posición del extremo de la articulación 3
  x = L0*sin(q1); % Ecuación de ejemplo. Cámbiela por su solución
  y = L0*sin(q1); % Ecuación de ejemplo. Cámbiela por su solución
  z = L0*sin(q1); % Ecuación de ejemplo. Cámbiela por su solución
  % Orientación (Ángulos de Euler) del marco de referencia 3
  phi   = q1+sin(q2+pi/2); % Ecuación de ejemplo. Cámbiela por su solución
  theta = q1+sin(q2+pi/2); % Ecuación de ejemplo. Cámbiela por su solución
  psi   = q1+sin(q2+pi/2); % Ecuación de ejemplo. Cámbiela por su solución
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  angEuler = [phi;theta;psi]; % Ángulos de Euler según convenio ZXZ
end


  