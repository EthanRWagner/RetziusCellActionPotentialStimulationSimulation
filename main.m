%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Program: Main_Program
% Revision Date: 06/08/23
% Author: Robert B. Szlavik, Ethan Wagner
%
% Neural stimulator solution.
%
% USES FUNCTIONS: odefun
% V_Na
% V_K
% V_r
% m_bound
% h_bound
% n_bound
% ode23s
%
% Internal: a = Cell radius (m)
% d = Cell diameter (m)
% L = Cell length (m)
% temp = Temperture (deg. C)
% gmax_Na = Maximum sodium conductance per unit area
% (S/m^2)
% gmax_K = Maximum potassium conductance per unit area
% (S/m^2)
% co_Na = Extracellular Na concentration (M/L)
% ci_Na = Intracellular Na concentration (M/L)
% co_K = Extracellular K concentration (M/L)
% ci_K = Intracellular K concentration (M/L)
% C_m = Membrance capacitance per unit area (F/m^2)
% b = Relative sodium to potassium conductance
% delta_t = Time step (s)
% max_time = Maximum time (s)
% pulse_width = Stimulus pulse width (s)
% pulse_amp = Stimulus pulse amplitude (A)
% Area = Cell surface area (m^2)
% C = Cell capacitance (F)
% maxcond_Na = Maximum sodium conductance (S)
% maxcond_K = Maximum potassium conductance (S)
% Na_Battery = Sodium Nernst potential (V)
% K_Battery = Potassium Nernst potential (V)
% V_rest = Resting membrane potential (V)
% m_o = m gating variable initial value
% h_o = h gating variable initial value
% n_o = n gating variable initial value
% t = Vector of time points (s)
% y0 = Vector of initial conditions
% options = default solver options data structure
% PLUS MORE DETAILS :>
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variable declarations
a = 10E-6; % Cell radius (m)
d = 2*a; % Cell diameter (m)
L = 40.0E-6; % Cell length (m)
temp = 6.3; % Temperature (deg. C)
gmax_Na = 120E1; % Maximum sodium conductance per unit area (S/m^2)
gmax_K = 36E1; % Maximum potassium conductance per unit area (S/m^2)
co_Na = 491E-3; % Extracellular Na concentration (mol/L)
ci_Na = 50E-3; % Intracellular Na concentration (mol/L)
co_K = 20.11E-3; % Extracellular K concentration (mol/L)
ci_K = 400E-3; % Intracellular K concentration (mol/L)
cm = 4.0E-2; % Membrane capacitance per unit area (F/m^2) % edited from 1.0E-6*100^2
b = 0.02; % Relative sodium to potassium conductance
c_jg = 0.3E-2; % gate oxide capacitance per unit area (F/m^2)

% % current pulse
% delta_t = 1.0E-6; % Time step (s)
% max_time = 20.0E-3; % Maximum time (s)
% pulse_width = 100E-6; % Stimulus pulse width (s) % edited from 10E-6 s
% pulse_amp = 53E-9; % Stimulus pulse amplitude (A) % edited from 53E-9

% voltage pulse
delay = 0; %Delay before stimulus activation (s)
delta_t = 1.0E-6; % Time step (s)
max_time = 20.0E-3; % Maximum time (s)
pulse_width = 0.5E-3; % Stimulus pulse width (s) % edited from 10E-6 s
V_s = 3.5; % stimulating voltage pulse amplitude, V
V_so = 0; % initial stimulating voltage, V

VDD = 10; % voltage drain bias for the transistor, V
RD = 1000; % drain resistance, ohm
rho_j = 150; % extracellular environment resistivity, ohm/m
dj = 10E-9; % nerve cell transistor seal distance, m
RJ = rho_j/(5*pi*dj); % interface junction seal resistance
V_to = 1.5; % turn on voltage of transistor, V
% Note V_gs = V_s
K_tran = 1E-3; % transistor K parameter, A/V^2
% Compute cell parameter values
Area = 2*(pi*a^2) + 2*pi*a*L; % Cell surface area (m^2)
free_area = (pi*a^2) + 2*pi*a*L; % free membrane cell surface area (m^2)
inter_area = (pi*a^2); % interfaced membrane cell surface area (m^2)
Cp = inter_area*cm; % capactiance of interfaced membrane patch, F
Cpsi = free_area*cm; % capacitance of interfaced membrane patch, F
C_jg = c_jg*inter_area; % capacitance of transistor interfaced membrane patch, F
maxcond_Na_p = inter_area*gmax_Na;
maxcond_K_p = inter_area*gmax_K;
maxcond_Na_psi = free_area*gmax_Na;
maxcond_K_psi = free_area*gmax_K;
Na_Battery = V_Na(co_Na, ci_Na, temp);
K_Battery = V_K(co_K, ci_K, temp);
V_rest = V_r(co_Na, ci_Na, co_K, ci_K, temp, b);
Vd_rest = V_DD - K*((V_s-V_to).^2)*R_D; %initial transistor voltage (V)
m_o = m_bound(V_rest);
h_o = h_bound(V_rest);
n_o = n_bound(V_rest);
% Set up the time vector
t = zeros(floor(max_time/delta_t),1);
for i = 1:floor(max_time/delta_t)
    t(i) = (i-1)*delta_t;
end
% Specify the initial conditions vector
y0 = [V_rest, V_rest, Vd_rest, m_o, h_o, n_o, m_o, h_o, n_o];
options = odeset();
% Invoke the solver
% [T,Y] = ode45(@odefun, t, y0, options, C, maxcond_Na, maxcond_K, Na_Battery, K_Battery, pulse_width, pulse_amp);
[T,Y] = ode23s(@odefun, t, y0, options, Cp, Cpsi, C_jg, maxcond_Na_p, maxcond_K_p, maxcond_Na_psi, maxcond_K_psi, Na_Battery, K_Battery, VDD, V_to, pulse_width, V_s, RD, RJ, K_tran, delay);
% Plot the solution
figure(1)
plot(T,Y(:,2))
grid
figure(2)
plot(T,Y(:,1))
hold on
plot(T,Y(:,2),'r')
grid
legend('V_m', 'V_i')
figure(3)
plot(T,Y(:,3))
grid
figure(4)
plot(T,Y(:,2)-Y(:,1))
grid
figure(5)
plot(T,Y(:,4))
hold on
plot(T,Y(:,5),'r')
hold on
plot(T,Y(:,6),'g')
grid
legend('m_{rho}', 'h_{rho}', 'n_{rho}')
figure(6)
plot(T,Y(:,7))
hold on
plot(T,Y(:,8),'r')
hold on
plot(T,Y(:,9),'g')
grid
legend('m_{psi}', 'h_{psi}', 'n_{psi}')