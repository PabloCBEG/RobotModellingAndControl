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
  
  A = L1 + L3B;
  R = sqrt((L0 - z)^2 + y^2);
  
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
%           Aquí "estamos perdiendo una solución" por no usar también el
%           signo negativo de la raíz, pero, en realidad, pienso que no
%           tendríamos por qué calcular esta solución, en caso de que q2=0.
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
  
%   q1 = [L0*atan2(x,y),   -L0*atan2(x,y)]; % Ejemplo de Cin. Inversa con dos soluciones. Cámbiela por su solución
%   q2 = [L2 + z,          L2 + z,       ]; % Ejemplo de Cin. Inversa con dos soluciones. Cámbiela por su solución
%   q3 = [L1  ,            L1            ]; % Ejemplo de Cin. Inversa con dos soluciones. Cámbiela por su solución



  % ----------------------------------------------------------------------  
  % Variables de salida. No las modifique.                                           
  q=[q1;q2;q3];
end



  