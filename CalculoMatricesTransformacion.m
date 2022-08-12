% Calculo de las matrices de transformacion

tabla = tablaDH();

theta = [tabla(1,1) tabla(2,1) tabla(3,1) tabla(4,1) tabla(5,1) tabla(6,1) tabla(7,1)]; %Empezamos por la fila 2, pues la 1 (primera fila de la tabla) se corresponde con la base fija
d     = [tabla(1,2) tabla(2,2) tabla(3,2) tabla(4,2) tabla(5,2) tabla(6,2) tabla(7,2)];
a     = [tabla(1,3) tabla(2,3) tabla(3,3) tabla(4,3) tabla(5,3) tabla(6,3) tabla(7,3)];
alpha = [tabla(1,4) tabla(2,4) tabla(3,4) tabla(4,4) tabla(5,4) tabla(6,4) tabla(7,4)];

ab0 = simplify(trotz(theta(1))*transl([0 0 d(1)])*transl([a(1) 0 0])*trotx(alpha(1)));

a01 = simplify(trotz(theta(2))*transl([0 0 d(2)])*transl([a(2) 0 0])*trotx(alpha(2)));
a12 = simplify(trotz(theta(3))*transl([0 0 d(3)])*transl([a(3) 0 0])*trotx(alpha(3)));
a23 = simplify(trotz(theta(4))*transl([0 0 d(4)])*transl([a(4) 0 0])*trotx(alpha(4)));
a34 = simplify(trotz(theta(5))*transl([0 0 d(5)])*transl([a(5) 0 0])*trotx(alpha(5)));
a45 = simplify(trotz(theta(6))*transl([0 0 d(6)])*transl([a(6) 0 0])*trotx(alpha(6)));
a56 = simplify(trotz(theta(7))*transl([0 0 d(7)])*transl([a(7) 0 0])*trotx(alpha(7)));

% Esta matriz de transformación va desde el sistema coordenado 0, NO LA
% BASE, hasta la garra. Para incluir la base, premultiplicar por ab0
T06 = simplify(a01*a12*a23*a34*a45*a56);

%------- PARA 3 GDL -------------------------------------------------------

tabla3 = tablaDH_3gdl();

theta3 = [tabla3(1,1) tabla3(2,1) tabla3(3,1) tabla3(4,1)];
d3     = [tabla3(1,2) tabla3(2,2) tabla3(3,2) tabla3(4,2)];
a3     = [tabla3(1,3) tabla3(2,3) tabla3(3,3) tabla3(4,3)];
alpha3 = [tabla3(1,4) tabla3(2,4) tabla3(3,4) tabla3(4,4)];

% ab0_3 = ab0;
ab03 = simplify(trotz(theta3(1))*transl([0 0 d3(1)])*transl([a3(1) 0 0])*trotx(alpha3(1)));

a01_3 = simplify(trotz(theta3(2))*transl([0 0 d3(2)])*transl([a3(2) 0 0])*trotx(alpha3(2)));
a12_3 = simplify(trotz(theta3(3))*transl([0 0 d3(3)])*transl([a3(3) 0 0])*trotx(alpha3(3)));
a23_3 = simplify(trotz(theta3(4))*transl([0 0 d3(4)])*transl([a3(4) 0 0])*trotx(alpha3(4)));

% Esta matriz de transformación va desde el sistema coordenado 0, NO LA
% BASE, hasta la "garra". Para incluir la base, premultiplicar por ab0
T03 = simplify(a01_3*a12_3*a23_3);

T03b = simplify(ab0*a01_3*a12_3*a23_3);
