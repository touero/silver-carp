clear all;
M=4000;
nn=20;
Node_neighbor=zeros(M,nn);
CL=zeros(M,2);
p=1;

for i=1:M
    if i==1
        Node_neighbor(i,1:4)=[M-1 M 2 3];
    elseif i==2
        Node_neighbor(i,1:4)=[M 1 3 4];
    elseif i==M-1
        Node_neighbor(i,1:4)=[M-3 M-2 M 1];
    elseif i==M
        Node_neighbor(i,1:4)=[M-2 M-1 1 2];
    else
        Node_neighbor(i,1:4)=[i-2 i-1 i+1 i+2];
    end
end

for i=1:M
   
    if rand(1)<=p
        
        if i==M
            Node_neighbor(1,2)=0;
        else
            Node_neighbor(i+1,2)=0;
        end
   
        NN=setdiff(1:M,[Node_neighbor(i,:) i]);
        Irand1=NN(randi(numel(NN)));
        Node_neighbor(i,3)=Irand1;
        for j=1:nn
            if Node_neighbor(Irand1,j)==0
                Node_neighbor(Irand1,j)=i;
                break;
            end
        end
    end
    
    if rand(1)<=p
        if i==M
            Node_neighbor(2,1)=0;
        elseif i==M-1
            Node_neighbor(1,1)=0;
        else
            Node_neighbor(i+2,1)=0;
        end
       
        NN=setdiff(1:M,[Node_neighbor(i,:) i]);
        Irand2=NN(randi(numel(NN)));
        Node_neighbor(i,4)=Irand2;
        for j=1:nn
            if Node_neighbor(Irand2,j)==0
                Node_neighbor(Irand2,j)=i;
                break;
            end
        end
    end
end


inva=zeros(M,nn);
for i=1:M
    position=find(Node_neighbor(i,:)~=0);
    replace=Node_neighbor(i,position);
    inva(i,1:length(replace))=replace;
end
Node_neighbor=inva;

for j=1:nn
    if sum(Node_neighbor(:,j))==0
        Node_neighbor(:,j+1:nn)=[];
        break;
    end
end

Node_degree=[];
for i=1:M
    Node_degree(i)=length(find(Node_neighbor(i,:)~=0));
end

DegreeDistribution=zeros(1,max(Node_degree));
for j=1:max(Node_degree)
    DegreeDistribution(j)=size(find(Node_degree==j),2)/M;
end
