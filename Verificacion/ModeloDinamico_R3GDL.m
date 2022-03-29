% -------------------------------------------------
% APARTADO B1 - Modelo dinámico inverso
% -------------------------------------------------

function [qdd] = ModeloDinamico_R3GDL(in)
% Variables de entrada en la funcion: [q(3)  qp(3)  Tau(3)]
q1        = in(1);
q2        = in(2);
q3        = in(3);
qd1       = in(4);
qd2       = in(5);
qd3       = in(6);
Tau1      = in(7);
Tau2      = in(8);
Tau3      = in(9);

% A rellenar por el alumno



% Aceleraciones
  qdd = [0;0;0];
  