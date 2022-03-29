% -------------------------------------------------
% APARTADO A3 - Cinemática directa simbólica 
% -------------------------------------------------

function [xyz,or] = CinematicaDirectaSimbolica
  
  % Emplee exclusivamente las siguientes variables simbólicas en sus expresiones
  syms x y z q1 q2 q3  real % variables articulares 
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Parámetros dimensionales
  PI = sym(pi);   % Emplee esta expresión de pi simbólico

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
  % NO SUSTITUYA los valores L0, L1, etc por sus valores numéricos
  % Posición del extremo de la articulación 3
  x = L0*sin(q1); % Ecuación de ejemplo. Cámbiela por su solución
  y = L0*sin(q1); % Ecuación de ejemplo. Cámbiela por su solución
  z = L0*sin(q1); % Ecuación de ejemplo. Cámbiela por su solución
  % Orientación (Ángulos de Euler) del marco de referencia 3
  phi   = q1+sin(q2+PI/2); % Ecuación de ejemplo. Cámbiela por su solución
  theta = q1+sin(q2+PI/2); % Ecuación de ejemplo. Cámbiela por su solución
  psi   = q1+sin(q2+PI/2); % Ecuación de ejemplo. Cámbiela por su solución
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  or = [phi;theta;psi];
end



  