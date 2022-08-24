% -------------------------------------------------
% APARTADO A4 - Cinemática Inversa numérica
% -------------------------------------------------

% IMPORTANTE: ESTA FUNCIÓN DEBE DEVOLVER UN VECTOR/MATRIZ NUMÉRICO q
% CUANDO RECIBE DE ENTRADA UN VECTOR TAMBIÉN NUMÉRICO CON LA POSICIÓN EN 
% CARTESIANAS DEL EXTREMO DE LA ARTICULACIÓN 3, (x,y,z)
% EN CASO DE MÚLTIPLES SOLUCIONES, EL RESULTADO SERÁ UNA MATRIZ q, DE MODO
% QUE CADA COLUMNA REPRESENTA UNA POSIBLE SOLUCIÓN.

function q = Copy_of_CinematicaInversa(in)
x = in(1);           % Posición cartesianas
y = in(2);           % 
z = in(3);           % 

% ------ SOLO DEBE ALTERAR LAS EXPRESIONES ENTRE ESTAS LÍNEAS ----------
% SUSTITUYA los valores L0, L1, etc por sus valores numéricos
L0 = 1;
L1 = 0.5;
L2 = 1;
L3A = 1;
L3B = 0.5;
% L3 = sqrt(L3A^2 + L3B^2);

R = sqrt((L0 - z)^2 + y^2);
% alpha = atan2(y, L0 - z);
A = L1 + L3B;
syms solucion real;

