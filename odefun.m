%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: odefun
% Revision Date: 12/11/09
% Author: Robert B. Szlavik, Ethan Wagner
%
% Implement the system of nonlinear ordinary differential equations
% associated with the problem presented in Section 6.1.
%
% USES FUNCTIONS: m_bound
% h_bound
% n_bound
% tau_m
% tau_h
% tau_n
% Voltage
%
% Inputs: t = current time point being evaluated in (s)
% y = previous value of the ODE variables, VECTOR
% Cm = membrane capacitance in (F)
% GNamax = maximum sodium conductance in (S)
% GKmax = maximum potassium conductance in (S)
% VNa = sodium Nernst potential in (V)
% VK = potassium Nernst potential in (V)
% pw = stimulus pulse width in (s)
% amp = stimulus pulse amplitude in (A)
%
% Returns: dy = first derivative value of ODE variables
%
% Internal: mf = step bounded value of m gating variable
% hf = step bounded value of h gating variable
% nf = step founded value of n gating variable
% taum = step rise time value of m gating variable
% tauh = step rise time value of h gating variable
% taun = step rise time value of n gating variable
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dy = odefun(t, y, Cp, Cpsi, Cjg, GNamax_p, GKmax_p, GNamax_psi, GKmax_psi, VNa, VK, VDD, v_to, pw, amp, rd, rj, K, delay)

    % Transistor connected membrane patch
    mf = m_bound(y(1));
    hf = h_bound(y(1));
    nf = n_bound(y(1));
    taum = tau_m(y(1));
    tauh = tau_h(y(1));
    taun = tau_n(y(1));

    % Free membrane patch
    mf_F = m_bound(y(2));
    hf_F = h_bound(y(2));
    nf_F = n_bound(y(2));
    taum_F = tau_m(y(2));
    tauh_F = tau_h(y(2));
    taun_F = tau_n(y(2));
    
    dVm_dt = ((1/Cp)*(((y(3)-VDD)/rd) - (GNamax_p*(y(4).^3)*y(5)*(y(1)-VNa)) - (GKmax_p*(y(6).^4)*(y(1)-VK)) + ((y(2)-y(1))/rj) + Current(t,K,amp, v_to, delay, pw)));
    dVi_dt = ((-1/Cpsi)*(((y(3)-VDD)/rd) + ((y(2)-y(1))/rj) + Current(t,K,amp, v_to, delay, pw) + (GNamax_psi*(y(7).^3)*y(8)*(y(2)-VNa)) + (GKmax_psi*(y(9).^4)*(y(2)-VK))));
    dVd_dt = (-((1/Cpsi) + (1/Cp))*(((y(3)-VDD)/rd) + ((y(2)-y(1))/rj) + Current(t,K,amp, v_to, delay, pw)) - ((1/Cjg)*(((y(3)-VDD)/rd) + Current(t,K,amp, v_to, delay, pw))) - ((1/Cpsi)*((GNamax_psi*(y(7).^3)*y(8)*(y(2)-VNa)) + (GKmax_psi*(y(9).^4)*(y(2)-VK)))) + ((1/Cp)*((GNamax_p*(y(4).^3)*y(5)*(y(1)-VNa)) + (GKmax_p*(y(6).^4)*(y(1)-VK)))));
    
    % [dVm/dt, dVi/dt, dVd/dt, dm/dt, dh/dt, dn/dt, dmF/dt, dhF/dt,
    % dnF/dt]
    dy = [dVm_dt;
    dVi_dt;
    dVd_dt;
    (mf-y(4))/taum;
    (hf-y(5))/tauh;
    (nf-y(6))/taun;
    (mf_F-y(7))/taum_F;
    (hf_F-y(8))/tauh_F;
    (nf_F-y(9))/taun_F];
end