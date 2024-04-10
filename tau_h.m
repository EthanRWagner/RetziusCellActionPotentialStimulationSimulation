%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: tau_h
% Revision Date: 5/24/2023
% Author: Ethan Wagner
%
% Computes the value of the tau rate constant for the h gating
% variable.
%
% Inputs: Vm = Membrane Potential (V)
% USES FUNCTIONS: alpha_h
% beta_h
%
% Returns: th = Returns the tau rate constant for the h
% gating variable (s)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function th = tau_h(Vm)
    th = 1/(alpha_h(Vm)+beta_h(Vm));
end