clear
global G b w
G = [] ;
b = [] ;
N  = input('How many nodes?') ;
G(N,N) = 0;
b(N,1) = 0;
C = input('How many components?');
w = input('w?');
for i = drange(1:C)
    strIn = input('','s');
    list = strsplit(strIn);
    if(strcmp(list{1},'R'))
       [G] = resistorStamp(G, str2double(list{2}), str2double(list{3}), 1/str2double(list{4}));
    end
    if(strcmp(list{1},'CS'))
       [b] = CStamp(str2double(list{4}),str2double(list{2}) , str2double(list{3}), b);
    end
    if(strcmp(list{1},'L'))
       [G, b] = inductorStamp(G,str2double(list{2}) , str2double(list{3}), str2double(list{4}), b, w);
    end
    if(strcmp(list{1},'VCC'))
        [G] = VCCStamp(G, str2double(list{2}), str2double(list{3}), str2double(list{4}), str2double(list{5}), str2double(list{6}));  
    end
    if(strcmp(list{1},'VCVS'))
        [G, b] = VCVSStamp(G, str2double(list{2}), str2double(list{3}), str2double(list{4}), str2double(list{5}), str2double(list{6}) ,b);
    end
    if(strcmp(list{1},'VS'))
       [G, b] = VSStamp(G, str2double(list{2}), str2double(list{3}), b, str2double(list{4}) );
    end
    if(strcmp(list{1},'C'))
       [G]= capasitorrStamp(G,str2double(list{2}), str2double(list{3}),str2double(list{4}) , w);
    end
    if(strcmp(list{1},'OP'))
       [G, b]= OpAmp(str2double(list{2}), str2double(list{3}),str2double(list{4}), str2double(list{5}) , G, b);
    end
    
     
end
gSparse = sparse(G);
[L,U,P,Q] = lu(gSparse);
z = L\(P*b);
y = U\z;
x = Q*y;

disp(x);






