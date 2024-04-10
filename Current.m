%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: Current
% Revision Date: 12/14/09
% Author: Robert B. Szlavik
%
% Generates a stimulus current pulse.
%
% Inputs: t = Time in (s)
% pw = Stimulus pulse width in (s)
% amp = Stimulus current pulse amplitude in (A)
%
% Returns: I = Returns the stimulus current value in (A)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function I = Current(t,K,V_gs, V_to, delay, pulse_width)
if t >= delay && t < (pulse_width + delay)
    I = 0;
else
    I = K*((V_gs-V_to).^2);
end