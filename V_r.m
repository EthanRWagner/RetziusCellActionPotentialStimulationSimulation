%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function: V_r
% Revision Date: 12/11/09
% Author: Robert B. Szlavik
%
% Find the resting membrane potential for sodium and potassium using
% the Goldmann Equation.
%
% Inputs: coNa = Extracellular sodium concentration in
% (moles/liter)
% ciNa = Intracellular sodium concentration in
% (moles/liter)
% coK = Extracellular potassium concentration in
% (moles/liter)
% ciK = Intracellular potassium concentration in
% moles/liter
% T = Temperature in degrees (Celsius)
% b = Relative permeability of sodium to potassium
%
% Returns: Vr = Resting transmembrane potential in (V)
%
% Internal: R = Reiberg Gas Constant in (joules/(mole*kelvin))
% F = Faraday's Constant in (coulombs/mole)
% Z = Sodium and potassium ionic valence
% TKelvin = Temperature in degrees (Kelvin)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Vr = V_r(coNa,ciNa,coK,ciK,T,b)
    R = 8.314; % Reiberg gas constant (joules/(mole*kelvin)).
    F = 9.648E4; % Faraday's constant (coulombs/mole).
    Z = 1; % Sodium and potassium ionic valence.
    TKelvin = 273.15 + T;
    Vr = ((R*TKelvin)/(Z*F))*log((coK + b*coNa)/(ciK + b*ciNa));
end