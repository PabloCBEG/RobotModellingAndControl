% Ejemplo de la utilización del algoritmo de Newton Euler para la dinámica
% de un robot de 3 DGL
% M.G. Ortega (2020)

% Elegir entre R (rotación) y P (prismática)
Tipo_Q1 = 'R'; % A modo de ejemplo
Tipo_Q2 = 'R';
Tipo_Q3 = 'P';

if ( (Tipo_Q1 ~= 'R') & (Tipo_Q1 ~='P')); error('Elegir R o P para Tipo_Q1'); end;
if ( (Tipo_Q2 ~= 'R') & (Tipo_Q2 ~='P')); error('Elegir R o P para Tipo_Q2'); end;
if ( (Tipo_Q3 ~= 'R') & (Tipo_Q3 ~='P')); error('Elegir R o P para Tipo_Q3'); end;


% Definición de variables simbólicas
syms T1 T2 T3 q1 qd1 qdd1 q2 qd2 qdd2 q3 qd3 qdd3 g real;  
PI = sym(pi); % Importante para cáculo simbólico

% DATOS CINEMÁTICOS DEL BRAZO DEL ROBOT
% Dimensiones (m)
  L0 = 1;               % Altura de la base
  L1 = 0.5;             % Eslabón 1
  L2 = 1;               % Eslabón 2
  L3A = 1; L3B = 0.5;   % Eslabón 3
  
% Parámetros de Denavit-Hartenberg (utilizado en primera regla de Newton-Euler)
% Eslabón base (no utilizado)
  theta0 = PI/2;        d0 = L0;        a0 = 0;     alpha0 = PI/2;
% Eslabón 1:
  theta1 = q1 + PI/2;   d1 = 0;         a1 = 0;     alpha1 = -PI/2;
% Eslabón 2:
  theta2 = q2;          d2 = L1;        a2 = L2;    alpha2 = -PI/2;
% Eslabón 3:
  theta3 = PI/2;        d3 = L3A + q3;  a3 = -L3B;  alpha3 = 0;
% Entre eslabón 3 y marco donde se ejerce la fuerza (a definir según
% experimento)
  theta4 = 0; d4 = 0; a4 = 0; alpha4 = 0;

% DATOS DINÁMICOS DEL BRAZO DEL ROBOT
% Eslabón 1
  m1 = 32.7982; % kg
  s11 = [0, 0, L1/2]'; % (m)  Posición del cdg del eslabón 1
  I11 = [0.817768453333333,  0,                  0;... % (kg.m2) Tensor de inercia del eslabón 1
         0,                  0.817768453333333,  0;...
         0,                  0,                  0.26894524] ;

% Eslabón 2
  m2 = 65.5965; % kg
  s22 = [-L2/2, 0, 0]'; % (m)  Posición del cdg del eslabón 2
  I22=[0.5378913,          0,                  0;... % (kg.m2) Tensor de inercia del eslabón 2
       0,                  5.73532065,         0;...
       0,                  0,                  5.73532065];

% Eslabón 3
  m3 = 98.3947; % kg
pcdm3a = [L3B, 0, -L3A/2];
pcdm3b = [L3B/2, 0, 0];
area = pi*(rext^2 - rint^2);
rho_lineal = rho*area; % kg/m
m3a = rho_lineal*L3A; m3b = rho_lineal*L3B;
  s33 = [(m3a*pcdm3a + m3b*pcdm3b)/m3]'; % (m) Posición del cdg del eslabón 3
  I33=[ 11.4706333622699,   0,                  2.73318560862358;... % (kg.m2) Tensor de inercia del eslabón 3
        0,                  13.3860498367935,   0;...
        2.73318560862358,   0,                  2.72225286618921] ;


% DATOS DE LOS MOTORES
% Inercias
  Jm1 = 0.00267942; Jm2 = 0.00288155; Jm3 = 0.00315627; % kg.m2
% Coeficientes de fricción viscosa
  Bm1 = 0.00019901; Bm2 = 0.000163655; Bm3 = 0.000270787; % N.m / (rad/s)
% Factores de reducción
  R1 = 40; R2 = 30; R3 = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ALGORITMO DE NEWTON-EULER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% wij : velocidad angular absoluta de eje j expresada en i
