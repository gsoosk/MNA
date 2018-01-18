function [G, rg] = VCVSStamp(G, k, kp, j, jp ,A ,rg)

    Size = size(G, 1);
    G(Size+1, Size+1) = 0;
    if(j~=0)
        G(Size+1, j) =  G(Size+1, j) - A ;
    end
    if(jp~=0)
        G(Size+1, jp) =  G(Size+1, jp) + A ;
    end
    if(k~=0)
        G(Size+1, k) =  G(Size+1, k) + 1 ;
         G(k, Size+1) =  G(k, Size+1) + 1 ;
    end
    if(kp~=0)
        G(Size+1, kp) =  G(Size+1, kp) - 1 ;
        G(kp, Size+1) =  G(kp, Size+1) - 1 ;
    end
    rg(Size+1, 1) = 0;
end
