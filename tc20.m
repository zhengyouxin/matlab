
%待读取文件定�?
path = 'D:\project\code\matlab\'
datPath = 'D:\project\code\matlab\shaotou-data-0217-1.txt'

%file1有效数据403805，时�?8076秒，打开�?�?800�?
file1 = 'shaotou-data-0217-1.txt'
file2 = 'shaotou-data-0217-2.txt'
file3 = 'shaotou-data-0217-3.txt'
file4 = 'shaotou-data-0217-4.txt'
file5 = 'shaotou-data-0218-1.txt'
file6 = 'shaotou-data-0218-2.txt'

%文件处理
% a = load(file1)
% b = load(file2)
% c = load(file3)
% d = load(file4)
% e = load(file5)
% f = load(file6)
%Dat = importdata(file1)
%Dat1 = importdata(datPath)
%
%运算
minb = min(b)
maxb = max(b)

%数据处理
%dat = a(1)
length = size(a) %数据长度
cnta = 0 %计算波峰数量
cntaa = 0 %计算波谷数量
for n=1:length
    if(a(n)>600 && a(n-1)<a(n) && a(n)>a(n+1))
        cnta=cnta+1
    else if(a(n)>600 && a(n-1)<a(n) && a(n)==a(n+1) && a(n+1)>a(n+2))
        cnta=cnta+1
        end
    end
    
    if(a(n)<230 && a(n-1)>a(n) && a(n)<a(n+1))
         cntaa = cntaa+1 
    end
end

length = size(b)
cntb = 0 %计算波峰数量
cntbb = 0 %计算波谷数量
for n=1:length
    if(b(n)>600 && b(n-1)<b(n) && b(n)>b(n+1))
        cntb=cntb+1
    else if(b(n)>600 && b(n-1)<b(n) && b(n)==b(n+1) && b(n+1)>b(n+2))
        cntb=cntb+1
        end
    end
    
    if(b(n)<225 && b(n-1)>b(n) && b(n)<b(n+1))
         cntbb = cntbb+1 
    end
end

length = size(c)
count_err=0 %计算错误圈数�?8个波峰为正确
zero_err=0  %计算勺头归零错误个数
cntc = 0 %计算波峰数量
cntcc = 0 %计算波谷数量
changh = 0 %
changl = 0
for n=1:length
    %计算波峰
    if(c(n)>600 && c(n-1)<c(n) && c(n)>c(n+1))
        cntc=cntc+1

    else if(c(n)>600 && c(n-1)<c(n) && c(n)==c(n+1) && c(n+1)>c(n+2))
        cntc=cntc+1
        end
        
    end
    
%     cntmod = cntc
%     if(mod(cntmod,8) == 0)
% 
%         if(c(n-1)<c(n) && c(n)>c(n+1))
%             count_err = count_err + 1
%         end
%         cntmod = 0
%     end   
    
    %计算波谷
    if(c(n)<224 && c(n-1)>c(n) && c(n)<c(n+1))
         cntcc = cntcc+1 
    end
    
    %勺头转动突变
    if( c(n)>220 && c(n)<230 && abs(c(n) - c(n+1))>3 )
        changh = changh+1
    end
    
    if( c(n)>240 && c(n+1)<225) 
        changl = changl+1
    end
end

length = size(d)
cntd = 0 %计算波峰数量
cntdd = 0 %计算波谷数量
for n=1:length
    if(d(n)>600 && d(n-1)<d(n) && d(n)>d(n+1))
        n
        cntd=cntd+1
    else if(d(n)>600 && d(n-1)<d(n) && d(n)==d(n+1) && d(n+1)>d(n+2))
        cntd=cntd+1
        end
    end
    
    if(d(n)<225 && d(n-1)>d(n) && d(n)<d(n+1))
         cntdd = cntdd+1 
    end
end

length = size(e)
cnte = 0 %计算波峰数量
cntee = 0 %计算波谷数量
for n=1:length
    %计算波峰数量
    if(e(n)>600 && e(n-1)<e(n) && e(n)>e(n+1))
        n
        cnte=cnte+1
    else if(e(n)>600 && e(n-1)<e(n) && e(n)==e(n+1) && e(n+1)>e(n+2))
        cnte=cnte+1
        end
    end
    
    %计算波谷数量
    if(e(n)<225 && e(n-1)>e(n) && e(n)<e(n+1))
         cntee = cntee+1 
    end
end

length = size(f)
cntf = 0 %计算波峰数量
cntff = 0 %计算波谷数量
for n=1:length
    %计算波峰数量
    if(f(n)>600 && f(n-1)<f(n) && f(n)>f(n+1))
        n
        cntf=cntf+1
    else if(f(n)>600 && f(n-1)<f(n) && f(n)==f(n+1) && f(n+1)>f(n+2))
        cntf=cntf+1
        end
    end
    
    %计算波谷数量
    if(f(n)<225 && f(n-1)>f(n) && f(n)<f(n+1))
         cntff = cntff+1 
    end
end

cnta
cntb
cntc
poweron_a = cnta/8
poweron_b = cntb/8
poweron_c = cntc/8

%图形化输�?
% pl1 = plot(a)
% hold on
% pl2 = plot(b)
%pl3 = plot(c)
%pl4 = plot(e)
pl5 = plot(f)
%
poweron_a = cnta/8
poweron_b = cntb/8
poweron_c = cntc/8
cntaa
cntbb
cnta
cntb
cntcc
cntc
cntd
cntdd
cnte
cntee
cntf
cntff
count_err = mod(cntf,8)
