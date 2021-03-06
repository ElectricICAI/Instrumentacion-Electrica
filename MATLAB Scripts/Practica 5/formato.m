function crear(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 07-Nov-2016 17:36:32

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'DisplayName','U_{CHI} (V)','MarkerSize',3,'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 1]);

% Create xlabel
xlabel('t(ms)','FontSize',11);

% Create title
title({'Se�al de 500 Hz, f_s=500 Hz'},'FontSize',11);

% Create ylabel
ylabel('U_{CHI}(V)','FontSize',11);

grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.25,'GridColor',...
    [0 0.447058823529412 0.741176470588235],'GridLineStyle','--','LineWidth',1,...
    'XColor',[0 0 0],'YColor',[0 0 0]);
% Create legend
legend(axes1,'show');

