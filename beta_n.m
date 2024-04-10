%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: beta_n
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the value of the beta rate constant for the n gating
% variable.
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: bn = Returns the alpha rate constant for the n
% gating variable (1/ms)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function bn = beta_n(Vm) % edited to change units from 1/ms to 1/s by multiplying by 1000
    Vm = Vm/1.0E-3;
    bn = 1000*0.125*exp(-0.0125*(Vm+60));
end