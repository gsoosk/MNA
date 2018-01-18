function [G, B] = OpAmp(n1,n2,n3,gain, G, B)


matSize = size(G,1);
extra = matSize + 1;
B(extra,1) = 0;
G(extra,extra) = 0;

if(n3 ~= 0)
    G(n3,extra) = G(n3,extra) + 1;
    G(extra,n3) = G(extra,n3) - 1;
end

if (n1 ~= 0)
    G(extra,n1) = G(extra,n1)+gain;
end

if(n2 ~= 0)
    G(extra,n2) = G(extra,n2) - gain;
end

end