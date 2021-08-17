
% Recency 
figure 

Blue2=[37,71,107]/255;
Red2=[134,59,61]/255;
Green2=[92,115,57]/255;
Orange2=[214,130,47]/255;
dark2=[116,141,133]/255;
Oliver2=[90,71,32]/255;
COLOR=[Blue2;Red2;Green2;Orange2;dark2;Oliver2];

c=strcat('./Fig4_data_tau2.txt');

%data strcutre: %recency \t delta for six measures, seperated with
%(\t), six measures: 1, productivity, 2, #incumbents 3, # Entrants,
% 4, Citation, 5 Lead Scientists Impact, 6, Disciplinary Stars
% recency(1: recent topics, 0: not recent topics)

W=load(c);
tau=W(:,1);
order=[1,4,5,2,3,6];
Label=[];
XXT=[];
XT=[];
YY=[];

for i=1:6
    shift=(i-1)*3;
    hold all
    ii=order(i);
    choose=W(:,3+ii-2);
    D=tau;
    xx=[0,1]+shift;
    yy=[mean(choose(D==1)), mean(choose(D==0))];
    zz=[std(choose(D==1))/length(choose(D==1))^0.5*1.96, std(choose(D==0))/length(choose(D==0))^0.5*1.96];
    
    
    YY1=[choose(D==1)];
    h=boxplot(YY1,'positions',[0+shift],'Colors','k','Widths',0.35,'OUtlierSize',6,'Whisker',0,'Symbol','w')
    set(h,{'linew'},{1.5})
    
    YY1=[choose(D==0)];
    h=boxplot(YY1,'positions',[1+shift],'Colors','k','Widths',0.35,'OUtlierSize',6,'Whisker',0,'Symbol','w')
    set(h,{'linew'},{1.5})
    
    
%     YY1=[choose(D>where1)];
%     h=violin(YY1,'x',[0+shift],'facecolor',COLOR(i,:),'edgecolor',COLOR(i,:),'facealpha',0.1,'mc','','medc','')
%     
%     YY1=[choose(D<=where1)];
%     h=violin(YY1,'x',[1+shift],'facecolor',COLOR(i,:),'edgecolor',COLOR(i,:),'facealpha',0.1,'mc','','medc','')
%     
    
    barplot=errorbar(xx,yy,zz,'o','LineStyle','none','color',COLOR(i,:),'LineWidth',2.0,'MarkerSize',10,'MarkerFaceColor',COLOR(i,:))
    barplot.CapSize =18
  
    XT=[XT,[0 1]+shift];
    XXT=[XXT,[0 1]+shift];
    ylim([-1.0,1.5]);

    Label=[Label,{'no','yes'}]
    %hh=plot([])
    %my_plot_settings(hh,'recency','$\Delta_{10}$')
    box on
    ylabel('\Delta_{10}','Interpreter','tex');
    
end

hh=plot([])
xticks(XXT)
xticklabels(Label)
set(gca, 'FontSize',x,'FontName','Times New Roman')
set(gca, 'TickLength', [0.01, 0.01]) 


%%
% Money 
figure 

Blue2=[37,71,107]/255;
Red2=[134,59,61]/255;
Green2=[92,115,57]/255;
Orange2=[214,130,47]/255;
dark2=[116,141,133]/255;
Oliver2=[90,71,32]/255;
COLOR=[Blue2;Red2;Green2;Orange2;dark2;Oliver2];

c=strcat('./Fig4_data_mon.txt');

%data strcutre: %money \t delta for six measures, seperated with
%(\t), six measures: 1, productivity, 2, #incumbents 3, # Entrants,
% 4, Citation, 5 Lead Scientists Impact, 6, Disciplinary Stars
% money(1: prizewithmoney, 0: prizewithoutmoney)



W=load(c);
mon=W(:,1);


order=[1,4,5,2,3,6];
LL=[];
R=[];
M=[];
XXT=[];
Label=[]; 
for i=1:6
    
    XT=[];
    LL=[];
    R=[];
    hold all
    ii=order(i);
    shift=(i-1)*3;
    choose=W(:,3+ii-2);
    co1=(mon<=0);
    co2=(mon>0);
    L1=choose(co1);
    L2=choose(co2);

    LL=[LL,mean(L1),mean(L2)];
    R=[R,std(L1)/length(L1).^0.5*1.96,std(L2)/length(L2).^0.5*1.96]

    XT=[XT,[0 1]+shift];
    XXT=[XXT,[0 1]+shift];
    Label=[Label,{'no','yes'}]
    
    
     YY1=L1;
    h=boxplot(YY1,'positions',[0+shift],'Colors','k','Widths',0.35,'OUtlierSize',6,'Whisker',0,'Symbol','w')
    set(h,{'linew'},{1.5})
    
     YY1=L2;
    h=boxplot(YY1,'positions',[1+shift],'Colors','k','Widths',0.35,'OUtlierSize',6,'Whisker',0,'Symbol','w')
    set(h,{'linew'},{1.5})
    
    
