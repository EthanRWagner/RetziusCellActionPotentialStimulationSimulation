%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: tau_m
% Revision Date: 5/24/2023
% Author: Ethan Wagner
%
% Computes the value of the tau rate constant for the h gating
% variable.
%
% Inputs: Vm = Membrane Potential (V)
% USES FUNCTIONS: alpha_m
% beta_m
%
% Returns: th = Returns the tau rate constant for the m
% gating variable (s)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function tm = tau_m(Vm)
    tm = 1/(alpha_m(Vm)+beta_m(Vm));
end