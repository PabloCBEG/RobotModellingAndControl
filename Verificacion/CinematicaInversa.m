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
L0 = 1;
L1 = 0.5;
L2 = 1;
L3A = 1;
L3B = 0.5;
% L3 = sqrt(L3A^2 + L3B^2);

A = L1 + L3B;
R = sqrt((L0 - z)^2 + y^2);
% alpha = atan2(y, L0 - z);

% Escriba a continuaci�n las expresiones num�ricas de su cinem�tica
% inversa. Si hay varias soluciones posibles, expr�selas como vectores para
% cada componente por separado. De este modo, la primera soluci�n ser�a q1(1), q2(1),
% q3(1), la segunda soluci�n q1(2), q2(2), q3(2), etc.

s2a = (-2*x*L2 + sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2)));
s2b = (-2*x*L2 - sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2)));

if(abs(s2a) < 1e-12) s2a = 0; end
if(abs(s2b) < 1e-12) s2b = 0; end

c2a = sqrt(1 - s2a^2);
c2b = -sqrt(1 - s2a^2);
c2c = sqrt(1 - s2b^2);
c2d = -sqrt(1 - s2b^2);

if(abs(c2a) < 1e-12) c2a = 0; end
if(abs(c2b) < 1e-12) c2b = 0; end
if(abs(c2c) < 1e-12) c2c = 0; end
if(abs(c2d) < 1e-12) c2d = 0; end

q2 = [atan2(s2a,c2a),atan2(s2a,c2b),atan2(s2b,c2c),atan2(s2b,c2d)];
%   q3(1,:) = (-x - L2*sin(q2(1,:)))/cos(q2(1,:)) - L3A;
q3(1) = (-x - L2*sin(q2(1)))/cos(q2(1)) - L3A;
q3(2) = (-x - L2*sin(q2(2)))/cos(q2(2)) - L3A;
q3(3) = (-x - L2*sin(q2(3)))/cos(q2(3)) - L3A;
q3(4) = (-x - L2*sin(q2(4)))/cos(q2(4)) - L3A;

    c1(1) = (L3A + q3(1) + x*cos(q2(1)) + ((y*sin(q2(1)))/(z - L0))*...
        (L3B + L1))/((L0 - z)*sin(q2(1)) - (y^2*sin(q2(1)))/(z - L0));
    s1(1) = (-L3B - L1 -y*c1(1))/(z - L0);
    c1(2) = (L3A + q3(2) + x*cos(q2(2)) + ((y*sin(q2(2)))/(z - L0))*...
        (L3B + L1))/((L0 - z)*sin(q2(2)) - (y^2*sin(q2(2)))/(z - L0));
    s1(2) = (-L3B - L1 -y*c1(2))/(z - L0);
    c1(3) = (L3A + q3(3) + x*cos(q2(3)) + ((y*sin(q2(3)))/(z - L0))*...
        (L3B + L1))/((L0 - z)*sin(q2(3)) - (y^2*sin(q2(3)))/(z - L0));
    s1(3) = (-L3B - L1 -y*c1(3))/(z - L0);
    c1(4) = (L3A + q3(4) + x*cos(q2(4)) + ((y*sin(q2(4)))/(z - L0))*...
        (L3B + L1))/((L0 - z)*sin(q2(4)) - (y^2*sin(q2(4)))/(z - L0));
    s1(4) = (-L3B - L1 -y*c1(4))/(z - L0);

q1 = [atan2(s1(1),c1(1)),atan2(s1(2),c1(2)),atan2(s1(3),c1(3)),atan2(s1(4),c1(4))];

% ----------------------------------------------------------------------  
% Variables de salida. No las modifique.
q=[q1;q2;q3];
end