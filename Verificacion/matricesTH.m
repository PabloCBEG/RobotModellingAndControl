% --------------------------------------
% -------------------------------------------------
% APARTADO A2 - Matrices de transformación homogénea
% -------------------------------------------------
% La ejecución de este archivo de MATLAB debe dar como resultado una matriz BTP con resultado que se pide

function [TB0,T01,T12,T23,T34,T45,T56] = matricesTH
% Definición de variables simbólicas (no cambiar)
syms L0 L1 L1A L1B L2 L2A L2B L3 L3A L3B L4 L4A L4B L5 L5A L5B L6 L6A L6B real  
syms q1 q2 q3 q4 q5 q6 real  
PI = sym(pi);

% - Sustituya los valores de las siguiente matrices por los que corresponda.
% - Emplee expresiones simbólicas L0, L1, L2A, etc para las longitudes, 
%   valores en radianes para los ángulos (por ejemplo PI/2), así como
%   las funciones sin y cos para las correspondientes funciones
%   trigonométricas.
% - Use la variable PI (en mayúsculas) para referirse a pi radianes
% - Las matrices deben incluir los offsets correspondientes en la variables
%   articulares, q1, q2, q3.
 
% Matriz de transformación de sistema Base a 0
TB0 = [ 0,          0,          1,          0           ;...
        1,          0,          0,          0           ;...
        0,          1,          0,          L0          ;...
        0,          0,          0,          1           ]; 
% Matriz de transformación de sistema 0 a 1
T01 = [ -sin(q1),   0,          cos(q1),    0           ;...
        cos(q1),    0,          sin(q1),    0           ;...
        0,          1,          0,          0           ;...
        0,          0,          0,          1           ];  
% Matriz de transformación de sistema 1 a 2
T12 = [ cos(q2),    0,          -sin(q2),   L2*cos(q2)  ;...
        sin(q2),    0,          cos(q2),    L2*sin(q2)  ;...
        0,          -1,         0,          L1          ;...
        0,          0,          0,          1           ];  
% Matriz de transformación de sistema 2 a 3
T23 = [ 0,          0,          -1,         0           ;...
        1,          0,          0,          -L3B        ;...
        0,          -1,         0,          L3A+q3      ;...
        0,          0,          0,          1           ];  
% Matriz de transformación de sistema 3 a 4
T34 = [ -1,         0,          0,          0           ;...
        0,          0,          1,          0           ;...
        0,          1,          0,          L4+q4       ;...
        0,          0,          0,          1           ];  
% Matriz de transformación de sistema 4 a 5
T45 = [ 1,          0,          0,          0           ;...
        0,          0,          -1,         0           ;...
        0,          1,          0,          L5+q5       ;...
        0,          0,          0,          1           ];  
% Matriz de transformación de sistema 5 a 6
T56 = [ cos(q6),    -sin(q6),   0,          0           ;...
        sin(q6),    cos(q6),    0,          0           ;...
        0,          0,          1,          L6          ;...
        0,          0,          0,          1           ];  

end