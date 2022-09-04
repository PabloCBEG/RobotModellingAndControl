% Cálculo jacobiana directa e inversa.

L0 = 1;
L1 = 0.5;
L2 = 1;
L3A = 1;
L3B = 0.5;

% Rangos de operación de las articulaciones
rq1 = [-3*pi/2  :0.1:  pi/2];
rq2 = [0        :0.1:  2*pi];
rq3 = [-2       :0.1:  2   ];

for q1 = rq1
    for q2 = rq2
        for q3 = rq3
            
            J = [                                                                        0,                   sin(q2)*(L3A + q3) - L2*cos(q2),         -cos(q2);
                L1*sin(q1) + L3B*sin(q1) + cos(q1)*sin(q2)*(L3A + q3) - L2*cos(q1)*cos(q2),   cos(q2)*sin(q1)*(L3A + q3) + L2*sin(q1)*sin(q2),  sin(q1)*sin(q2);
                sin(q1)*sin(q2)*(L3A + q3) - L3B*cos(q1) - L1*cos(q1) - L2*cos(q2)*sin(q1), - cos(q1)*cos(q2)*(L3A + q3) - L2*cos(q1)*sin(q2), -cos(q1)*sin(q2)];
            
            detj = det(J);
            if(detj == 0)% && q2 ~= 0)
                fprintf('Singularidad en q1 = %f, q2 = %f, q3 = %f \n',q1,q2,q3);
            end
        end
    end
end

% detj = det(J);

% Jinv = inv(J);