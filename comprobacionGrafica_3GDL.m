L0 = 1;
L1 = 0.5;
L2 = 1;
L3A = 1;
L3B = 0.5;
L3 = sqrt(L3A^2 + L3B^2);
% L4 = 1.5;
% L5 = 1.5;
% L6 = 0.5;

clear L
%             th        d       a       alpha
L(1) = Link([ pi/2      L0      0       pi/2        0], 'standard');
L(2) = Link([ pi/2      0       0       pi/2        0], 'standard', 'revolute');
L(3) = Link([ 0         L1      L2      -pi/2       0], 'standard', 'revolute');
L(4) = Link([ pi/2      L3A    	-L3B    0           0], 'standard', 'prismatic');
% L(5) = Link([ pi        L4      0       pi/2        0], 'standard');
% L(6) = Link([ 0         L5      0       pi/2        0], 'standard');
% L(7) = Link([ 0         L6      0       0           0], 'standard');
%Antes de introducir L(1) para la base (con las coordenadas articulares de
%la base)//tal y como está definido ahora, la configuración del robot es
%correcta, pero está mal orientada: está construido como si la articulación
%1 fuese de rotación respecto del eje vertical, cuando es respecto del eje
%horizontal. Seguramente falle yo al definir algo.
%Una vez introducida L(1) con la base//ahora funciona. La representación
%gráfica del robot coincide con lo que tenemos: como conclusión, importante
%tener en cuenta la base cuando queremos coordenadas absolutas (era fácil
%de intuir).

proyecto = SerialLink(L, 'name', 'Manipulador proyecto','manufacturer','Dpto. Sistemas y Automática - ETSI - US');

qz = [0 0 0 0]; % zero angles
qr = [pi/2 pi/2 0 pi/2]; % postura dibujo
%Extraño ahora es que deba introducir en qr los "offset" en las
%articulaciones para que el robot tenga la posición correcta

proyecto.plot(qr,'jointdiam',1,'jaxes','joints');
% Notar que al introducir la base, ese sistema de coordenadas, lo
% interpreta como una articulación, en concreto de tipo prismático. Eso no
% me gusta. Lo cambiaremos.