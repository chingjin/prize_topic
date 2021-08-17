figure
hold all
Green=[172,234,208]/255;
Red=[243,156,144]/255;
Blue=[145,210,242]/255;
Purple=[229,114,0]/255;
Yellow=[236,176,53]/255;
Grey=[210,210,210]/255;
h=plot([])
P=[];

hold all


xaxis=-10:1:0;
curve1=1600*ones(1,length(xaxis));
curve2=zeros(1,length(xaxis));
x2=[xaxis,fliplr(xaxis)];
inBetween= [curve1,fliplr(curve2)];
fill(x2,inBetween,Grey)
alpha 0.5

x=[0,0];
y=[0,16];
plot(x,y)



%plot(Year,exp(K),'o-','Color',Yellow,'MarkerFaceColor',Yellow,'MarkerSize',8)




x=0:1:20;
y=exp(0.1*x); 

z=zeros(1,9);
xx=0:11;
z2=exp(0.2*xx)-1;

zz=[z,z2];
zz(1:11)=0;







X=2*[-0.02,-0.005,-0.01,0.03,0.005];

%X=2*[0,0.01,0.02,0.03,0.04];

K2=[];

for i=1:5
C(1:12)=0;
%B=*(rand(1,21)-0.5);
C(13:21)=X(i);
YY=log(100*(y));

P(i)=plot(x-10,exp(YY+C),'-','Linewidth',4,'color',Grey)
if i==1
    K2=YY+C;
else
    K2=K2+YY+C;
end


end

Cfinal=[];
X_final=0.08;
Cfinal(1:12)=0;
%B=*(rand(1,21)-0.5);
Cfianl(13:21)=X_final;

CC1=(rand(1,21)-0.5)*2;
P(1)=plot(x-10,exp(K2/5),'-','Linewidth',4,'color',Blue)

CC2=(rand(1,21)-0.5)*2;
P(2)=plot(x-10,100*(y+zz+Cfianl),'-','Linewidth',4,'color',Yellow)

ylim([0,1500])



legend([P(1),P(2)],'expected','prizewinning')


figure

hold all
xaxis=-10:1:0;
curve1=2*ones(1,length(xaxis));
curve2=-0.1*ones(1,length(xaxis));
x2=[xaxis,fliplr(xaxis)];
inBetween= [curve1,fliplr(curve2)];
fill(x2,inBetween,Grey)
alpha 0.5



%P(1)=plot(x-10,100*y,'-','Linewidth',4,'color',Blue)
P(2)=plot(x-10,log(100*(y+zz+Cfianl))-(K2/5),'-','Linewidth',4,'color',Yellow)
h=plot([])
%my_plot_settings(h,'t','\Delta_t',30)

plot(x-10,zeros(length(x),1),'-','color','k','Linewidth',1)















