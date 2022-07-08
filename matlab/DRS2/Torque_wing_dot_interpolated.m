function [torque_dot] = Torque_wing_dot_interpolated(thetaW)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if(thetaW < pi/72)
        torque_dot = 54.49754548 - 2813.383354*thetaW^2;
    elseif(thetaW < pi/36)
        torque_dot = 59.85383036 - 245.5140135*thetaW + 10455.57057*(thetaW - pi/72)^2;
    elseif(thetaW < pi/24)
        torque_dot = 0.13603791 + 666.9066442*thetaW - 6506.782958*(thetaW - pi/36)^2;
    elseif(thetaW < pi/18)
        torque_dot = 62.07602024 + 99.08271299*thetaW - 13319.20849*(thetaW - pi/24)^2;
    elseif(thetaW < 5*pi/72)
        torque_dot = 239.5812731 - 1063.237496*thetaW + 16447.46231*(thetaW - pi/18)^2;
    elseif(thetaW < pi/12)
        torque_dot = -42.24155031 + 372.0743572*thetaW - 12745.83231*(thetaW - 5*pi/72)^2;
    elseif(thetaW < 7*pi/72)
        torque_dot = 224.6873755 - 740.2093426*thetaW + 12867.78966*(thetaW - pi/12)^2;
    elseif(thetaW < pi/9)
        torque_dot = -93.79254651 + 382.7171429*thetaW - 13445.90279*(thetaW - 7*pi/72)^2;
    elseif(thetaW < pi/8)
        torque_dot = 290.1939736 - 790.6592303*thetaW + 15636.39799*(thetaW - pi/9)^2;
    elseif(thetaW < 5*pi/36)
        torque_dot = -215.8874425 + 573.8739101*thetaW - 27431.61189*(thetaW - pi/8)^2;
    elseif(thetaW < 11*pi/72)
        torque_dot = 776.4049935 - 1819.985821*thetaW + 14640.43271*(thetaW - 5*pi/36)^2;
    elseif(thetaW < pi/6)
        torque_dot = 776.4049935 - 1819.985821*thetaW + 14640.43271*(thetaW - 11*pi/72)^2;
    elseif(thetaW < 13*pi/72)
        torque_dot = -1292.239879 + 2413.706960*thetaW - 34573.80547*(thetaW - pi/6)^2;
    else
        torque_dot = 353.3512783 - 603.4267399*thetaW + 6914.761097*(thetaW - 13*pi/72)^2;
    end

end