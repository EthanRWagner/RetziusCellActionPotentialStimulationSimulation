function stim = stimulus(t,K,V_gs, V_to, delay, pulse_width)

%This function calculates the drain current

if t >= delay && t < (pulse_width + delay)
    stim = 0;
else
    stim = K*((V_gs-V_to).^2);
end
