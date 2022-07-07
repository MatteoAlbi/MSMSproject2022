%% Initialize by cleaning memory and widows
clear all;
close all;
clc;

%% Initialize parameters of the model and instantiate model class
Iz_flap = 0.01229132800;
L0 = -0.055;
L2 = 0.020;
L3 = 0.100;
L4 = 0.152;
LMP = 0.180;
Lbase = 0.010;
g = 9.81;
m_flap = 6.384000;
xE = 0.365;
yE = 0.145;
m_piston = 0.04712388981;
ForcePiston = 1500;
TorqueWing = 12;
ode   = DRS2(Iz_flap, L0, L2, L3, L4, LMP, Lbase, g, m_flap, xE, yE, m_piston, ForcePiston, TorqueWing);

%% Initialize the solver class
solver = ExplicitEuler();
solver.setODE(ode);

%% Select the range and the sampling point for the numerical solution
Tmax = 0.05;
h    = 0.001;
tt   = 0:h:Tmax;

%% Set consistent initial conditions
      theta3_0 = -(29*pi)/36;
      s_0 = 0.00318539355;
      lambda1_0 = -1338.613895;
      omega3_0 = 0;
      vp_0 = 0;
ini        = [theta3_0, s_0, lambda1_0, omega3_0, vp_0];

%% Compute numerical solution
sol_1 = solver.advance( tt, ini, true, true);

%% Extract solution
theta3_sol  = sol_1(1,:);
s_sol       = sol_1(2,:);
lambda1_sol = sol_1(3,:);
omega3_sol  = sol_1(4,:);
vp_sol      = sol_1(5,:);


