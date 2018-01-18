function [G]= capasitorrStamp(G, a, k, C, w)
    s = w*1i ;
    if(a ~= 0) 
        G(a,a) = G(a,a) + s*C ;
    end
    if(k ~= 0)  
        G(k,k) = G(k,k) + s*C ;
    end
    if(a~=0 && k~=0)
        G(a,k) = G(a,k) - s*C ;
        G(k,a) = G(k,a) - s*C ;
    end
end



