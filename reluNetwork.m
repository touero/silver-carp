clear all;
M=100;
nn=5;
Node_neighbor=zeros(M*M,nn);
for i=1:M*M
    Left=i-1;Right=i+1;Top=i-M;Bottom=i+M;
        if i<=M
            Top=i+M*M-M;
        end
        if i>M*M-M
            Bottom=i-(M*M-M);
        end
        if mod(i,M)==1
            Left=i-1+M;
        end
        if mod(i,M)==0
            Right=i-M+1;
        end
        Node_neighbor(i,1:4)=[Left Right Top Bottom];
end