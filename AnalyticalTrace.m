clc,clear
load SignalsTypes
s = Signals.RealTrace.s;s=s./max(s);
dt = Signals.RealTrace.dt;

%% Analytical and numerical analytic signal
N = 1025;
dt = .002;
t = (0:N-1)*dt;
p = 2*pi*(3*t).*t + 3;% F  = 6t
x = cos(p);

as0 = exp(1j*p);
as = .5*hilbert(s);
N = length(as);
t = (0:N-1)*dt;

plot3(t,real(as),imag(as),t,real(as),-1*ones(1,N),t,1*ones(1,N),imag(as));hold on

line(t([1 1]),real(as([1 1])),[imag(as(1)) -1],'Color','red','LineStyle','--')
line(t([1 1]),[real(as(1)) 1],imag(as([1 1])),'Color','red','LineStyle','--')

line([0 0],[1 1],[1 -1],'Color',[0 0 0],'LineStyle','-')
line([0 0],[1 -1],[-1 -1],'Color',[0 0 0],'LineStyle','-')
axis off