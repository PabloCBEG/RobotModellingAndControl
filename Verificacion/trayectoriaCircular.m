% -------------------------------------------------
% APARTADO A5 - Trayectoria circular en cartesianas
% -------------------------------------------------

function [x,y,z,q1,q2,q3] = trayectoriaCircular
  
  % Desarrolle aqu� el c�digo necesario para calcular una trayectoria 
  % circular en cartesianas, cuyos valores deber� guardar en los vectores x,y,z
  % as� como las correspondiente coordenadas articulares q1,q2,q3.
  % El c�digo ser� tal que para cualquier componente i de los vectores
  
  % Trayectoria con centro en [-1.5,-1.5,2]
  r = 0.5;
  alfa = [0:0.001:2*pi];
  
  x = -1.5 + r*cos(alfa);
  y = -1.5 + r*sin(alfa);
  z = 2 + zeros(1,length(x));
  
  xyz = [x; y; z];
  xyz = xyz';
  
  for i = 1:length(x)
      q(:,i) = CinematicaInversa_mejor([x(i),y(i),z(i)]);
  end
  
  x = xyz(:,1); % Cambiar estos valores por los que corresponda
  y = xyz(:,2);
  z = xyz(:,3);
  q1 = q(1,:);
  q2 = q(2,:);
  q3 = q(3,:);
  end



  