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

if(abs(s2a) < 1e-12) s2a = 0;
elseif (abs(s2a) > 1)
        s2a = 0;
        fprintf('Error en el calculo de sin(q2)(+): solucion (1 y 2) no valida \n');
end
if(abs(s2b) < 1e-12) s2b = 0;
elseif (abs(s2b) > 1) 
        s2b = 0;
        fprintf('Error en el calculo de sin(q2)(-): solucion (3 y 4) no valida \n');
end

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

    for i=1:4
        if(q2(i) == 0)
            c1 = (-y + sqrt(y^2 - ((z - 1)^2 + y^2)*(1 - (z - 1)^2)))/((z - 1)^2 +y^2);%or -sqrt
%           Aqu� "estamos perdiendo una soluci�n" por no usar tambi�n el
%           signo negativo de la ra�z, pero, en realidad, pienso que no
%           tendr�amos por qu� calcular esta soluci�n, en caso de que q2=0.
            if(abs(c1) > 1)
                fprintf('Error en el calculo de cos(q1): solucion no valida en indice %i \n',i);
                c1 = 0;
            end
            s1 = sqrt(1 - c1^2);% or -sqrt
            q1(i) = atan2(s1,c1);
        else
            c1(i) = (L3A + q3(i) + x*cos(q2(i)) + ((y*sin(q2(i)))/(z - L0))*...
                (L3B + L1))/((L0 - z)*sin(q2(i)) - (y^2*sin(q2(i)))/(z - L0));
            if(abs(c1(i)) > 1)
                fprintf('Error en el calculo de cos(q1): solucion no valida en indice %i \n',i);
                c1(i) = 0;
            end
            s1(i) = (-L3B - L1 -y*c1(i))/(z - L0);
            q1(i) = atan2(s1(i),c1(i));
        end
    end

    

% ----------------------------------------------------------------------  
% Variables de salida. No las modifique.
% q=[q1;q2;q3];
q=[q1(3);q2(3);q3(3)];
end