% wdij : aceleración angular absoluta de eje j expresada en i
% vij : velocidad lineal absoluta del origen del marco j expresada en i
% vdij : aceleración lineal absoluta del origen del marco j expresada en i
% aii : aceleración del centro de gravedad del eslabón i, expresado en i?

% fij : fuerza ejercida sobre la articulación j-1 (unión barra j-1 con j),
% expresada en i-1
%
% nij : par ejercido sobre la articulación j-1 (unión barra j-1 con j),
% expresada en i-1

% pii : vector (libre) que une el origen de coordenadas de i-1 con el de i,
% expresadas en i : [ai, di*sin(alphai), di*cos(alphai)] (a,d,aplha: parámetros de DH)
%
% sii : coordenadas del centro de masas del eslabón i, expresada en el sistema
% i

% Iii : matriz de inercia del eslabón i expresado en un sistema paralelo al
% i y con el origen en el centro de masas del eslabón
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% N-E 1: Asignación a cada eslabón de sistema de referencia de acuerdo con las normas de D-H.
  % Eslabón 1:
    p11 = [a1, d1*sin(alpha1), d1*cos(alpha1)]';
  % Eslabón 2:
    p22 = [a2, d2*sin(alpha2), d2*cos(alpha2)]';
  % Eslabón 3:
    p33 = [a3, d3*sin(alpha3), d3*cos(alpha3)]';
  % Entre eslabón 2 y marco donde se ejerce la fuerza (supongo que el mismo
  % que el Z0
    p44 = [a4, d4*sin(alpha4), d4*cos(alpha4)]';

% N-E 2: Condiciones iniciales de la base
  w00  = [0 0 0]';
  wd00 = [0 0 0]';
  v00  = [0 0 0]';
  vd00 = [0 0 g]'; % Aceleración de la gravedad en el eje Z0 negativo
  %---------------------Posible fuente error: sistema B o sistema 0??
%   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

% Condiciones iniciales para el extremo del robot
% PONER FUERZAS SALIENTES DEL ESLABÓN (= FUERZAS ENTRANTES CAMBIADAS DE
% SIGNO)
  f44= [0 0 0]';  
  n44= [0 0 0]';

% Definición de vector local Z
  Z=[0 0 1]';


% N-E 3: Obtención de las matrices de rotación (i)R(i-1) y de sus inversas
  R01=[cos(theta1) -cos(alpha1)*sin(theta1) sin(alpha1)*sin(theta1);
      sin(theta1)  cos(alpha1)*cos(theta1)  -sin(alpha1)*cos(theta1);
      0            sin(alpha1)                cos(alpha1)           ];
  R10= R01';

  R12=[cos(theta2) -cos(alpha2)*sin(theta2) sin(alpha2)*sin(theta2);
      sin(theta2)  cos(alpha2)*cos(theta2)  -sin(alpha2)*cos(theta2);
      0            sin(alpha2)              cos(alpha2)           ];
  R21= R12';

  R23=[cos(theta3) -cos(alpha3)*sin(theta3) sin(alpha3)*sin(theta3);
      sin(theta3)  cos(alpha3)*cos(theta3)  -sin(alpha3)*cos(theta3);
      0            sin(alpha3)              cos(alpha3)           ];
  R32= R23';

  R34=[cos(theta4) -cos(alpha4)*sin(theta4) sin(alpha4)*sin(theta4);
      sin(theta4)  cos(alpha4)*cos(theta4)  -sin(alpha4)*cos(theta4);
      0            sin(alpha4)              cos(alpha4)           ];
  R43= R34';


%%%%%%% ITERACIÓN HACIA EL EXTERIOR (CINEMÁTICA)

% N-E 4: Obtención de las velocidades angulares absolutas
 % Articulación 1
    if (Tipo_Q1=='R');
        w11= R10*(w00+Z*qd1);  % Si es de rotación
    else
        w11 = R10*w00;      % Si es de translación
    end
 % Articulación 2
    if (Tipo_Q2=='R');
        w22= R21*(w11+Z*qd2);  % Si es de rotación
    else
        w22 = R21*w11;      % Si es de translación
    end
 % Articulación 3
    if (Tipo_Q3=='R');
        w33= R32*(w22+Z*qd3);  % Si es de rotación
    else
        w33 = R32*w22;      % Si es de translación
    end

% N-E 5: Obtención de las aceleraciones angulares absolutas
 % Articulación 1
    if (Tipo_Q1=='R');
        wd11 = R10*(wd00+Z*qdd1+cross(w00,Z*qd1));  % si es de rotación
    else
        wd11 = R10*wd00;                            % si es de translación
    end
 % Articulación 2
     if (Tipo_Q2=='R');
         wd22 = R21*(wd11+Z*qdd2+cross(w11,Z*qd2));  % si es de rotación
     else
         wd22 = R21*wd11;                            % si es de translación
     end
 % Articulación 3
     if (Tipo_Q3=='R');
         wd33 = R32*(wd22+Z*qdd3+cross(w22,Z*qd3));  % si es de rotación
     else
         wd33 = R32*wd22;                            % si es de translación
     end

% N-E 6: Obtención de las aceleraciones lineales de los orígenes de los
% sistemas
 % Articulación 1
     if (Tipo_Q1=='R');
         vd11 = cross(wd11,p11)+cross(w11,cross(w11,p11))+R10*vd00;  % si es de rotación
     else
         vd11 = R10*(Z*qdd1+vd00)+cross(wd11,p11)+2*cross(w11,R10*Z*qd1) + cross(w11,cross(w11,p11));    % si es de translación
     end
 % Articulación 2
     if (Tipo_Q2=='R');
         vd22 = cross(wd22,p22)+cross(w22,cross(w22,p22))+R21*vd11;  % si es de rotación
     else
         vd22 = R21*(Z*qdd2+vd11)+cross(wd22,p22)+2*cross(w22,R21*Z*qd2) + cross(w22,cross(w22,p22));    % si es de translación
     end
 % Articulación 3
     if (Tipo_Q3=='R');
         vd33 = cross(wd33,p33)+cross(w33,cross(w33,p33))+R32*vd22;  % si es de rotación
     else
        vd33 = R32*(Z*qdd3+vd22)+cross(wd33,p33)+2*cross(w33,R32*Z*qd3) + cross(w33,cross(w33,p33));    % si es de translación
     end

% N-E 7: Obtención de las aceleraciones lineales de los centros de gravedad
    a11 = cross(wd11,s11)+cross(w11,cross(w11,s11))+vd11;
    a22 = cross(wd22,s22)+cross(w22,cross(w22,s22))+vd22;
    a33 = cross(wd33,s33)+cross(w33,cross(w33,s33))+vd33;


%%%%%%% ITERACIÓN HACIA EL INTERIOR (DINÁMICA)

% N-E 8: Obtención de las fuerzas ejercidas sobre los eslabones
  f33=R34*f44+m3*a33;
  f22=R23*f33+m2*a22;
  f11=R12*f22+m1*a11;

% N-E 9: Obtención de los pares ejercidas sobre los eslabones
  n33 = R34*(n44+cross(R43*p33,f44))+cross(p33+s33,m3*a33)+I33*wd33+cross(w33,I33*w33);
  n22 = R23*(n33+cross(R32*p22,f33))+cross(p22+s22,m2*a22)+I22*wd22+cross(w22,I22*w22);
  n11 = R12*(n22+cross(R21*p11,f22))+cross(p11+s11,m1*a11)+I11*wd11+cross(w11,I11*w11);

% N-E 10: Obtener la fuerza o par aplicado sobre la articulación
  N3z = n33'*R32*Z;  % Si es de rotación % proyección sobre el eje z
  N3  = n33'*R32;    % Para ver todos los pares, no solo el del eje Z
  F3z = f33'*R32*Z;  % Si es de translacion;
  F3  = f33'*R32;    % Para ver todas las fuerzas, no solo la del eje Z
  N2z = n22'*R21*Z;  % Si es de rotación
  N2  = n22'*R21;    % Para ver todos los pares, no solo el del eje Z
  F2z = f22'*R21*Z;  % Si es de translacion;
  F2  = f22'*R21;    % Para ver todas las fuerzas, no solo la del eje Z
  N1z = n11'*R10*Z;  % Si es de rotación
  N1  = n11'*R10;    % Para ver todos los pares, no solo el del eje Z
  F1z = f11'*R10*Z;  % Si es de translacion;
  F1  = f11'*R10;    % Para ver todas las fuerzas, no solo la del eje Z

% Robot RRR o PPP
    if (Tipo_Q1=='R'); T1=N1z; else T1=F1z; end
    if (Tipo_Q2=='R'); T2=N2z; else T2=F2z; end
    if (Tipo_Q3=='R'); T3=N3z; else T3=F3z; end

%%% MANIPULACIÓN SIMBÓLICA DE LAS ECUACIONES %%%
% En ecuaciones matriciales (solo parte del brazo):
%
% T= M(q)qdd+V(q,qd)+G(q) = M(q)qdd+VG(q,qd)
%

% Primera ecuación
% -----------------
% Cálculo de los términos de la matriz de inercia (afines a qdd)
M11 = diff(T1,qdd1);
Taux = simplify(T1 - M11*qdd1);
M12 = diff(Taux,qdd2);
Taux = simplify(Taux-M12*qdd2);
M13= diff(Taux,qdd3);
Taux = simplify(Taux-M13*qdd3);
% Taux restante contiene términos Centrípetos/Coriolis y Gravitatorios
% Términos gravitatorios: dependen linealmente de "g"
G1=diff(Taux,g)*g;
Taux=simplify(Taux-G1);
% Taux restante contiene términos Centrípetos/Coriolis
V1=Taux;

% Segunda ecuación
% -----------------
% Cálculo de los términos de la matriz de inercia (afines a qdd)
M21 = diff(T2,qdd1);
Taux = simplify(T2 - M21*qdd1);
M22 = diff(Taux,qdd2);
Taux = simplify(Taux-M22*qdd2);
M23 = diff(Taux,qdd3);
Taux = simplify(Taux-M23*qdd3);
% Taux restante contiene términos Centrípetos/Coriolis y Gravitatorios
% Términos gravitatorios: dependen linealmente de "g"
G2=diff(Taux,g)*g;
Taux=simplify(Taux-G2);
% Taux restante contiene términos Centrípetos/Coriolis
V2=Taux;

% Tercera ecuación
% -----------------
% Cálculo de los términos de la matriz de inercia (afines a qdd)
M31 = diff(T3,qdd1);
Taux = simplify(T3 - M31*qdd1);
M32 = diff(Taux,qdd2);
Taux = simplify(Taux-M32*qdd2);
M33 = diff(Taux,qdd3);
Taux = simplify(Taux-M33*qdd3);
% Taux restante contiene términos Centrípetos/Coriolis y Gravitatorios
% Términos gravitatorios: dependen linealmente de "g"
G3=diff(Taux,g)*g;
Taux=simplify(Taux-G3);
% Taux restante contiene términos Centrípetos/Coriolis
V3=Taux;

% Simplificación de expresiones
M11=simplify(M11); M12=simplify(M12); M13=simplify(M13); 
M21=simplify(M21); M22=simplify(M22); M23=simplify(M23); 
M31=simplify(M31); M32=simplify(M32); M33=simplify(M33); 

V1=simplify(V1); V2=simplify(V2); V3=simplify(V3); 
G1=simplify(G1); G2=simplify(G2); G3=simplify(G3);

% Apilación en matrices y vectores
M = [M11 M12 M13; M21 M22 M23; M31 M32 M33];
V = [V1; V2; V3];
G = [G1; G2; G3];


% Inclusión de los motores en la ecuación dinámica
%
% T= Ma(q)qdd+Va(q,qd)+Ga(q)
%
% Ma = M + R^2*Jm     Va=V + R^2*Bm*qd     Ga=G
%
R=diag([R1 R2 R3]);
Jm=diag([Jm1 Jm2 Jm3]);
Bm=diag([Bm1 Bm2 Bm3]);
% Kt=diag([Kt1 Kt2 Kt3]); % No utilizado

Ma=M+R*R*Jm;
Va=V+R*R*Bm*[qd1 ; qd2 ; qd3];
Ga = G;

% La función vpa del Symbolic Toolbox evalua las expresiones de las
% fracciones de una función simbólica, redondeándolas con la precisión que podría pasarse como segundo
% argumento.
 Ma_ne=vpa(Ma,5);
 Va_ne=vpa(Va,5);
 Ga_ne=vpa(G,5);

