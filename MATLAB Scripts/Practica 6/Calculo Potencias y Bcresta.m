% Laboratorio de Instrumentaci�n El�ctrica
% Practica No 6: Obtenci�n de la curva de p�rdidas en el hierro
% Fecha: 12/11/2016

% Datos 
f = 50;   % Hz
N = 700;  % 
S = 4e-4; % m^2
masa = 3; % kg
%% TENSI�N OBJETIVO
% Tensi�n esperada para los valores de cresta de campo magn�tico
B = [0.5 0.8 1 1.2 1.3 1.4 1.5 1.6 1.7]; %Valores de cresta

% Tensi�n objetivo (mirar tabla)
U = [];
for i=1:length(B)
    U(i) = 4.44*N*f*B(i)*S;
    fprintf('Tensi�n esperada para B=%.2f (T): %.2f (V)\n', B(i), U(i));
end
fprintf('\n')

%% B de cresta real
fprintf('Campo B\n')
U_medida = [31.1 49.8 62.3 74.7 80.8 87.0 93.1 99.6 105.7]; % Completamos nosotros en el lab leido del voltimetro
B_real = [];   % Nos lo piden en la tabla
for i=1:length(U_medida)
    B_real(i) = U_medida(i)/(4.44*N*f*S);
    fprintf('Campo B de cresta real  para una tensi�n de U=%.2f (V): %.4f (T)\n', U_medida(i), B_real(i));
end

%% POTENCIA PERDIDA EN LA BOBINA VOLTIM�TRICA
% 1. Resistencia vw
% Alcances = [150 150 150 150 150 150 150 150 150]; % alcances del vat�metro: COMPLETAR en V
% Resistencia = [50 50 50 50 50 50 50 50 50 ]; % resistencia para ese alcance: COMPLETAR EN OHMIOS/v
% R_vw = [];
% for i=1:length(Alcances)
%     R_vw(i) = Alcances(i).*Resistencia(i);
% end

fprintf('\n')
fprintf('Potencia Medida en VW\n')
% 2. Potencia p�rdida
for i=1:length(U_medida)
    P_vw(i) = U_medida(i).^2/8e6;
    fprintf('Tensi�n esperada para U=%.2f (V): %.6f (mW)\n', U_medida(i), P_vw(i)*1000);
end
fprintf('\n')
%% POTENCIA NETA
fprintf('Potencia Neta\n')
P_medida = [1.16 2.8 4.25 6.04 7.04 8.21 9.49 11.01 12.59]; % Completamos nosotros con la medida del vat�metro en el lab
p_neta = [];   % Nos lo piden en la tabla
for i=1:length(P_vw)
    P_neta(i) = P_medida(i)-P_vw(i);
    fprintf('Potencia neta: %.2f (W)\n', P_neta(i));
end
fprintf('\n')
%% POTENCIA PERDIDAS (W/kg)
fprintf('Potencia Neta/kg\n')
for i=1:length(P_neta)
    P_neta(i) = P_neta(i)/masa;
    fprintf('Potencia neta: %.2f (W/kg)\n', P_neta(i));
end
fprintf('\n')

% Graficas de hist�resis y foucault frente a frecuencia
kh = 0.0654;
kf = 0.002488;
f  = 0:0.1:100;
p_h = kh*f;
p_f = kf*f.*f;
plot(f,p_h,'r') 
hold on
plot(f,p_f,'b')
ensayo_en_carga(f,p_h,p_f)
xlim([0 100])

% Curva de aproximaci�n de puntos
% Curve fitting -> Seleccionas en X tu datos en eje X (B)
% Seleccionas en Y tus datos en y (Pneta) 




