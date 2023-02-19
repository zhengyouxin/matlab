srate = 100; % 100 Hz sample rate
speriod = 1/srate; % sample period (s)
dur=1; % duration in seconds
t=[0:speriod:dur-speriod];% Create a signal from 0 to 1 s. The sample period is 0.01 seconds.

freq=2; % frequency of sine wave in Hz
s=sin(2*pi*freq.*t); % calculate sine wave.
plot(t,s); % plot using t as the time base

sfft=fft(s); % calculate Fast Fourier Transform
sfft_mag=abs(sfft); % take abs to return the magnitude of the frequency components

fftpts=length(s);
hpts=fftpts/2; % half of the number points in FFT
sfft_mag_scaled=sfft_mag/hpts; % scale FFT result by half of the number of points used in the FFT
plot(sfft_mag_scaled); % plot scaled fft result
