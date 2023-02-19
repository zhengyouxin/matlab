
file6 = 'shaotou-data-0218-2.txt'
file7 = 'shaotou-data-0218-3.txt'
file8 = 'shaotou-data-0218-4.txt'
file9 = 'shaotou-data-0218-5.txt'
file10 = 'shaotou-data-0218-5-1.txt'
file11 = 'shaotou-data-0218-5-2.txt'
file12 = 'shaotou-data-0218-5-3.txt'
file13 = 'shaotou-data-0218-6.txt'

f = load(file11)

%数据处理
%dat = a(1)
length = size(f) %数据长度
cntPeak = 0 %计算波峰数量
cntTrough = 0 %计算波谷数量

erro_poweron = 0 %�?机圈数错误计�?
err_peak = 0 %错误波峰
errcnt = 0
no_last = 0 %非开机最�?1�?
period = 0
peak_flag = 0
count_poweron = 0

for n=1:length
    
    %计算错误波峰
    if(n>100 && ( f(n)>800 || f(n)<200 ))
        err_peak = err_peak + 1
    end
    %计算波峰数量
    if( n>100 && f(n)>500 && f(n)<800 && f(n-1)<f(n) && f(n)>f(n+1))
%         peak(cnta) = n        
        
        cntPeak = cntPeak+1
        peak_flag = 1
    else if( n>100 && f(n)>500 && f(n)<800 && f(n-1)<f(n) && f(n)==f(n+1) && f(n+1)>f(n+2))
        cntPeak = cntPeak+1
        peak_flag = 1
        end
    end
    
    %计算波谷数量
    if(n>100)
        if(f(n)<230 && f(n-5)>(f(n)+30) && (f(n)+30)<f(n+5))
             cntTrough = cntTrough+1 
        end
    end
    

    if(peak_flag == 1)
        %计算1个周期点�?
        if(cntPeak == 7)
            period = n
        end
        if(cntPeak == 8)
            period = n - period
        end
        
        peak(cntPeak) = n %波峰集合
        
    %计算8个波峰为1次开�?        
        cntmod = cntPeak
    %    if(mod(cntmod,8) == 0 && f(n+period)<300) %判断是否�?1次开机的�?�?1个波�?
%         if(n>period && f(n+period)<300 && f(n-period)>400)
%             count_poweron = count_poweron + 1
%             cntmod = 0
%         else 
%             no_last = no_last + 1
% %             erro_n(no_last) = cntPeak
%             
%         end   
        
        %定位错误圈数位置
        if( n>period && mod(cntmod,8) == 0 && f(n-period)>300 && f(n+period)>300)
            errcnt = errcnt + 1
            errPeakArray(errcnt) = n
        end
    end
    
    peak_flag = 0
end

    if(no_last + count_poweron == cntPeak)
        answer = 'ok'
        erro_poweron = cntPeak - count_poweron*8
    end
    
% cntTrough
% length
% period

err_peak
cntPeak
no_last
count_poweron
erro_poweron

plot(f)
hold on
% plot(errPeakArray)
%  plot(erro_n)