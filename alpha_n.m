%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: alpha_n
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Computes the value of the alpha rate constant for the n gating
% variable. The function error traps for the denominator singularity
% condition.
%
% Inputs: Vm = Membrane Potential (V)
%
% Returns: an = Returns the alpha rate constant for the n
% gating variable (1/ms)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function an = alpha_n(Vm) % edited to change units from 1/ms to 1/s by multiplying by 1000
    Vm = Vm/1.0E-3;
    if Vm ~= -50
        an = (1000*-0.01*(Vm+50)/(exp(-0.1*(Vm+50))-1));
    end
    if Vm == -50
        up = Vm + 1.0E-4;
        down = Vm - 1.0E-4;
        an = (1000*(-0.01*(up+50)/(exp(-0.1*(up+50))-1) + -0.01*(down+50)/(exp(-0.1*(down+50))-1))/2);
    end
end