%    
%     h=violin(YY1,'x',[0+shift],'facecolor',COLOR(i,:),'edgecolor',COLOR(i,:),'facealpha',0.15,'mc','','medc','')

%     h=violin(YY1,'x',[1+shift],'facecolor',COLOR(i,:),'edgecolor',COLOR(i,:),'facealpha',0.15,'mc','','medc','')
%     
%     

barplot=errorbar(XT,LL,R,'o','LineStyle','none','color',COLOR(i,:),'LineWidth',2.0,'MarkerSize',10,'MarkerFaceColor',COLOR(i,:))
barplot.CapSize =18

    
    
end
    
xticks(XXT)
xticklabels(Label) 

h=plot([])
box on
   

ylabel('\Delta_{10}','Interpreter','tex');
    
x=20;
set(gca, 'FontSize',x,'FontName','Times New Roman')
set(gca, 'TickLength', [0.01, 0.01]) 
ylim([-1.0,1.5]);

%%

% Discipline-Specific

figure 

Blue2=[37,71,107]/255;
Red2=[134,59,61]/255;
Green2=[92,115,57]/255;
Orange2=[214,130,47]/255;
dark2=[116,141,133]/255;
Oliver2=[90,71,32]/255;
COLOR=[Blue2;Red2;Green2;Orange2;dark2;Oliver2];

c=strcat('./Fig4_data_sp.txt');
%data strcutre: %discipline \t delta for six measures, seperated with
%(\t), six measures: 1, productivity, 2, #incumbents 3, # Entrants,
% 4, Citation, 5 Lead Scientists Impact, 6, Disciplinary Stars
% discipline(1: discipline-specific, 0: general prizes)



W=load(c);
div=W(:,1);
order=[1,4,5,2,3,6];

LL=[];
R=[];
M=[];
XXT=[];
Label=[];
for i=1:6
    XT=[];
    LL=[];
    R=[];
    
    
    hold all
    ii=order(i);
    shift=(i-1)*3;
    choose=W(:,3+ii-2);

    L=0;
  
    co1=(div==0);
    co2=(div==1);
    
    
    LL=[LL,mean(choose(co1)), mean(choose(co2))];
    R=[R,std((choose(co1)))/length((choose(co1)))^0.5*1.96,std(choose(co2))/length(choose(co2))^0.5*1.96];
    M=[M,0+shift,1+shift];
    Label=[Label,{'gen','spe'}]
    XT=[XT,[0 1]+shift];
    XXT=[XXT,[0 1]+shift];
    YY1=choose(co1);
    h=boxplot(YY1,'positions',[0+shift],'Colors','k','Widths',0.35,'OUtlierSize',6,'Whisker',0,'Symbol','w')
    set(h,{'linew'},{1.5})
    
     YY1=choose(co2);
    h=boxplot(YY1,'positions',[1+shift],'Colors','k','Widths',0.35,'OUtlierSize',6,'Whisker',0,'Symbol','w')
    set(h,{'linew'},{1.5})
    
%     
%     YY1=choose(co1);
%     h=violin(YY1,'x',[0+shift],'facecolor',COLOR(i,:),'edgecolor',COLOR(i,:),'facealpha',0.15,'mc','','medc','')
%     
%     YY1=choose(co2);
%     h=violin(YY1,'x',[1+shift],'facecolor',COLOR(i,:),'edgecolor',COLOR(i,:),'facealpha',0.15,'mc','','medc','')
%     
%     
    
   

barplot=errorbar(XT,LL,R,'o','LineStyle','none','color',COLOR(i,:),'LineWidth',2.0,'MarkerSize',10,'MarkerFaceColor',COLOR(i,:))
    barplot.CapSize =18

    
end
    
xticks(XXT)
xticklabels(Label)     

h=plot([])
box on 
x=20;
set(gca, 'FontSize',x,'FontName','Times New Roman')
set(gca, 'TickLength', [0.01, 0.01])

box on
ylabel('\Delta_{10}','Interpreter','tex');
ylim([-1.0,1.5]);
    

















