file01 = '0301-2.txt'
file02 = '2022-03-02_14_TC20_Test.txt'
file03 = '0302-1.txt'
file04 = '2022-03-02_21.42.11_tc20_data.txt'
file041 = '0302-3-1.txt'    %file04
file042 = '0302-3-2.txt'    %file04
file05 = '2022-03-02_21.42.11_tc20_data.txt'
file06 = '2022-03-03_11.07.38_tc20_data.txt'
file07 = '0304/2022-03-03_15.45.56_tc20_data.txt'
file08 = '0304/2022-03-03_19.34.49_tc20_data.txt'

file09 = '0306/2022-03-04_09.31.10_tc20_data.txt'
file10 = '0306/2022-03-05_21.53.57_tc20_data.txt'

%��ȡ�����ļ���txt��ʽ
f = load(file09)
% f1 = load(file10)
% plot(f)
% hold on
% plot(f1)

length = size(f) %��ȡ�ļ����ݳ���
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
    if(n>100 && (f(n)>800 || f(n)<200))
        f(n) = 250
        err_peak = err_peak + 1
    end
    
    %���㲨��λ��
     if( n>100 && f(n)>500 && f(n)<800 && f(n-1)<f(n) && f(n)>f(n+1))
        
        cntPeak = cntPeak+1
        peak_flag = 1
    else if( n>100 && f(n)>500 && f(n)<800 && f(n-1)<f(n) && f(n)==f(n+1) && f(n+1)>f(n+2))
        cntPeak = cntPeak+1
        peak_flag = 1
        end
    end
    
    if(peak_flag == 1)
        
%         if(cntPeak == 7)
%             period = n
%         end
%         if(cntPeak == 8)
%             period = n - period
%         end
        
%         if(n>=period && f(n+period)<300 && f(n-period)>400)
        %���㿪������
        if(f(n+period)<300)     %�������㿪��������׼
            count_poweron = count_poweron + 1
            cntmod = 0
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
