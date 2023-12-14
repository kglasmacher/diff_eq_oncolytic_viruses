% This program models a the dynamics between oncolytic viruses and cancer
% cells
% Created by: Kira Glasmacher
% Creation Date: Dec 7, 2023

% Solve the system of differential equations.
tspan = [0, 200]; % domain for solutions
c0 = [10, 1, 0]; % initial condition

a = 0.1;
b = 0.01;
g = 0.5;
d = 0.1;
N = 5;

dcdt = @(t,c) [a.*c(1)-b.*c(1).*c(3); b.*c(1).*c(3)-d.*c(2); N*d.*c(2)-g.*c(3)];
[t, c] = ode45(dcdt,tspan,c0);


% Plot x, y and v in terms of t
figure
plot(t,c(:,1),'b');  %plot solution for x(t) in blue
hold on; 
plot(t,c(:,2),'r');  %plot solution for y(t) in red
hold on 
plot(t,c(:,3),'g');  %plot solution for v(t) in red
xlabel('t (years)'); ylabel('number of cells or viruses'); legend('uninfected','infected','viruses');
hold off



% Solve the system of differential equations.
tspan = [0, 50]; % domain for solutions
i0 = [50, 1, 1, 1]; % initial condition

a = 0.1;
b = 0.01;
g = 0.5;
d = 0.1;
N = 5;
n = 0.01;
s = 0.1;
e = 0.5;
w = 0.1;

didt = @(t,i) [a.*i(1)-b.*i(1).*i(4); b.*i(1).*i(4)-d.*i(2)-s.*i(2).*i(3); s.*i(2).*i(3)-e.*i(3)-w.*i(3)^2; N*d.*i(2)-g.*i(4)-n.*i(4).*i(3)];
[t, i] = ode45(didt,tspan,i0);


% Plot x, y and v in terms of t
figure
plot(t,i(:,1),'b');  %plot solution for x(t) in blue
hold on; 
plot(t,i(:,2),'r');  %plot solution for y(t) in red
hold on 
plot(t,i(:,3),'y');  %plot solution for z(t) in yellow
hold on 
plot(t,i(:,4),'g');  %plot solution for v(t) in red
xlabel('t (years)'); ylabel('number of cells or viruses'); legend('uninfected','infected','immune cells','viruses');
hold off







t_start = 0; t_end = 500;     %set suitable time range
t_duration = [t_start t_end];   %create vector for time
w_initial = [100; 1; 10];       %column vector containing initial values
dwdt = @(t,w) [a.*w(1)-b.*w(1).*w(3); b.*w(1).*w(3)-d.*w(2); N*d.*w(2)-g.*w(3)];
[t, w] = ode23(dwdt, t_duration, w_initial);
figure
stem3(w(:,1),w(:,2), w(:,3), '.');
grid on
xlabel('w_1(t)')
ylabel('w_2(t)')
zlabel('w_3(t)')

