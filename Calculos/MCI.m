%%%Modelo cinemático directo

tabla3 = tablaDH_3gdl();

theta3 = [tabla3(1,1) tabla3(2,1) tabla3(3,1) tabla3(4,1)];
d3     = [tabla3(1,2) tabla3(2,2) tabla3(3,2) tabla3(4,2)];
a3     = [tabla3(1,3) tabla3(2,3) tabla3(3,3) tabla3(4,3)];
alpha3 = [tabla3(1,4) tabla3(2,4) tabla3(3,4) tabla3(4,4)];

ab03 = simplify(trotz(theta3(1))*transl([0 0 d3(1)])*transl([a3(1) 0 0])*trotx(alpha3(1)));

a01_3 = simplify(trotz(theta3(2))*transl([0 0 d3(2)])*transl([a3(2) 0 0])*trotx(alpha3(2)));
a12_3 = simplify(trotz(theta3(3))*transl([0 0 d3(3)])*transl([a3(3) 0 0])*trotx(alpha3(3)));
a23_3 = simplify(trotz(theta3(4))*transl([0 0 d3(4)])*transl([a3(4) 0 0])*trotx(alpha3(4)));

T03 = simplify(a01_3*a12_3*a23_3);
T03b = simplify(ab03*a01_3*a12_3*a23_3);

n = T03(1:3,1); o = T03(1:3,2); a = T03(1:3,3); p = T03(1:3,4);
nb = T03b(1:3,1); ob = T03b(1:3,2); ab = T03b(1:3,3); pb = T03b(1:3,4);

% Sin tener en cuenta la base
nx = n(1); ny = n(2); nz = n(3);
ox = o(1); oy = o(2); oz = o(3);
ax = a(1); ay = a(2); az = a(3);

% Teniendo en cuenta la base
nxb = nb(1); nyb = nb(2); nzb = nb(3);
oxb = ob(1); oyb = ob(2); ozb = ob(3);
axb = ab(1); ayb = ab(2); azb = ab(3);

% Posición del extremo del robot (lo que nos interesa)
px = p(1); py = p(2); pz = p(3);
pxb = pb(1); pyb = pb(2); pzb = pb(3);

% RPY = tr2rpy(t03);
% eul = rotm2eul(t03(1:3,1:3))

rotm = [n, o, a];
rotmb = [nb, ob, ab];

% eul = rotm2eul(rotm, 'ZXZ');

% Ángulos Euler ZXZ:
% R = [n o a] = rotz(phi)*rotx(theta)*rotz(psi);
syms phi theta psi real;
R = simplify(rotz(phi)*rotx(theta)*rotz(psi));

% CINEMÁTICA INVERSA
ec1 = simplify(ab03\T03b); %inv(ab03)*T03b);
ec1bis = simplify(a01_3*a12_3*a23_3);
ec2 = simplify(a01_3\(ab03\T03b)); %inv(a01_3)*inv(ab03)*T03b);
ec2bis = simplify(a12_3*a23_3);
ec3 = simplify(a12_3\(a01_3\(ab03\T03b)));%inv(a12_3)*inv(a01_3)*inv(ab03)*T03b);
ec3bis = simplify(a23_3);

syms nsx nsy nsz osx osy osz asx asy asz psx psy psz real;
Ts = [nsx, osx, asx, psx; nsy, osy, asy, psy; nsz, osz, asz, psz; 0, 0, 0, 1];
ec1s = simplify(ab03\Ts);
ec2s = simplify(a01_3\(ab03\Ts));
ec3s = simplify(a12_3\(a01_3\(ab03\Ts)));

% Cálculos
% proyecto.teach([pi/2,pi/2,0,pi/2]);
% proyecto.maniplty(q, options); % Puede ser util para detectar puntos
% singulares