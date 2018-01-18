function [rg] = CStamp(J, a, b, rg)
    if(a~=0)
        rg(a, 1) = rg(a,1) + J;
    end
    if(b~=0)
        rg(b , 1) = rg(b, 1) - J;
    end
end
