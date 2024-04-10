%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: V_Na
% Revision Date: 5/24/2023
% Author: Ethan Wagner
%
% Computes the nernst potential of the sodium ions.
%
% Inputs: co_Na sodium concentration outside of the cell membrane (mM)
%         ci_Na sodium concentration inside of the cell membrane (mM)
%         T temperature of the cell environment in degrees (Celcius)
%
% Returns: vna = Returns the nernest potential for the sodium ions (mV)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function vna = V_Na(co_Na, ci_Na, T)
    R = 8.314; % Reiberg gas constant (joules/(mole*kelvin)).
    F = 9.648E4; % Faraday's constant (coulombs/mole).
    Z = 1; % Sodium and potassium ionic valence.
    TKelvin = 273.15 + T;
    
    vna = ((R*TKelvin)/(Z*F)*log(co_Na/ci_Na));
end