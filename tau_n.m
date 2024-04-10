%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: tau_n
% Revision Date: 5/24/2023
% Author: Ethan Wagner
%
% Computes the value of the tau rate constant for the n gating
% variable.
%
% Inputs: Vm = Membrane Potential (V)
% USES FUNCTIONS: alpha_n
% beta_n
%
% Returns: th = Returns the tau rate constant for the n
% gating variable (1/ms)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function tn = tau_n(Vm) 
    tn = 1/(alpha_n(Vm)+beta_n(Vm));
end