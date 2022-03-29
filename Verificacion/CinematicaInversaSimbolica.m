% -------------------------------------------------
% APARTADO A4 - Cinem�tica Inversa simb�lica
% -------------------------------------------------

function q = CinematicaInversaSimbolica
  
  % Emplee exclusivamente las siguientes variables simb�licas en sus expresiones
  syms x y z q1 q2 q3  real % Coordenadas cartesianas del efector final
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Par�metros dimensionales
  % Emplee esta expresi�n de pi simb�lico
  PI = sym(pi);

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS L�NEAS ----------
  % Escriba a continuaci�n las expresiones simb�licas de su cinem�tica
  % inversa. Si hay varias soluciones posibles, expr�selas como vectores para
  % cada componente por separado. De este modo, la primera soluci�n ser�a q1(1), q2(1),
  % q3(1), la segunda soluci�n q1(2), q2(2), q3(2), etc.
  
  q1 = [L0*atan2(x,y),   -L0*atan2(x,y)]; % Ejemplo de Cin. Inversa con dos soluciones. C�mbiela por su soluci�n
  q2 = [L2 + z,          L2 + z,       ]; % Ejemplo de Cin. Inversa con dos soluciones. C�mbiela por su soluci�n
  q3 = [L1  ,            L1            ]; % Ejemplo de Cin. Inversa con dos soluciones. C�mbiela por su soluci�n

  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.                                           
  q=[q1;q2;q3];
end



  