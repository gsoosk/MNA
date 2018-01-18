function [G] = VCCStamp(G, k, kp, j, jp, gm)

    if(j~=0 && k~=0)
        G(k, j) =  G(k, j) + gm ;
    end
    if(jp~=0 && kp~=0)
        G(kp, j) = G(kp, j) + gm ;
    end
    if(jp~=0 && k~=0)
        G(k, jp) = G(k, jp) - gm ;
    end
    if(j~=0 && kp~=0)
        G(kp, j) = G(kp, j) - gm ;
    end
    
end
