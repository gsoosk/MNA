function [G]= resistorStamp(G, i, j, g)
 
    if(i ~= 0) 
        G(i,i) = G(i,i) + g ;
    end
    if(j ~= 0)  
        G(j,j) = G(j,j) + g ;
    end
    if(i~=0 && j~=0)
        G(i,j) = G(i,j) - g ;
        G(j,i) = G(j,i) - g ;
    end
end



