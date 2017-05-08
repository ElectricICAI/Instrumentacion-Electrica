%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% .m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

%% Par�metros
NomFichXLS='.\ensayo5_4_Ivacio.xlsx'; % Nombre del fichero Excel con los datos
NomPestanaXLS01='Hoja2'; % Nombre de la pesta�a con los datos
Fs=25e3; % Frecuencia de muestreo utilizada en el osciloscopio (Hz) Aqui poner 25 kHz para ensayo 5.4
TiempoUsar=100; %De los datos disponibles, s�lo se utilizar�n los datos desde T=0 hasta T=TiempoUsar (en ms)



%% Lectura de los datos
[m_Datos, c_Texto, c_Raw]=xlsread(NomFichXLS, NomPestanaXLS01);
v_TiempoSeg=m_Datos(:, 1);
v_TiempoMs=v_TiempoSeg*1000; % Tiempo en ms
v_Datos=m_Datos(:, 2); % Tensi�n en mV


%% Se�al a dibujar (se ajusta el tiempo inicial a cero y se recorta la se�al para utilizar s�lo los datos deseados)
v_TiempoMs=v_TiempoMs-v_TiempoMs(1); % Tiempo empezando en cero
v_QueDatosUsar=v_TiempoMs<TiempoUsar; %Se elige qu� muestras usar
v_TiempoMsUsar=v_TiempoMs(v_QueDatosUsar);
v_DatosUsar=v_Datos(v_QueDatosUsar);


%% Gr�fica de la se�al muestreada
formato(v_TiempoMsUsar, v_DatosUsar);
title('Ensayo 5.4, V_{Medio}=0')

% x = 0.4*square(v_TiempoMsUsar./(2*pi*50));
% plot(v_TiempoMsUsar,x)
% v_DatosUsar1 = v_DatosUsar.*x; 
%% Transformada discreta de Fourier (DFT)
SenCos=1; % Transformada en seno
[v_Frec, v_Amp, v_Grad]=CalculaDFT(v_DatosUsar, Fs, SenCos);
figure(2);
clf;
fourier(v_Frec, v_Amp);
xlabel('f(Hz)');
ylabel('Amplitud(mV)');
xlim([-15, 515]);
title('Ensayo 5.4, V_{Medio}=0')
% hold on 
% [v_Frec, v_Amp, v_Grad]=CalculaDFT(v_DatosUsar1, Fs, SenCos);
% figure(4);
% clf;
% bar(v_Frec, v_Amp);
% xlabel('f(Hz)');
% ylabel('Amplitud(mV)');
% xlim([-15, 515]);


