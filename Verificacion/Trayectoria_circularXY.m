% Trayectoria circular en el plano XY
% Pasamos coordenadas XYZ que conforman una circunferencia en el plano XY a
% las ecuaciones de la cinemática inversa para obtener las coordenadas
% articulares que se desarrollan durante dicha trayectoria

% Queremos trazar una circunferencia de radio r = 2*sqrt(L1^2 + (L2/2)^2)
% con centro en XB = 0, YB = 0, ZB = 2, contenida en el plano XY (o sea con
% coordenada ZB constante)

% x = [-2*sqrt(0.5):0.01:2*sqrt(0.5)];
% y = [-2*sqrt(0.5):0.01:2*sqrt(0.5)];
% z = 2 + zeros(1,length(x));

function qc = Trayectoria_circularXY()

% % Trayectoria con centro en [0,0,2]
% r = 2*sqrt(0.5);
% alfa = [0:0.001:2*pi];
% 
% x = r*cos(alfa);
% y = r*sin(alfa);
% z = 2 + zeros(1,length(x));
% 
% for i = 1:length(x)
%     q(:,i) = CinematicaInversa_mejor([x(i),y(i),z(i)]);
% end
% 
% qc = [pi/2 + zeros(1,length(x)); q];

% Trayectoria con centro en [-1.5,-1.5,2]
r = 0.5;
alfa = [0:0.001:2*pi];

x = -1.5 + r*cos(alfa);
y = -1.5 + r*sin(alfa);
z = 2 + zeros(1,length(x));

for i = 1:length(x)
    q(:,i) = CinematicaInversa_mejor([x(i),y(i),z(i)]);
end

qc = [pi/2 + zeros(1,length(x)); q];

end
