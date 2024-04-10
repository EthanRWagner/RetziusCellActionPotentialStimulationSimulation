%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: alpha_h
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the value of the alpha rate constant for the h gating
% variable.
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: ah = Returns the alpha rate constant for the h
% gating variable (1/ms)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ah = alpha_h(Vm) % edited to change units from 1/ms to 1/s by multiplying by 1000
    Vm = Vm/1.0E-3;
    ah = 1000*0.07*exp(-0.05*(Vm+60));
end