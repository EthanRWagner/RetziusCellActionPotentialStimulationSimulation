%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: n_bound
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the final value of the m gating variable given a step
% excitation.
%
% USES FUNCTIONS: alpha_n
% beta_n
%
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: nb = Final value of m gating variable given a step
% excitation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function nb = n_bound(Vm)
    nb = alpha_n(Vm)/(alpha_n(Vm)+beta_n(Vm));
end