c=1;
r=3.5;
k=0.5;
penaltyAmount=1;
rewardAmount=7;
reward=[];
Cooperation_rate=0.5;
M1=size(Node_neighbor,1);
M2=size(Node_neighbor,2);
N=3500;
A=rand(1,M1);
A(A>0.5)=1;
A(A<=0.5)=0;
D=zeros(1,M1);
E=zeros(1,M1);
Tr=zeros(1,M1);
tongji=[];
for t=1:N
    tongji(t)=sum(A)/M1;
    for i=1:M1
        NC=A(i);
        NCD=1;
        inspectionP=rand(1);
        for j=1:M2
            if Node_neighbor(i,j)==0
                D(i)=NC*r*c/NCD;
				if A(i)==1 
					D(i)=D(i);
                else 
                    if inspectionP>0.5
                      D(i)=D(i)-penaltyAmount;  
                    else
                        D(i)=D(i);
                    end
				end
                break;
            else
                NC=NC+A(Node_neighbor(i,j));
                NCD=NCD+1;
            end
            if Cooperation_rate>NC/NCD
                reward(i)=rewardAmount;
            else
                reward(i)=0;
            end
        end
    end

    for i=1:M1
        totalpay=D(i);
        NCD=1;
        individualRewards=reward(i);
        for j=1:M2
            if Node_neighbor(i,j)==0
                E(i)=totalpay-A(i)*NCD*c+A(i)*individualRewards;
                break;
            else
                totalpay=totalpay+D(Node_neighbor(i,j));
                individualRewards=individualRewards+reward(Node_neighbor(i,j));
                NCD=NCD+1;
            end
        end
    end
 
    for i=1:M1
        NCD=0;
        for j=1:M2
            if Node_neighbor(i,j)==0
                Xch=fix((NCD*rand(1)+1));
                piss=1/(1+exp((E(i)-E(Node_neighbor(i,Xch)))/k));
                if rand(1)<=piss
                    Tr(i)=A(Node_neighbor(i,Xch));
                else
                    Tr(i)=A(i);
                end
                break;
            else
                NCD=NCD+1;
            end
        end
    end
    A=Tr;
    %
end
plot(1:length(tongji),tongji,'-r','LineWidth',0.5)
xlabel('时间')
ylabel('合作比例')
title('参数对合作比例影响')
hold on;



