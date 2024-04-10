%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: Voltage
% Revision Date: 06/07/23
% Author: Ethan Wagner
%
% Generates a stimulus voltage pulse.
%
% Inputs: t = Time in (s)
% pw = Stimulus pulse width in (s)
% amp = Stimulus voltage pulse amplitude in (V)
%
% Returns: I = Returns the stimulus current value in (A)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function V = Voltage(t,pw,amp,v_to)
    if t >= 0.0 & t <= pw
        V = v_to;
    else
        V = amp;
    end
end