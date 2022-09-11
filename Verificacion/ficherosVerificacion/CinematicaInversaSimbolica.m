% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa simbólica
% -------------------------------------------------

function q = CinematicaInversaSimbolica
  
  % Emplee exclusivamente las siguientes variables simbólicas en sus expresiones
  syms x y z q1 q2 q3  real % Coordenadas cartesianas del efector final
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Parámetros dimensionales
  % Emplee esta expresión de pi simbólico
  PI = sym(pi);

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
  % Escriba a continuación las expresiones simbólicas de su cinemática
  % inversa. Si hay varias soluciones posibles, expréselas como vectores para
  % cada componente por separado. De este modo, la primera solución sería q1(1), q2(1),
  % q3(1), la segunda solución q1(2), q2(2), q3(2), etc.
  
  q1 = [L0*atan2(x,y),   -L0*atan2(x,y)]; % Ejemplo de Cin. Inversa con dos soluciones. Cámbiela por su solución
  q2 = [L2 + z,          L2 + z,       ]; % Ejemplo de Cin. Inversa con dos soluciones. Cámbiela por su solución
  q3 = [L1  ,            L1            ]; % Ejemplo de Cin. Inversa con dos soluciones. Cámbiela por su solución

  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.                                           
  q=[q1;q2;q3];
end



  