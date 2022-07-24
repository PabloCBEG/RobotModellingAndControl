% Calculo de las matrices de transformacion

tabla = tablaDH();

theta = [tabla(1,1) tabla(2,1) tabla(3,1) tabla(4,1) tabla(5,1) tabla(6,1)];
d     = [tabla(1,2) tabla(2,2) tabla(3,2) tabla(4,2) tabla(5,2) tabla(6,2)];
a     = [tabla(1,3) tabla(2,3) tabla(3,3) tabla(4,3) tabla(5,3) tabla(6,3)];
alpha = [tabla(1,4) tabla(2,4) tabla(3,4) tabla(4,4) tabla(5,4) tabla(6,4)];

a01 = simplify(trotz(theta(1))*transl([0 0 d(1)])*transl([a(1) 0 0])*trotx(alpha(1)));
a12 = simplify(trotz(theta(2))*transl([0 0 d(2)])*transl([a(2) 0 0])*trotx(alpha(2)));
a23 = simplify(trotz(theta(3))*transl([0 0 d(3)])*transl([a(3) 0 0])*trotx(alpha(3)));
a34 = simplify(trotz(theta(4))*transl([0 0 d(4)])*transl([a(4) 0 0])*trotx(alpha(4)));
a45 = simplify(trotz(theta(5))*transl([0 0 d(5)])*transl([a(5) 0 0])*trotx(alpha(5)));
a56 = simplify(trotz(theta(6))*transl([0 0 d(6)])*transl([a(6) 0 0])*trotx(alpha(6)));

T06 = simplify(a01*a12*a23*a34*a45*a56);