% -------------------------------------------------
% APARTADO A6 - Jacobianos
% -------------------------------------------------

function [Jdir,Jinv] = jacobiano
  % Desarrolle aqu� el c�digo necesario para determinar los Jacobianos 
  % directo (Jdir) e inverso (Jinv)
  % El c�lculo se realizar� de modo exclusivamente simb�lico

% Definici�n de variables simb�licas  
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B L4 L4A L4B L5 L5A L5B L6 L6A L6B real  
syms x y z q1 q2 q3 real  
PI = sym(pi); % use PI (en may�sculas) para referirse a pi.
  
x = - cos(q2)*(L3A + q3) - L2*sin(q2);
y = sin(q1)*sin(q2)*(L3A + q3) - L3B*cos(q1) - L1*cos(q1) - L2*cos(q2)*sin(q1);
z = L0 - L1*sin(q1) - L3B*sin(q1) - cos(q1)*sin(q2)*(L3A + q3) + L2*cos(q1)*cos(q2);



% Jacobiano directo  
Jdir = zeros(3,3); % C�mbielo por su soluci�n
% Jacobiano inverso  
Jinv = zeros(3,3); % C�mbielo por su soluci�n
  
end



  