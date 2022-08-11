%%%Modelo cinemático directo

tabla3 = tablaDH_3gdl();

theta3 = [tabla3(2,1) tabla3(3,1) tabla3(4,1)];
d3     = [tabla3(2,2) tabla3(3,2) tabla3(4,2)];
a3     = [tabla3(2,3) tabla3(3,3) tabla3(4,3)];
alpha3 = [tabla3(2,4) tabla3(3,4) tabla3(4,4)];

% ab0_3 = ab0;

a01_3 = simplify(trotz(theta3(1))*transl([0 0 d3(1)])*transl([a3(1) 0 0])*trotx(alpha3(1)));
a12_3 = simplify(trotz(theta3(2))*transl([0 0 d3(2)])*transl([a3(2) 0 0])*trotx(alpha3(2)));
a23_3 = simplify(trotz(theta3(3))*transl([0 0 d3(3)])*transl([a3(3) 0 0])*trotx(alpha3(3)));

T03 = simplify(a01_3*a12_3*a23_3);

n = T03(1:3,1); o = T03(1:3,2); a = T03(1:3,3); p = T03(1:3,4);

nx = n(1); ny = n(2); nz = n(3);
ox = o(1); oy = o(2); oz = o(3);
ax = a(1); ay = a(2); az = a(3);

% Posición del extremo del robot (lo que nos interesa)
px = p(1); py = p(2); pz = p(3);

% RPY = tr2rpy(t03);
% eul = rotm2eul(t03(1:3,1:3))

rotm = [n, o, a];

% eul = rotm2eul(rotm, 'ZXZ');

% Ángulos Euler ZXZ:
% R = [n o a] = rotz(phi)*rotx(theta)*rotz(psi);
syms phi theta psi real;
R = simplify(rotz(phi)*rotx(theta)*rotz(psi));
