% Cálculos para la CI

syms q2 real;
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B real;
syms px py pz;

R = sqrt((L0 - pz)^2 + py^2);
alpha = atan2(py, L0 - pz);
A = L1 + L3B;

s2 = (-2*px*L2 + sqrt(4*px^2*L2^2 - 4*(px^2 + (R^2 - A^2))*(L2^2 - (R^2 - A^2))))/(2*(px^2 + (R^2 - A^2))); %ó -sqrt
c2 = sqrt(1 - s2^2);% ó -sqrt

q2 = atan2(s2,c2);

q3 = (-px - L2*s2)/c2 - L3A;

c1 = (L3A + q3 + px*c2 + (py*s2)/(pz - L0)*(L3B + L1))/((L0 - pz)*s2 - (py^2*s2)/(pz - L0));
s1 = (-L3B - L1 - py*c1)/(pz - L0);

q1 = atan2(s1,c1);