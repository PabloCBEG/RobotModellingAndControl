% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa numérica
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCIÓN DEBE DEVOLVER UN VECTOR/MATRIZ NUMÉRICO q
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBIÉN NUMÉRICO CON LA POSICIÓN EN 
% CARTESIANAS DEL EXTREMO DE LA ARTICULACIÓN 3, (x,y,z)
% EN CASO DE MÚLTIPLES SOLUCIONES, EL RESULTADO SERÁ UNA MATRIZ q, DE MODO
% QUE CADA COLUMNA REPRESENTA UNA POSIBLE SOLUCIÓN.

function q = Copy_of_CinematicaInversa_pruebas(in)
x = in(1);           % Posición cartesianas
y = in(2);           % 
z = in(3); 

% ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
% SUSTITUYA los valores L0, L1, etc por sus valores numéricos
L0 = 1;
L1 = 0.5;
L2 = 1;
L3A = 1;
L3B = 0.5;
% L3 = sqrt(L3A^2 + L3B^2);

A = L1 + L3B;
R = sqrt((L0 - z)^2 + y^2);
% alpha = atan2(y, L0 - z);

s2 = (-2*x*L2 + sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2))); %ó -sqrt

c2 = sqrt(1 - s2^2);

% q3 = (-x - L2*sin(q2))/cos(q2) - L3A;

% c1 = (L3A + q3 + x*cos(q2) + ((y*sin(q2))/(z - L0))*(L3B + L1))/((L0 - z)*sin(q2) - (y^2*sin(q2))/(z - L0));
% s1 = (-L3B - L1 -y*c1)/(z - L0);

% Escriba a continuación las expresiones numéricas de su cinemática
% inversa. Si hay varias soluciones posibles, expréselas como vectores para
% cada componente por separado. De este modo, la primera solución sería q1(1), q2(1),
% q3(1), la segunda solución q1(2), q2(2), q3(2), etc.

q2 = atan2(s2,c2);
%   q3(1,:) = (-x - L2*sin(q2(1,:)))/cos(q2(1,:)) - L3A;
q3 = (-x - L2*sin(q2))/cos(q2) - L3A;

    c1 = (L3A + q3 + x*cos(q2) + ((y*sin(q2))/(z - L0))*(L3B + L1))/((L0 - z)*sin(q2) - (y^2*sin(q2))/(z - L0));
    s1 = (-L3B - L1 -y*c1)/(z - L0);

q1 = atan2(s1,c1);

% ----------------------------------------------------------------------  
% Variables de salida. No las modifique.
q=[q1;q2;q3];
end