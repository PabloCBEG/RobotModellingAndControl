% -------------------------------------------------
% APARTADO A1 - Tabla de parámetros de Denavit-Hartemberg
% -------------------------------------------------

% La ejecución de este archivo de MATLAB debe dar como resultado una matriz BTP con resultado que se pide

function TDH = tablaDH_3gdl
% Definición de variables simbólicas (no cambiar)
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B L4 L4A L4B L5 L5A L5B L6 L6A L6B real  
syms q1 q2 q3 q4 q5 q6 real  
PI = sym(pi);

% Sustituya los ceros de la siguiente tabla por los valores que corresponda.
% En cada fila los parámetros DH son por este orden: theta, d, a,alpha
% Emplee expresiones simbólicas L0, L1, L2A, etc para las longitudes y 
% valores en radianes para los ángulos (por ejemplo PI/2).
% Use la variable PI (en mayúsculas) para referirse a pi radianes

%       theta_i  d_i   a_i   alpha_i
TDH = [ PI/2,       L0,         0,          PI/2        ;...  % Link i=0
        q1 + PI/2,  0,          0,          -PI/2       ;...  % Link i=1
        q2,         L1,         L2,         -PI/2       ;...  % Link i=2
        PI/2,       L3A + q3,   -L3B,       0           ];    % Link i=3    
end