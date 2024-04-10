%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: alpha_m
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the value of the alpha rate constant for the m gating
% variable. The function error traps for the denominator singularity
% condition.
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: am = Returns the alpha rate constant for the m
% gating variable (1/ms)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function am = alpha_m(Vm) % edited to change units from 1/ms to 1/s by multiplying by 1000
    Vm = Vm/1.0E-3;
    if Vm ~= -35
        am = (1000*-0.1*(Vm+35)/(exp(-0.1*(Vm+35))-1));
    end
    if Vm == -35
        up = Vm + 1.0E-4;
        down = Vm - 1.0E-4;
        am = (1000*(-0.1*(up+35)/(exp(-0.1*(up+35))-1)+(-0.1)*(down+35)/(exp(-0.1*(down+35))-1))/2);
    end
end