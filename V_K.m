%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: V_K
% Revision Date: 5/24/2023
% Author: Ethan Wagner
%
% Computes the nernst potential of the potassium ions.
%
% Inputs: co_K potassium concentration outside of the cell membrane (M)
%         ci_K potassium concentration inside of the cell membrane (M)
%         T temperature of the cell environment in degrees (Celcius)
%
% Returns: vk = Returns the nernest potential for the potassium ions (V)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function vk = V_K(co_K, ci_K, T)
    R = 8.314; % Reiberg gas constant (joules/(mole*kelvin)).
    F = 9.648E4; % Faraday's constant (coulombs/mole).
    Z = 1; % Sodium and potassium ionic valence.
    TKelvin = 273.15 + T;
    
    vk = ((R*TKelvin)/(Z*F)*log(co_K/ci_K));
end