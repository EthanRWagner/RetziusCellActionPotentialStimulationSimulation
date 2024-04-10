%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: beta_h
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the value of the beta rate constant for the h gating
% variable.
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: bh = Returns the alpha rate constant for the h
% gating variable (1/ms)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function bh = beta_h(Vm) % edited to change units from 1/ms to 1/s by multiplying by 1000
    Vm = Vm/1.0E-3;
    bh = ((1000*1)/(1+exp(-0.1*(Vm+30))));
end