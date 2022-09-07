% -------------------------------------------------
% APARTADO A5 - Trayectoria circular en cartesianas
% -------------------------------------------------

function [x,y,z,q1,q2,q3] = trayectoriaCircular
  
  % Desarrolle aquí el código necesario para calcular una trayectoria 
  % circular en cartesianas, cuyos valores deberá guardar en los vectores x,y,z
  % así como las correspondiente coordenadas articulares q1,q2,q3.
  % El código será tal que para cualquier componente i de los vectores
  
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
      % Añadir aquí un filtro para las singularidades (que simplemente
      % imprima por pantalla un aviso de singularidad):
%       if q(1,i) = %valor que provoca singularidad de q1
%           fprintf('Singularidad en el manipulador provocada por q1 = %f',q(1,i));
%       end %% q1 no provoca singularidades
      if (q(2,i) == 0 || q(2,i) == pi || q(2,i) == 2*pi)%valor que provoca singularidad de q2
          fprintf('Singularidad en el manipulador provocada por q2 = %f',q(2,i));
      end
      if q(3,i) == -1 %valor que provoca singularidad de q3
          fprintf('Singularidad en el manipulador provocada por q3 = %f',q(3,i));
      end
  end
  
      figure(1);
      set(gcf,'color','w');
      plot3(x, y, z);
      title('Trayectoria circular');
      xlabel('X');
      ylabel('Y');
      zlabel('Z');
      grid;

      figure(2);
      set(gcf,'color','w');
      sgtitle('Evolución de las coord. articulares');
      subplot(3,1,1);
      plot(q(1,:));
      title('q1');
      grid;
      subplot(3,1,2);
      plot(q(2,:));
      title('q2');
      grid;
      subplot(3,1,3);
      plot(q(3,:));
      title('q3');
      grid;
  
  q = q';
  
  x = xyz(:,1); % Cambiar estos valores por los que corresponda
  y = xyz(:,2);
  z = xyz(:,3);
  q1 = q(:,1);
  q2 = q(:,2);
  q3 = q(:,3);
  end



  