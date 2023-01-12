%% Images for gif of Lur'e phase space
t = 0:0.01:5000;
y_init = [0.5, 0.2, 0.1];
count = 1;

for a = 0.8:-0.005:0.65
    [t, y] = ode45(@(t,y) lure_for_ode(t, y, a), t, y_init);
    plot(y(1000:end, 1), y(1000:end, 2), 'r-');
    xlim([-0.5, 1]);
    ylim([-0.6, 0.6]);
    saveas(gcf, ['ross_gif', num2str(count), '.jpg']);
    count = count + 1;
end

count = 36;

for a = 0.625:-0.005:0.6
    [t, y] = ode45(@(t,y) lure_for_ode(t, y, a), t, y_init);
    plot(y(1000:end, 1), y(1000:end, 2), 'r-');
    xlim([-0.5, 1]);
    ylim([-0.6, 0.6]);
    saveas(gcf, ['ross_gif', num2str(count), '.jpg']);
    count = count + 1;
end

%% Lur'e time series
a = 0.8;
[t, y1] = ode45(@(t,y) rossler_for_ode(t, y, a), t, y_init);
figure
plot(t(2e3:5e3), y1(2e3:5e3, 1), 'LineWidth', 2);
hold on
plot(t(2e3:5e3), y1(2e3:5e3, 2), 'LineWidth', 2);
plot(t(2e3:5e3), y1(2e3:5e3, 3), 'LineWidth', 2);
xlim([20, 50])
ylim([-0.5, 1])
ax = gca;
ax.FontSize = 16;
ylabel('State')


a = 0.6;
[t, y2] = ode45(@(t,y) rossler_for_ode(t, y, a), t, y_init);
figure
plot(t(2e4+2e3:2e4+5e3), y2(2e4+2e3:2e4+5e3, 1), 'LineWidth', 2)
hold on
plot(t(2e4+2e3:2e4+5e3), y2(2e4+2e3:2e4+5e3, 2), 'LineWidth', 2)
plot(t(2e4+2e3:2e4+5e3), y2(2e4+2e3:2e4+5e3, 3), 'LineWidth', 2)
xlim([220, 250])
ylim([-0.5, 1])
ax = gca;
ax.FontSize = 16;
ylabel('State')

%% Torus bifurcation examples
y_0 = [-0.0108434788242700;0.0169980902375737;0.381357224224074];

sim_len = 9e5; %ms
step_size = 0.1; %ms
fs = 1e3/step_size;
delta_V = 0.66;
C = 0;
u = 0;
V_Na = 0.53;
V_Ca = 1.38;
V_K = -0.7;

[t, y1] = ode45(@(t,y) lb_for_ode45(t, y, delta_V, C, u, V_Na, V_K, V_Ca), [0:step_size:sim_len], y_0);

start = 1e3;
add = 1e3;

V_Ca = 0.95;
[t, y2] = ode45(@(t,y) lb_for_ode45(t, y, delta_V, C, u, V_Na, V_K, V_Ca), [0:step_size:sim_len], y_0);

figure
lh = plot(y2(1e3:end, 1), y2(1e3:end, 3));
lh.Color = [0.8500, 0.3250, 0.0980, 0.05];
hold on
lh = plot(y1(1e3:end, 1), y1(1e3:end, 3));
lh.Color = [0, 0.4470, 0.7410, 0.05];
ax = gca;
ax.FontSize = 16;
xlabel('V')
ylabel('W')

figure
lh = plot(y2(1e3:3e3, 1), 'LineWidth', 2);
lh.Color = [0.8500, 0.3250, 0.0980];
hold on
lh = plot(y1(1e3:3e3, 1), 'LineWidth', 2);
lh.Color = [0, 0.4470, 0.7410];
legend({'Post-torus', 'Pre-torus'})
ax = gca;
ax.FontSize = 16;
xlim([0, 2000])
ylabel('V')

% All other figures can be found in the papers cited in the talk