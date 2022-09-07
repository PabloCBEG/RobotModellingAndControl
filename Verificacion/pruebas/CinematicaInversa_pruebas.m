% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa numérica
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCIÓN DEBE DEVOLVER UN VECTOR/MATRIZ NUMÉRICO q
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBIÉN NUMÉRICO CON LA POSICIÓN EN 
% CARTESIANAS DEL EXTREMO DE LA ARTICULACIÓN 3, (x,y,z)
% EN CASO DE MÚLTIPLES SOLUCIONES, EL RESULTADO SERÁ UNA MATRIZ q, DE MODO
% QUE CADA COLUMNA REPRESENTA UNA POSIBLE SOLUCIÓN.

x = -1.0;
y = -1.0;
z = 2.0;

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
alpha = atan2(y, L0 - z);

% s2a = (-2*x*L2 + sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2))); %ó -sqrt
% s2b = (-2*x*L2 - sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2)));
% 
% if(s2a < 1e-12) s2a = 0; end
% if(s2b < 1e-12) s2b = 0; end
% 
% c2a = sqrt(1 - s2a^2);
% c2b = -sqrt(1 - s2a^2);
% c2c = sqrt(1 - s2b^2);
% c2d = -sqrt(1 - s2b^2);
% 
% % q3 = (-x - L2*sin(q2))/cos(q2) - L3A;
% 
% % c1 = (L3A + q3 + x*cos(q2) + ((y*sin(q2))/(z - L0))*(L3B + L1))/((L0 - z)*sin(q2) - (y^2*sin(q2))/(z - L0));
% % s1 = (-L3B - L1 -y*c1)/(z - L0);
% 
% % Escriba a continuación las expresiones numéricas de su cinemática
% % inversa. Si hay varias soluciones posibles, expréselas como vectores para
% % cada componente por separado. De este modo, la primera solución sería q1(1), q2(1),
% % q3(1), la segunda solución q1(2), q2(2), q3(2), etc.
% 
% q2 = [atan2(s2a,c2a),atan2(s2a,c2b),atan2(s2a,c2c),atan2(s2a,c2d),...
%       atan2(s2b,c2a),atan2(s2b,c2b),atan2(s2b,c2c),atan2(s2b,c2d)];
% %   q3(1,:) = (-x - L2*sin(q2(1,:)))/cos(q2(1,:)) - L3A;
% q3(1) = (-x - L2*sin(q2(1)))/cos(q2(1)) - L3A;
% q3(2) = (-x - L2*sin(q2(2)))/cos(q2(2)) - L3A;
% q3(3) = (-x - L2*sin(q2(3)))/cos(q2(3)) - L3A;
% q3(4) = (-x - L2*sin(q2(4)))/cos(q2(4)) - L3A;
% q3(5) = (-x - L2*sin(q2(5)))/cos(q2(5)) - L3A;
% q3(6) = (-x - L2*sin(q2(6)))/cos(q2(6)) - L3A;
% q3(7) = (-x - L2*sin(q2(7)))/cos(q2(7)) - L3A;
% q3(8) = (-x - L2*sin(q2(8)))/cos(q2(8)) - L3A;
% 
%     c1(1) = (L3A + q3(1) + x*cos(q2(1)) + ((y*sin(q2(1)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(1)) - (y^2*sin(q2(1)))/(z - L0));
%     s1(1) = (-L3B - L1 -y*c1(1))/(z - L0);
%     c1(2) = (L3A + q3(2) + x*cos(q2(2)) + ((y*sin(q2(2)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(2)) - (y^2*sin(q2(2)))/(z - L0));
%     s1(2) = (-L3B - L1 -y*c1(2))/(z - L0);
%     c1(3) = (L3A + q3(3) + x*cos(q2(3)) + ((y*sin(q2(3)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(3)) - (y^2*sin(q2(3)))/(z - L0));
%     s1(3) = (-L3B - L1 -y*c1(3))/(z - L0);
%     c1(4) = (L3A + q3(4) + x*cos(q2(4)) + ((y*sin(q2(4)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(4)) - (y^2*sin(q2(4)))/(z - L0));
%     s1(4) = (-L3B - L1 -y*c1(4))/(z - L0);
%     c1(5) = (L3A + q3(5) + x*cos(q2(5)) + ((y*sin(q2(5)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(5)) - (y^2*sin(q2(5)))/(z - L0));
%     s1(5) = (-L3B - L1 -y*c1(5))/(z - L0);
%     c1(6) = (L3A + q3(6) + x*cos(q2(6)) + ((y*sin(q2(6)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(6)) - (y^2*sin(q2(6)))/(z - L0));
%     s1(6) = (-L3B - L1 -y*c1(6))/(z - L0);
%     c1(7) = (L3A + q3(7) + x*cos(q2(7)) + ((y*sin(q2(7)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(7)) - (y^2*sin(q2(7)))/(z - L0));
%     s1(7) = (-L3B - L1 -y*c1(7))/(z - L0);
%     c1(8) = (L3A + q3(8) + x*cos(q2(8)) + ((y*sin(q2(8)))/(z - L0))*...
%         (L3B + L1))/((L0 - z)*sin(q2(8)) - (y^2*sin(q2(8)))/(z - L0));
%     s1(8) = (-L3B - L1 -y*c1(8))/(z - L0);
% 
% q1 = [atan2(s1(1),c1(1)),atan2(s1(2),c1(2)),atan2(s1(3),c1(3)),atan2(s1(4),c1(4)),...
%     atan2(s1(5),c1(5)),atan2(s1(6),c1(6)),atan2(s1(7),c1(7)),atan2(s1(8),c1(8))];

s2 = (-2*x*L2 - sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2)));
c2 = sqrt(1 - s2^2);
q2 = atan2(s2,c2);

q3 = (-x - L2*sin(q2))/cos(q2) - L3A;

c1 = (L3A + q3 + x*cos(q2) + ((y*sin(q2))/(z - L0))*(L3B + L1))/((L0 - z)*sin(q2) - (y^2*sin(q2))/(z - L0));
s1 = (-L3B - L1 - y*c1)/(z - L0);

q1 = atan2(s1,c1);

% ----------------------------------------------------------------------  
% Variables de salida. No las modifique.
q=[q1;q2;q3];