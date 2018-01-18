function [G, rg] = VSStamp(G, a, b, rg, E)
    Size = size(G, 1);
    G(Size + 1, Size +1) = 0 ;
    if(a~=0)
        G(Size+1, a) =  G(Size+1, a) + 1;
        G(a, Size+1) =  G(a,Size+1) + 1;
    end
    if(b~=0)
        G(Size+1, b) =  G(Size+1, b) - 1;
        G(b, Size+1) =  G(b,Size+1) - 1;
    end
    rg(Size + 1, 1) = E;

    
end
