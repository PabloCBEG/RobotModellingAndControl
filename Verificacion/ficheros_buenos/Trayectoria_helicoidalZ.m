% Trayectoria helicoidal a lo largo de un eje paralelo a Z
% Pasamos coordenadas XYZ que conforman una circunferencia en el plano XY a
% las ecuaciones de la cinemática inversa para obtener las coordenadas
% articulares que se desarrollan durante dicha trayectoria, y sumamos una
% coordenada z creciente

% Queremos trazar una hélice de radio r = 0.5
% con centro en XB = -1.5, YB = -1.5, eje vertical (o sea con
% coordenada ZB creciente)

function qc = Trayectoria_helicoidalZ()

% Trayectoria con centro en [-1.5,-1.5,z]
alfa = [0:0.01:8*pi];
r = sin(alfa)/2; % Partimos el seno por la mitad para tener un radio más
                 % pequeño. Eso hace la trayectoria más sencilla para el
                 % robot.
beta = alfa + pi/2;

x = -1.5 + r.*cos(alfa).*sin(beta);
y = -1.5 + r.*sin(alfa).*sin(beta);
z = [1:1/(length(x)-1):2];
% z = sin(1*alfa); % Otra posibilidad para generar trayectorias, a variar
% el factor "1" que multiplica a alfa para cambiar la frecuencia de z

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
title('Trayectoria helicoidal-trébol con eje vertical');
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

end
