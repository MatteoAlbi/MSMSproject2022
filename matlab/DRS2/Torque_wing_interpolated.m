function [torque] = Torque_wing_interpolated(thetaW)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if(thetaW < pi/72)
        torque = -3.50000000000000000 + 54.4975454416281551*thetaW - 937.794452250338736*thetaW^3;
    elseif(thetaW < pi/36)
        torque = -3.34419198922177952 + 49.1412605728508822*thetaW - 122.757006740288688*(thetaW - pi/72)^2 + 3485.19018883941408*(thetaW - pi/72)^3;
    elseif(thetaW < pi/24)
        torque = -4.09065607807205467 + 58.3346216376128552*thetaW + 333.453322160591597*(thetaW - pi/36)^2 - 2168.92765139676430*(thetaW - pi/36)^3;
    elseif(thetaW < pi/18)
        torque = -5.82348757001314610 + 75.0459170383314387*thetaW + 49.5413565024316398*(thetaW - pi/24)^2 - 4439.73616255062916*(thetaW - pi/24)^3;
    elseif(thetaW < 5*pi/72)
        torque = -2.42675414652037524 + 54.0113227032541801*thetaW - 531.618748170318213*(thetaW - pi/18)^2 + 5482.48743265186749*(thetaW - pi/18)^3;
    elseif(thetaW < pi/12)
        torque = 0.306250006555863763 + 38.9324821440060447*thetaW + 186.037178572076499*(thetaW - (5*pi)/72)^2 - 4248.61077152171401*(thetaW - (5*pi)/72)^3;
    elseif(thetaW < 7*pi/72)
        torque = 2.41013118008632432 + 30.9010226756673916*thetaW - 370.104670918551903*(thetaW - pi/12)^2 + 4289.26321896129048*(thetaW - pi/12)^3;
    elseif(thetaW < pi/9)
        torque = 4.44397114301546381 + 23.1017527757110912*thetaW + 191.358571498185512*(thetaW - (7*pi)/72)^2 - 4481.96759743745861*(thetaW - (7*pi)/72)^3;
    elseif(thetaW < pi/8)
        torque = 7.54262367126099065 + 14.2018370528858142*thetaW - 395.329615074190144*(thetaW - pi/9)^2 + 5212.13266390255376*(thetaW - pi/9)^3;
    elseif(thetaW < 5*pi/36)
        torque = 9.08023057657969446 + 9.47231505315406963*thetaW + 286.936955194629263*(thetaW - pi/8)^2 - 9143.87062369905470*(thetaW - pi/8)^3;
    elseif(thetaW < 11*pi/72)
        torque = 20.7290289574998638 - 17.7136295576527054*thetaW - 909.992910504890574*(thetaW - (5*pi)/36)^2 + 4880.14423782341419*(thetaW - (5*pi)/36)^3;
    elseif(thetaW < pi/6)
        torque = 44.1386574460345784 - 69.2521741123709660*thetaW - 271.183523588032187*(thetaW - (11*pi)/72)^2 + 11291.3709758265122*(thetaW - (11*pi)/72)^3;
    elseif(thetaW < 13*pi/72)
        torque = 23.1837509631240479 - 28.4258704466477532*thetaW + 1206.85348085420060*(thetaW - pi/6)^2 - 11524.6018239363657*(thetaW - pi/6)^3;
    else
        torque = 2.12169613024336101 + 11.0683173597150208*thetaW - 301.713370213550149*(thetaW - (13*pi)/72)^2 + 2304.92036478727277*(thetaW - (13*pi)/72)^3;
    end

    
end