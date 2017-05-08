%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entradas:
% - v_Datos: vector con las muestras
% - Fs: frecuencia de muestreo
% - SenCos: 1=transformada en seno, 0=transformada en coseno
% Salidas:
% - v_Frec: vector con los datos de frecuencias para las que se obtienen resultados
% - v_Amp: vector con las amplitudes de cada arm�nico
% - v_Grad: vector con los �ngulos de cada arm�nico (en grados)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [v_Frec, v_Amp, v_Grad]=CalculaDFT(v_Datos, Fs, SenCos)

NDatos=length(v_Datos);

v_FFT=fft(v_Datos)/NDatos;
v_FFTAmp=abs(v_FFT);
v_FFTGrad=180/pi*angle(v_FFT); % �ngulo para transformada coseno (as� sale de la FFT)
if (SenCos>0)
    v_FFTGrad(2:end)=v_FFTGrad(2:end)+90; %�ngulo para transformada seno (de la fft sale en coseno). El �ngulo de la componente de continua no se toca
    v_FFTGrad=v_FFTGrad-360*(v_FFTGrad>180); % Para que el �ngulo est� siempre entre -180� y 180�
end;

% El primer valor de la FFT es el valor medio. Despu�s est�n todos los
% valores hasta la mitad de la frecuencia de muestreo y, a partir de ah�,
% los complejos conjugados de estos en sentido inverso. Si el n�mero de
% puntos es par, hay un n�mero impar de valores aparte del valor medio.
% Entonces, el n�mero central (que corresponde a la mitad de la frecuencia 
% de muestreo) no tiene complejo conjugado (su valor ya est� 'multiplicado
% por 2')
if (mod(NDatos,2)<1e-6) % Si el n�mero de datos es par
    v_Frec=[Fs/2*linspace(0, 1, NDatos/2+1)]'; %linspace: NDatos/2+1 puntos igualmente espaciados entre 0 y 1
    v_Amp=v_FFTAmp(1:NDatos/2+1)+flipud([0; v_FFTAmp(NDatos/2+2:end); 0]);
    v_Grad=v_FFTGrad(1:NDatos/2+1);
else % Si el n�mero de datos es impar
    v_Frec=[Fs/2*linspace(0, 1, (NDatos+1)/2)]'; %linspace: (NDatos+1)/2 puntos igualmente espaciados entre 0 y 1
    v_Amp=v_FFTAmp(1:(NDatos+1)/2)+flipud([v_FFTAmp((NDatos+1)/2+1:end); 0]);
    v_Grad=v_FFTGrad(1:(NDatos+1)/2);
end;

