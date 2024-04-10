%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: m_bound
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the final value of the m gating variable given a step
% excitation.
%
% USES FUNCTIONS: alpha_m
% beta_m
%
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: mb = Final value of m gating variable given a step
% excitation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mb = m_bound(Vm)
    mb = alpha_m(Vm)/(alpha_m(Vm)+beta_m(Vm));
end