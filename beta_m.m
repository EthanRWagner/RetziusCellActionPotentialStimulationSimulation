%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: beta_m
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the value of the beta rate constant for the m gating
% variable.
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: bm = Returns the alpha rate constant for the m
% gating variable (1/ms)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function bm = beta_m(Vm) % edited to change units from 1/ms to 1/s by multiplying by 1000
    Vm = Vm/1.0E-3;
    bm = 1000*4.0*exp(-(Vm+60)/18);
end