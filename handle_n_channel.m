file01 = '0307_17.txt'
file02 = '0307_17-1.txt'
file03 = '0308-18.txt'
file04 = 'Serial-COM3-0308/0308-214501.txt'

%��ȡ�����ļ���txt��ʽ
%f = load(file03)
% f1 = load(file10)
% plot(f)
% hold on
% plot(f1)

a = load(file04);

b = a(a(:,1)==2,:);
c = a(a(:,1)==3,:);
csvwrite('2.csv',b);
csvwrite('3.csv',c);

f = b
%��ȡ�ļ����ݳ���
length = size(f) 

cntPeak = 0     %�������
cnttrough = 0   %���ȼ���
err_peak = 0
period = 45 %�������ڣ��ɵ�
peak_flag = 0
count_poweron = 0 %��������
erro_poweron=0  %���󿪻�����
errPeak_arr(1)=0  %���󿪻��㶨λ
errpoweron_arr(1)=0 %���󿪻������0��λ��

cal_len = length(1) - 100

for n=1:cal_len
    %�������ADֵ
    if(n>100 && (f(n,2)>800 || f(n,2)<200))
        f(n,2) = 250
        err_peak = err_peak + 1
    end
    
    %���㲨��λ��
     if( n>100 && f(n,2)>500 && f(n,2)<800 && f(n-1,2)<f(n,2) && f(n,2)>f(n+1,2))
        
        cntPeak = cntPeak+1
        peak_flag = 1
    else if( n>100 && f(n,2)>500 && f(n,2)<800 && f(n-1,2)<f(n,2) && f(n,2)==f(n+1,2) && f(n+1,2)>f(n+2,2))
        cntPeak = cntPeak+1
        peak_flag = 1
        end
    end
    
    if(peak_flag == 1)
        
        if(cntPeak == 7)
            period = n
        end
        if(cntPeak == 8)
            period = n - period
        end
        
%         if(n>=period && f(n+period)<300 && f(n-period)>400)
        %���㿪������
        if((n+period)<cal_len &&  f(n+period, 2)<300)     %�������㿪��������׼
            count_poweron = count_poweron + 1
        end
        
        %������󿪻�����
        if( mod(cntPeak,8) ==0 && f(n+period)>400 && f(n-period)>400)
            erro_poweron = erro_poweron + 1
            errPeak_arr(erro_poweron) = n
            errpoweron_arr(erro_poweron) = count_poweron
            cntPeak = cntPeak - 1
        end
        
        peak_flag = 0
    end
    
end

%���󿪻�������Ż�
errlen = erro_poweron
if(errlen > 1)
for n=1:errlen-1
    if(errPeak_arr(n+1) - errPeak_arr(n) < 100)
        erro_poweron = erro_poweron - 1
    end
end
end


cntPeak
count_poweron
erro_poweron
errpoweron_arr

 plot(f)
% hold on
% plot(b)


