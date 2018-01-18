function [G ,rg] = inductorStamp(G, a, b, L, rg, w)
    s = w*1i;
    Size = size(G, 1);
    G(Size+1, Size+1) = -s*L;
    if(a~=0)
        G(Size+1, a) =  G(Size+1, a) + 1;
        G(a, Size+1) =  G(a,Size+1) + 1;
    end
    if(b~=0)
        G(Size+1, b) =  G(Size+1, b) - 1;
        G(b, Size+1) =  G(b,Size+1) - 1;
    end
    rg(Size+1, 1) = 0;
    
    
end