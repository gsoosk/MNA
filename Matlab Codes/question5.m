clear
global A n b Z W T
T=[];
for j=1000:3000
    n=j; %number of nodes 
    disp(j);
    A=sparse(n,n); b=sparse(n,1);
    b(1)=1;
    for i=1:n
    if i<=n-5 
        A([i,n-4-i],[i,n-4-i])=A([i,n-4-i],[i,n-4-i])+[1,-1;-1,1];
    end
    if i>=6
        A([i,n+5-i],[i,n+5-i])=A([i,n+5-i],[i,n+5-i])+[1,-1;-1,1];
    end
    if i<=n-5
        A([i,i+5],[i,i+5])=A([i,i+5],[i,i+5])+[1,-1;-1,1];
    end
    if i<=n/2
        A([i,n+1-i],[i,n+1-i])=A([i,n+1-i],[i,n+1-i])+[1,-1;-1,1];
    end
    end
    tic
    [L,U,P,Q] =lu(A,0.1);
    z=L\(P*b);
    Y=U\z;
    X=Q*Y;
    t1 = toc;
    T(j-999,1) = t1;
    
    Z = full(A);
    W = full(b);
    tic 
    X = W\Z;
    t2 = toc;
    T(j-999,2) = t2;
end
figure(4);
plot(T);
n=4000; %number of nodes 
A=sparse(n,n); b=sparse(n,1);
b(1)=1;
for i=1:n
if i<=n-5 
    A([i,n-4-i],[i,n-4-i])=A([i,n-4-i],[i,n-4-i])+[1,-1;-1,1];
end
if i>=6
    A([i,n+5-i],[i,n+5-i])=A([i,n+5-i],[i,n+5-i])+[1,-1;-1,1];
end
if i<=n-5
    A([i,i+5],[i,i+5])=A([i,i+5],[i,i+5])+[1,-1;-1,1];
end
if i<=n/2
    A([i,n+1-i],[i,n+1-i])=A([i,n+1-i],[i,n+1-i])+[1,-1;-1,1];
end
end
tic
[L,U,P,Q] =lu(A,0.1);
z=L\(P*b);
Y=U\z;
X=Q*Y;
t1 = toc;

Z = full(A);
W = full(b);
tic 
X = W\Z;
t2 = toc;

figure(1);
spy(A)
title('Sparisty of A');
figure(2);
spy(L)
title('Sparisty of L');
figure(3);
spy(U)
title('Sparisty of U');

