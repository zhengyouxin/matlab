file01 = '0301-0001.txt'
file02 = '0303-camera.txt'

f = load(file02)

length = size(f)

cnt2=0
cnt3=0
cnt4=0
cnt5=0
cnt6=0
cnt7=0

for n=(1:length)

    if(f(n)==2)
        cnt2 = cnt2 +1
    end
    
    if(f(n)==3)
        cnt3 = cnt3 +1
    end
    
    if(f(n)==4)
        cnt4 = cnt4 +1
    end
    
    if(f(n)==5)
        cnt5 = cnt5 +1
    end
    
    if(f(n)==6)
        cnt6 = cnt6 +1
    end
    
    if(f(n)==7)
        cnt7 = cnt7 +1
    end
end



cnt2
cnt3
cnt4
cnt5
cnt6
cnt7

plot(f)