s2a = (-2*x*L2 + sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2))); %ó -sqrt
s2b = (-2*x*L2 - sqrt(4*x^2*L2^2 - 4*(x^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(x^2 + (R^2 - A^2)));
% No tenemos en cuenta la duplicidad del signo de R, porque en las ecs
% siempre aparece elevada al cuadrado
c2a = sqrt(1 - s2a^2);% ó -sqrt
c2b = -sqrt(1 - s2a^2);
c2c = sqrt(1 - s2b^2);
c2d = -sqrt(1 - s2b^2);

q2a = atan2(s2a,c2a);
q2b = atan2(s2a,c2b);
q2c = atan2(s2a,c2c);
q2d = atan2(s2a,c2d);
q2e = atan2(s2b,c2a);
q2f = atan2(s2b,c2b);
q2g = atan2(s2b,c2c);
q2h = atan2(s2b,c2d);

q2 = zeros(4096,1);
q2(1) = q2a; q2(2) = q2b; q2(3) = q2c; q2(4) = q2d;
q2(5) = q2e; q2(6) = q2f; q2(7) = q2g; q2(8) = q2h;

q3a = (-x - L2*s2a)/c2a - L3A;
q3b = (-x - L2*s2a)/c2b - L3A;
q3c = (-x - L2*s2a)/c2c - L3A;
q3d = (-x - L2*s2a)/c2d - L3A;
q3e = (-x - L2*s2b)/c2a - L3A;
q3f = (-x - L2*s2b)/c2b - L3A;
q3g = (-x - L2*s2b)/c2c - L3A;
q3h = (-x - L2*s2b)/c2d - L3A;

q3 = zeros(4096,1);
q3(1) = q3a; q3(2) = q3b; q3(3) = q3c; q3(4) = q3d;
q3(5) = q3e; q3(6) = q3f; q3(7) = q3g; q3(8) = q3h;

c1aa = (L3A + q3a + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ab = (L3A + q3a + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ac = (L3A + q3a + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ad = (L3A + q3a + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ae = (L3A + q3a + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1af = (L3A + q3a + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1ag = (L3A + q3a + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1ah = (L3A + q3a + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1ba = (L3A + q3b + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1bb = (L3A + q3b + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1bc = (L3A + q3b + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1bd = (L3A + q3b + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1be = (L3A + q3b + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1bf = (L3A + q3b + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1bg = (L3A + q3b + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1bh = (L3A + q3b + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1ca = (L3A + q3c + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1cb = (L3A + q3c + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1cc = (L3A + q3c + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1cd = (L3A + q3c + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ce = (L3A + q3c + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1cf = (L3A + q3c + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1cg = (L3A + q3c + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1ch = (L3A + q3c + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1da = (L3A + q3d + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1db = (L3A + q3d + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1dc = (L3A + q3d + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1dd = (L3A + q3d + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1de = (L3A + q3d + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1df = (L3A + q3d + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1dg = (L3A + q3d + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1dh = (L3A + q3d + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1ea = (L3A + q3e + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1eb = (L3A + q3e + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ec = (L3A + q3e + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ed = (L3A + q3e + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ee = (L3A + q3e + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1ef = (L3A + q3e + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1eg = (L3A + q3e + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1eh = (L3A + q3e + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1fa = (L3A + q3f + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1fb = (L3A + q3f + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1fc = (L3A + q3f + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1fd = (L3A + q3f + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1fe = (L3A + q3f + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1ff = (L3A + q3f + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1fg = (L3A + q3f + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1fh = (L3A + q3f + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1ga = (L3A + q3g + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1gb = (L3A + q3g + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1gc = (L3A + q3g + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1gd = (L3A + q3g + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1ge = (L3A + q3g + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1gf = (L3A + q3g + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1gg = (L3A + q3g + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1gh = (L3A + q3g + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1ha = (L3A + q3h + x*c2a + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1hb = (L3A + q3h + x*c2b + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1hc = (L3A + q3h + x*c2c + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1hd = (L3A + q3h + x*c2d + (y*s2a)/(z - L0)*(L3B + L1))/((L0 - z)*s2a - (y^2*s2a)/(z - L0));
c1he = (L3A + q3h + x*c2a + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1hf = (L3A + q3h + x*c2b + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1hg = (L3A + q3h + x*c2c + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));
c1hh = (L3A + q3h + x*c2d + (y*s2b)/(z - L0)*(L3B + L1))/((L0 - z)*s2b - (y^2*s2b)/(z - L0));

c1 = [  c1aa,c1ab,c1ac,c1ad,c1ae,c1af,c1ag,c1ah,...
        c1ba,c1bb,c1bc,c1bd,c1be,c1bf,c1bg,c1bh,...
        c1ca,c1cb,c1cc,c1cd,c1ce,c1cf,c1cg,c1ch,...
        c1da,c1db,c1dc,c1dd,c1de,c1df,c1dg,c1dh,...
        c1ea,c1eb,c1ec,c1ed,c1ee,c1ef,c1eg,c1eh,...
        c1fa,c1fb,c1fc,c1fd,c1fe,c1ff,c1fg,c1fh,...
        c1ga,c1gb,c1gc,c1gd,c1ge,c1gf,c1gg,c1gh,...
        c1ha,c1hb,c1hc,c1hd,c1he,c1hf,c1hg,c1hh];
c1 = c1';

s1 = zeros(64,1);    
    
for i = 1:64
    s1(i) = (-L3B - L1 - y*c1(i))/(z - L0);
end

q1 = zeros(4096,1);

for i = 1:64
    for j = 1:64
        q1(i*j,1) = atan2(s1(i,1),c1(j));
    end
end

q1 = q1'; q2 = q2'; q3 = q3';

% Escriba a continuación las expresiones numéricas de su cinemática
% inversa. Si hay varias soluciones posibles, expréselas como vectores para
% cada componente por separado. De este modo, la primera solución sería q1(1), q2(1),
% q3(1), la segunda solución q1(2), q2(2), q3(2), etc.

% q1 = [atan2(x,L0+y),   1]; 		% Ecuación de ejemplo. Cámbiela por su solución
% q3 = [y*x,             1];		% Ecuación de ejemplo. Cámbiela por su solución
% q2 = [x+z,             1]; 		% Ecuación de ejemplo. Cámbiela por su solución
% ----------------------------------------------------------------------  
% Variables de salida. No las modifique.
q=[q1;q2;q3];
end