clear all
m0=3;
Edge=2;
M=4000;
Node_U=zeros(1,M);
Node_B=zeros(1,M);
Node_degree=zeros(1,M);
Node_neighbor=zeros(M,1000);
Node_degree(1:3)=[2 2 2];
Node_neighbor(1,[1 2])=[2 3];Node_neighbor(2,[1 2])=[1 3];Node_neighbor(3,[1 2])=[1 2];
m=m0;
for t=1:M-m0
    Xsum=0;
    for i=1:m
        Xsum=Xsum+Node_degree(i);
        Node_U(i)=Xsum;
        Node_B(i)=Node_U(i)-Node_degree(i);
    end
    Node_degree(m+1)=Edge;%
    Xsrand1=fix(Xsum*rand(1)+1);
    for i=1:m
        if (Node_B(i)<Xsrand1)&&(Xsrand1<=Node_U(i))
            Node_neighbor(i,Node_degree(i)+1)=m+1;
            Node_degree(i)=Node_degree(i)+1;
            Node_neighbor(m+1,1)=i;
   
            hh=0;
            for h=1:1000000
                Xsrand2=fix(Xsum*rand(1)+1);
                for j=1:m
                    if (Node_B(j)<Xsrand2)&&(Xsrand2<=Node_U(j))
                        if i==j
                            break;
                        else
                            Node_neighbor(j,Node_degree(j)+1)=m+1;
                            Node_degree(j)=Node_degree(j)+1;
                            Node_neighbor(m+1,2)=j;
                            hh=1;
                            break;
                        end
                    end
                end
                if hh==1
                    break;
                end
            end
           break;
        end
    end
    m=m+1;
end

DegreeDistribution=zeros(1,max(Node_degree));
for j=1:max(Node_degree)
    DegreeDistribution(j)=size(find(Node_degree==j),2)/M;
end