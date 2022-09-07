% Cálculo jacobiana directa e inversa.
syms q1 q2 q3 L0 L1 L2 L3A L3B real;

px = - cos(q2)*(L3A + q3) - L2*sin(q2);
py = sin(q1)*sin(q2)*(L3A + q3) - L3B*cos(q1) - L1*cos(q1) - L2*cos(q2)*sin(q1);
pz = L0 - L1*sin(q1) - L3B*sin(q1) - cos(q1)*sin(q2)*(L3A + q3) + L2*cos(q1)*cos(q2);

J(1,1) = simplify(diff(px,q1));
J(1,2) = simplify(diff(px,q2));
J(1,3) = simplify(diff(px,q3));
J(2,1) = simplify(diff(py,q1));
J(2,2) = simplify(diff(py,q2));
J(2,3) = simplify(diff(py,q3));
J(3,1) = simplify(diff(pz,q1));
J(3,2) = simplify(diff(pz,q2));
J(3,3) = simplify(diff(pz,q3));

J = simplify(J);

detj = simplify(det(J));

Jinv = simplify(inv(J));

detjinv = simplify(det(Jinv));

% Para calcular numéricamente, emplear la función subs();