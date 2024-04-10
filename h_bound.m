%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: h_bound
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the final value of the m gating variable given a step
% excitation.
%
% USES FUNCTIONS: alpha_h
% beta_h
%
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: hb = Final value of m gating variable given a step
% excitation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function hb = h_bound(Vm)
    hb = alpha_h(Vm)/(alpha_h(Vm)+beta_h(Vm));
end