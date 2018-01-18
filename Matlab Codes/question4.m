global V L ;
V = [];
L = [];



clear

for j = drange(1:1000)
    
% for first part you should uncommnet first part and for second 
% you should uncomment sencond part  => 
       
%      Part = 'R 2 1 50^C 2 0 0.000000319^L 2 0 0.0000003176^L 2 3 1.00000059^C 3 4 0.00000000006372^C 4 0 0.000000319^L 4 0 0.0000003176^R 4 0 50^VS 1 0 1'; w = j ; N = 4 ; numOfCommands = 9; res = 4 ;
     Part = 'C 2 4 0.0000000949^R 4 5 9304^C 5 6 0.000000015^R 5 6 52107^R 1 2 9606^R 2 0 23280^R 8 9 20000^R 9 10 20000^R 5 10 9304^R 2 3 6800^C 3 0 0.0000000205^R 6 7 9304^C 7 8 0.000000015^VCVS 4 0 3 4 50000^VCVS 6 0 0 5 50000^VCVS 8 0 0 7 50000^VCVS 10 0 0 9 50000^VS 1 0 j' ;w = -j ; N = 10 ; numOfCommands = 18; res = 10 ;
    
    G = [] ;
    b = [] ;
    G(N,N) = 0;
    b(N,1) = 0;
    commandsList = strsplit(Part,'^');
    for i = drange(1:numOfCommands)
        strIn = commandsList{i};
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
    V(j  ,1) = x(res,1);
end
figure(1)
plot(V);








