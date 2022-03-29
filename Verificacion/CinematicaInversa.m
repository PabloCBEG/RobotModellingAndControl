% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa numérica
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCIÓN DEBE DEVOLVER UN VECTOR/MATRIZ NUMÉRICO q
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBIÉN NUMÉRICO CON LA POSICIÓN EN 
% CARTESIANAS DEL EXTREMO DE LA ARTICULACIÓN 3, (x,y,z)
% EN CASO DE MÚLTIPLES SOLUCIONES, EL RESULTADO SERÁ UNA MATRIZ q, DE MODO
% QUE CADA COLUMNA REPRESENTA UNA POSIBLE SOLUCIÓN.

function q = CinematicaInversa(in)
x = in(1);           % Posición cartesianas
y = in(2);           % 
z = in(3);           % 

% ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
% SUSTITUYA los valores L0, L1, etc por sus valores numéricos

% Escriba a continuación las expresiones numéricas de su cinemática
% inversa. Si hay varias soluciones posibles, expréselas como vectores para
% cada componente por separado. De este modo, la primera solución sería q1(1), q2(1),
% q3(1), la segunda solución q1(2), q2(2), q3(2), etc.

q1 = [atan2(x,L0+y),   -atan2(x,L0+y) ]; 		% Ecuación de ejemplo. Cámbiela por su solución
q3 = [y*x,             y+x            ];		% Ecuación de ejemplo. Cámbiela por su solución
q2 = [x+z,             x+z            ]; 		% Ecuación de ejemplo. Cámbiela por su solución
% ----------------------------------------------------------------------  
% Variables de salida. No las modifique.
q=[q1;q2;q3];
end