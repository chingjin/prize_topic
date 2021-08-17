
Yellow=[236,176,53]/255;
Grey=[180,180,180]/255;
Light=[50,50,50]/255;
light=[230,230,230]/255;

WWW="./Fig2_data.txt"

% Data discription,
%column 1, time (min: -10, max:10)
%column 2 delta_t, 
%column 3: six measures: 1, productivity, 2, #incumbents 3, # Entrants,
% 4, Citation, 5 Lead Scientists Impact, 6, Disciplinary Stars



BIO=[];

figure
order=[1,4,5,2,3,6];
T=[];

Name=["\Delta_t","\Delta_t","\Delta_t","\Delta_t","\Delta_t","\Delta_t"];
Name2=["Productivity","Citation","Lead Scientists Impact", "#Incumbents","#Entrants","#Disciplinary Stars"];


content=load(WWW);
Pvalue=[];


% for tt=-10:10
%     for i=1:6
%         ii=order(i);
%         [h,p]=ttest(delta(time==tt & L==ii));
%         Pvalue=[Pvalue,p];
%     end
% end 

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

% for tt=-10:10 
%     [h,p]=ttest(delta(time==tt & c));
%     Pvalue=[Pvalue,p];
% end 

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
%annotation('textbox', [0.1*i, 0.2, 0.1, 0.1], 'String', Name2(i))


end


    
    










