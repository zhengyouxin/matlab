
file1 = 'ymotor.txt'
file2 = 'zmotor.txt'
file3 = 'ymotor1.txt'
file4 = 'zmotor1.txt'
file5 = 'test.txt'%esp动态的sinh/sinv
file6 = 'test_mw_move.txt' %mavell动态的sinh/sinv
file7 = 'test2.txt' %esp屏蔽i2c的sinh/sinv
file8 = 'test1.txt' %esp静止的sinh/sinv
file9 = 'test_mw.txt'  %mavell静止的sinh/sinv
file10 = 'kmz_on.txt'
file11 = 'kmz_off.txt'
file12 = 'kmz_on_2500.txt'
file13 = 'ms12_ad.txt'
file14 = 'ms12_ad1.log'
file15 = 'ms12_ad2.log'
file16 = 'ms12_ad_gnd.log'
file17 = 'ms12_ad_3_3.log'
%  a = load(file1);
%  b = load(file2);
%  
%  c = load(file3);
%  d = load(file4);
 
 e = load(file17);
 
% a = file1
 a = e(e(:,1)==1,:);
 b = e(e(:,1)==2,:);
csvwrite('a.csv', a);
csvwrite('b.csv', b);

c = a(:,end)
% csvwrite('mw-sinh.csv', c);

fftc =(fft(c))

plot(c)
%  hold on
% plot(fftc)

sfft_mag = abs(fftc)
fftpts=length(c);
hpts=fftpts/2;
sfft_mag_scaled=sfft_mag/hpts;
 plot(sfft_mag_scaled);
% plot(a(:,1))
% plot(b(:,1))
%  plot(a(:,end))
%  hold on
% %  plot(b(:,end))
%  
% plot(c)
% plot(c(:,1))
% hold on
% plot(c(:,end))

% plot(d(:,1))
% hold on
% plot(d(:,end))
