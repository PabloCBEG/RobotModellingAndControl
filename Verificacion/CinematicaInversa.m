% -------------------------------------------------
% APARTADO A4 - Cinem�tica Inversa num�rica
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCI�N DEBE DEVOLVER UN VECTOR/MATRIZ NUM�RICO q
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBI�N NUM�RICO CON LA POSICI�N EN 
% CARTESIANAS DEL EXTREMO DE LA ARTICULACI�N 3, (x,y,z)
% EN CASO DE M�LTIPLES SOLUCIONES, EL RESULTADO SER� UNA MATRIZ q, DE MODO
% QUE CADA COLUMNA REPRESENTA UNA POSIBLE SOLUCI�N.

function q = CinematicaInversa(in)
x = in(1);           % Posici�n cartesianas
y = in(2);           % 
z = in(3);           % 

% ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS L�NEAS ----------
% SUSTITUYA los valores L0, L1, etc por sus valores num�ricos

% Escriba a continuaci�n las expresiones num�ricas de su cinem�tica
% inversa. Si hay varias soluciones posibles, expr�selas como vectores para
% cada componente por separado. De este modo, la primera soluci�n ser�a q1(1), q2(1),
% q3(1), la segunda soluci�n q1(2), q2(2), q3(2), etc.

q1 = [atan2(x,L0+y),   -atan2(x,L0+y) ]; 		% Ecuaci�n de ejemplo. C�mbiela por su soluci�n
q3 = [y*x,             y+x            ];		% Ecuaci�n de ejemplo. C�mbiela por su soluci�n
q2 = [x+z,             x+z            ]; 		% Ecuaci�n de ejemplo. C�mbiela por su soluci�n
% ----------------------------------------------------------------------  
% Variables de salida. No las modifique.
q=[q1;q2;q3];
end