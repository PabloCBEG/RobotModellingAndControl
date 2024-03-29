% -------------------------------------------------
% APARTADO A3 - Cinem�tica directa simb�lica 
% -------------------------------------------------

function [xyz] = CinematicaDirectaSimbolica
  
  % Emplee exclusivamente las siguientes variables simb�licas en sus expresiones
  syms x y z q1 q2 q3  real % variables articulares 
  syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real % Par�metros dimensionales
  PI = sym(pi);   % Emplee esta expresi�n de pi simb�lico

  % ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS L�NEAS ----------
  % NO SUSTITUYA los valores L0, L1, etc por sus valores num�ricos
  % Posici�n del extremo de la articulaci�n 3
  x = sin(q1)*sin(q2)*(L3A + q3) - L3B*cos(q1) - L1*cos(q1) - L2*cos(q2)*sin(q1);
  y = L2*cos(q1)*cos(q2) - L3B*sin(q1) - cos(q1)*sin(q2)*(L3A + q3) - L1*sin(q1);
  z = - cos(q2)*(L3A + q3) - L2*sin(q2);
  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.
  xyz=[x;y;z];
  end



  