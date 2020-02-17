%% Approximate Integration, Calc II, Spring 2019/AU, RR %%

% remember, we are calculating integral from 0 to 2 of xe^x dx

a=0;            % integration limits
b=2;

ns=1:100;
integralValues=zeros(size(ns));
ourFunction=@(x) x.*exp(x);

for n=ns;
    deltaX=(b-a)/n;
    xs=a+(0:n)*deltaX;
    xsBar=(xs(1:end-1)+xs(2:end))/2;
    f=ourFunction(xsBar);
    integralValues(n)=deltaX*sum(f);
end

%% Drawing figures
close all
figure(1)
plot(ns,integralValues,'Linewidth',2)
title('Approximation by Midpoint Rule')
xlabel('n')
ylabel('Riemann Sum')

dim = [.6 .4 .9 .3];
str = ['Integral \approx', num2str(integralValues(end))];
annotation('textbox',dim,'String',str,'FitBoxToText','on');
xa = [.7 .89];
ya = [.7 .89];
annotation('arrow',xa,ya)
ax = gca;
ax.FontSize = 12;
grid