
%%Data discription: 
%Fig3_data1.txt
% structure: time \t funding \t six_measures, where time equals to -10,-5
% and 0, six measures are: 1, productivity, 2, #incumbents 3, # Entrants,
% 4, Citation, 5 Lead Scientists Impact, 6, Disciplinary Stars

%Fig3_data2.txt time \t funding

%Fig3_data3.txt time \t delta_t \t six_measures, where time ranges from -10 to 10, 
%six measures are: 1, productivity, 2, #incumbents 3, # Entrants,
% 4, Citation, 5 Lead Scientists Impact, 6, Disciplinary Stars


%%
%Fig3 part 1
WWW="./Fig3_data1.txt" 
figure
hold all
II=[-10,-5,0];
for i=1:3
subplot(1,3,i)    
ii=II(i);
Str=strcat(WWW); 
content=load(Str);
time=content(:,1);
Y=content(:,2);
type=content(:,3);
M=log(Y(time==ii & type==1));
M2=log(Y(time==ii & type==0));
subplot(1,3,i)
hold all
boxplot([M,M2])

% 
% hh = findobj(gca,'Tag','Box');
% for j=2:2
%     patch(get(hh(j),'XData'),get(hh(j),'YData'),Yellow,'FaceAlpha',.5,'LineWidth',1.5,'EdgeColor',Yellow);
% end
% 
% for j=1:1
%     patch(get(hh(j),'XData'),get(hh(j),'YData'),Blue,'FaceAlpha',.5,'LineWidth',1.5,'EdgeColor',Blue);
% end
% 

box on 
h=plot([])

end


%% Fig3 part 2


figure
WWW="./Fig3_data2.txt"


YY=[];
TT=[];
YY1=[];
YY2=[];
TT1=[];
TT2=[];


for i=1:1
    

subplot(1,1,i)    
ii=order(i);
Str=strcat(WWW); 
content=load(Str);
time=content(:,1);
Y=content(:,2);

M=log(Y); 

for tt=-10:10
    y=M(time==tt);
    YY=[YY,y];
    TT=[TT,tt];
    
end


for tt=-10:0
    y=M(time==tt);
    YY1=[YY1,y];
    TT1=[TT1,tt];
    
end

for tt=1:10
    y=M(time==tt);
    YY2=[YY2,y];
    TT2=[TT2,tt];
    
end
end



figure
hold all


tt=1:21;
%h=violin(YY,'x',tt,'facecolor',Green,'edgecolor',Grey,'facealpha',0.15,'mc','','medc','')
hold all
h=boxplot(YY,tt,'Notch','on','Colors','k','Widths',0.3,'OUtlierSize',6,'Symbol','kx')
hold all
xtick=1:21;
xticklab = cellstr(num2str(xtick(:)-11));
set(gca,'XTick',xtick,'XTickLabel',xticklab,'TickLabelInterpreter','tex')

hh = findobj(gca,'Tag','Box');
for j=11:21
    patch(get(hh(j),'XData'),get(hh(j),'YData'),Grey,'FaceAlpha',.5,'LineWidth',1.5,'EdgeColor',Grey);
end

for j=1:10
    patch(get(hh(j),'XData'),get(hh(j),'YData'),Yellow,'FaceAlpha',.5,'LineWidth',1.5,'EdgeColor',Yellow);
end

h=plot([])


%%

% Fig3 part 3 
WWW="./Fig3_data3.txt"

Yellow=[236,176,53]/255;
Grey=[180,180,180]/255;
Light=[50,50,50]/255;
light=[230,230,230]/255;

BIO=[];

figure
order=[1,4,5,2,3,6];
T=[];

Name=["\Delta_t","\Delta_t","\Delta_t","\Delta_t","\Delta_t","\Delta_t"];
Name2=["Productivity","Citation","Lead Scientists Impact", "#Incumbents","#Entrants","#Disciplinary Stars"];


content=load(WWW);
Pvalue=[];

for i=1:6
subplot(2,3,i)    
ii=order(i);
time=content(:,1);
delta=content(:,2);
L=content(:,3);
c=(L==ii);




hold all
xaxis=-10:1:0;
curve1=0.3*2*ones(1,length(xaxis));
curve2=-0.1*ones(1,length(xaxis));
x2=[xaxis,fliplr(xaxis)];
inBetween= [curve1,fliplr(curve2)];
fill(x2,inBetween,light)
alpha 1

x=[];
y=[];
z=[];

for tt=1:10 
    [h,p]=ttest(delta(time==tt & c));
    Pvalue=[Pvalue,p];
end 

for tt=-10:10
    x=[x,tt];
    y=[y,mean(delta(time==tt & c))];
    z=[z,1.96*std(delta(time==tt & c))/length(delta(time==tt & c))^0.5];
    
    
end 
plot(x,zeros(length(x),1),'-','color','k','Linewidth',2)
plot(x,y,'-','Linewidth',3,'color',Yellow)
plot(x,(y+z),'--','color',Grey,'Linewidth',2)
plot(x,(y-z),'--','color',Grey,'Linewidth',2)



xlim([-10,10])
ylim([-0.1,0.5])



box on 


x=24;
set(gca, 'FontSize',x,'FontName','Times New Roman')
h=plot([])
set(findall(gcf,'type','text'),'FontName','Times New Roman')
set(h,{'Linewidth'},{1})
L1=strcat('t');
L2=strcat('$\Delta_t$');
xlabel(L1,'Interpreter','tex');
ylabel(L2,'Interpreter','tex');
ylabel(Name(i));
set(gca, 'TickLength', [0.03, 0.0250]) 

end

    
    











    
    










