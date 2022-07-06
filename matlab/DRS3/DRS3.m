classdef DRS3 < DAC_ODEclass
    properties (SetAccess = protected, Hidden = true)
        
    end
%-------------------------------------------------------------------------
    methods (Access = private)

        function res__bigRHS = bigRHS( self, t, vars__ )

          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
    
          % evaluate function
          t1 = Fp(t);
          res__1 = -t1;
          t2 = cos(thetaT);
          t4 = sin(thetaT);
          res__2 = t2 * 0.266002488099999993e-2 + t4 * (-0.462191100700000022e-3);
          t6 = cos(thetaW);
          t8 = Twing_interpolation(thetaW);
          res__3 = t6 * (-0.475965504000000017e1) - t8;
          t9 = omegaT ^ 2;
          t11 = omegaW ^ 2;
          t15 = t9 * 0.534220827199999998e-1 + t11 * 0.534220827199999998e-1 + omegaT * omegaW * (-0.106844165440000000e0);
          t24 = sin(thetaW);
          res__4 = t6 * (t4 * t15 + t11 * (-0.527382408399999988e-1)) + t24 * (-t2 * t15 + t11 * 0.155116907500000012e0);
          t29 = vP * omegaT;
          t39 = vP ^ 2;
          res__5 = t2 * (t9 * (-0.385633708400000014e-2 + xP * 0.298877773700000002e-1) + t29 * 0.475155609600000015e-1) + t4 * (t9 * (0.495863060900000006e-2 + xP * (-0.237577804800000007e-1)) + t29 * 0.597755547400000004e-1) + 0.2e1 * t39;
          
    
          % store on output
          res__bigRHS = zeros(5,1);
          res__bigRHS(1) = res__1;
          res__bigRHS(2) = res__2;
          res__bigRHS(3) = res__3;
          res__bigRHS(4) = res__4;
          res__bigRHS(5) = res__5;
    
        end

        function res__JbigRHS = JbigRHS( self, t, vars__ )

          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
    
          % evaluate function
          t1 = sin(thetaT);
          t3 = cos(thetaT);
          res__2_2 = t1 * (-0.266002488099999993e-2) + t3 * (-0.462191100700000022e-3);
          t5 = sin(thetaW);
          t7 = diff(Twing_interpolation(thetaW), thetaW);
          res__3_3 = t5 * 0.475965504000000017e1 - t7;
          t8 = omegaT ^ 2;
          t10 = omegaW ^ 2;
          t12 = omegaT * omegaW;
          t15 = cos(thetaW);
          res__4_2 = (t1 * t5 + t3 * t15) * (t8 * 0.1e1 + t10 * 0.1e1 + t12 * (-0.2e1)) * 0.534220827199999998e-1;
          t23 = t12 * 0.106844165440000000e0 + t8 * (-0.534220827199999998e-1) + t10 * (-0.534220827199999998e-1);
          res__4_3 = t15 * (t3 * t23 + t10 * 0.155116907500000012e0) + t5 * (t1 * t23 + t10 * 0.527382408399999988e-1);
          t34 = omegaW * 0.106844165440000000e0 + omegaT * (-0.106844165440000000e0);
          t37 = -t34;
          res__4_5 = t15 * t1 * t37 + t3 * t5 * t34;
          res__4_6 = t15 * (t1 * t34 + omegaW * (-0.105476481679999998e0)) + t5 * (t3 * t37 + omegaW * 0.310233815000000024e0);
          res__5_1 = (t3 * 0.298877773700000002e-1 + t1 * (-0.237577804800000007e-1)) * t8;
          res__5_2 = (t3 * ((0.829541545966086119e-1 + xP * (-0.397449769949219989e0)) * omegaT + vP * 0.1e1) + t1 * ((0.645136143156435776e-1 + xP * (-0.500000000000000000e0)) * omegaT + vP * (-0.794899539898439977e0))) * omegaT * 0.597755547399999934e-1;
          res__5_4 = t1 * omegaT * 0.597755547400000004e-1 + t3 * omegaT * 0.475155609600000015e-1 + 0.4e1 * vP;
          res__5_5 = t3 * ((-0.771267416800000029e-2 + xP * 0.597755547400000004e-1) * omegaT + vP * 0.475155609600000015e-1) + t1 * ((0.991726121800000013e-2 + xP * (-0.475155609600000015e-1)) * omegaT + vP * 0.597755547400000004e-1);
          
          % store on output
          res__JbigRHS = zeros(5,6);
          res__JbigRHS(2,2) = res__2_2;
          res__JbigRHS(3,3) = res__3_3;
          res__JbigRHS(4,2) = res__4_2;
          res__JbigRHS(4,3) = res__4_3;
          res__JbigRHS(4,5) = res__4_5;
          res__JbigRHS(4,6) = res__4_6;
          res__JbigRHS(5,1) = res__5_1;
          res__JbigRHS(5,2) = res__5_2;
          res__JbigRHS(5,4) = res__5_4;
          res__JbigRHS(5,5) = res__5_5;
        end

        function res__bigM = bigM( self, t, vars__ )
    
          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
    
          % evaluate function
          res__1_1 = 0.2356194490e0;
          t1 = cos(thetaT);
          t3 = sin(thetaT);
          res__1_5 = t1 * 0.298877773700000002e-1 + t3 * (-0.237577804800000007e-1) - 0.2e1 * xP + 0.319766185099999989e0;
          res__2_2 = 0.9195617223e-5;
          t6 = cos(thetaW);
          t9 = sin(thetaW);
          res__2_4 = t1 * t6 * 0.534220827199999998e-1 + t3 * t9 * 0.534220827199999998e-1;
          res__2_5 = t3 * (0.385633708400000014e-2 + xP * (-0.298877773700000002e-1)) + t1 * (0.495863060900000006e-2 + xP * (-0.237577804800000007e-1));
          res__3_3 = 0.4916531200e-1;
          res__3_4 = t6 * (t1 * (-0.534220827199999998e-1) + 0.155116907500000012e0) + t9 * (t3 * (-0.534220827199999998e-1) + 0.527382408399999988e-1);
          res__4_2 = res__2_4;
          res__4_3 = res__3_4;
          res__5_1 = res__1_5;
          res__5_2 = res__2_5;
          
          % store on output
          res__bigM = zeros(5,5);
          res__bigM(1,1) = res__1_1;
          res__bigM(1,5) = res__1_5;
          res__bigM(2,2) = res__2_2;
          res__bigM(2,4) = res__2_4;
          res__bigM(2,5) = res__2_5;
          res__bigM(3,3) = res__3_3;
          res__bigM(3,4) = res__3_4;
          res__bigM(4,2) = res__4_2;
          res__bigM(4,3) = res__4_3;
          res__bigM(5,1) = res__5_1;
          res__bigM(5,2) = res__5_2;
        end

        function res__bigETA = bigETA( self, t, vars__ )

          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
    
          % evaluate function
          t1 = cos(thetaT);
          t4 = sin(thetaT);
          t8 = -0.2e1 * xP + 0.319766185099999989e0;
          res__1 = t1 * mu5 * 0.298877773700000002e-1 + t4 * mu5 * (-0.237577804800000007e-1) + mu5 * t8 + 0.2356194490e0 * mu1;
          t11 = cos(thetaW);
          t15 = 0.495863060900000006e-2 + xP * (-0.237577804800000007e-1);
          t19 = sin(thetaW);
          t23 = 0.385633708400000014e-2 + xP * (-0.298877773700000002e-1);
          res__2 = t1 * (t11 * mu4 * 0.534220827199999998e-1 + mu5 * t15) + t4 * (t19 * mu4 * 0.534220827199999998e-1 + mu5 * t23) + 0.9195617223e-5 * mu2;
          res__3 = t11 * (mu4 * t1 * (-0.534220827199999998e-1) + mu4 * 0.155116907500000012e0) + t19 * (t4 * mu4 * (-0.534220827199999998e-1) + mu4 * 0.527382408399999988e-1) + 0.4916531200e-1 * mu3;
          t41 = mu2 * 0.534220827199999998e-1 + mu3 * (-0.534220827199999998e-1);
          res__4 = t11 * (t1 * t41 + mu3 * 0.155116907500000012e0) + t19 * (t4 * t41 + mu3 * 0.527382408399999988e-1);
          res__5 = t1 * (mu1 * 0.298877773700000002e-1 + mu2 * t15) + t4 * (mu1 * (-0.237577804800000007e-1) + mu2 * t23) + mu1 * t8;
          
    
          % store on output
          res__bigETA = zeros(5,1);
          res__bigETA(1) = res__1;
          res__bigETA(2) = res__2;
          res__bigETA(3) = res__3;
          res__bigETA(4) = res__4;
          res__bigETA(5) = res__5;
    
        end

        function res__JbigETA = JbigETA( self, t, vars__ )
    
          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
    
          % evaluate function
          res__1_1 = -0.2e1 * mu5;
          t2 = sin(thetaT);
          t4 = cos(thetaT);
          res__1_2 = mu5 * (t2 * (-0.298877773700000002e-1) + t4 * (-0.237577804800000007e-1));
          res__2_1 = res__1_2;
          t7 = sin(thetaW);
          t11 = 0.385633708400000014e-2 + xP * (-0.298877773700000002e-1);
          t15 = cos(thetaW);
          t19 = -0.495863060900000006e-2 + xP * 0.237577804800000007e-1;
          res__2_2 = t4 * (t7 * mu4 * 0.534220827199999998e-1 + mu5 * t11) + t2 * (t15 * mu4 * (-0.534220827199999998e-1) + mu5 * t19);
          t23 = t4 * t7;
          t25 = t2 * t15;
          res__2_3 = mu4 * (t23 * 0.1e1 + t25 * (-0.1e1)) * (-0.534220827199999998e-1);
          res__3_2 = res__2_3;
          res__3_3 = mu4 * (t25 * (-0.534220827199999998e-1) + t15 * 0.527382408399999988e-1 + t23 * 0.534220827199999998e-1 + t7 * (-0.155116907500000012e0));
          t37 = mu2 * 0.534220827199999998e-1 + mu3 * (-0.534220827199999998e-1);
          t40 = -t37;
          res__4_2 = t15 * t2 * t40 + t4 * t7 * t37;
          res__4_3 = t15 * (t2 * t37 + mu3 * 0.527382408399999988e-1) + t7 * (t4 * t40 + mu3 * (-0.155116907500000012e0));
          res__5_1 = -0.2e1 * mu1 + (t2 * 0.125802060487764900e1 + t4 * 0.1e1) * mu2 * (-0.237577804799999973e-1);
          res__5_2 = t4 * (mu1 * (-0.237577804800000007e-1) + mu2 * t11) + t2 * (mu2 * t19 + mu1 * (-0.298877773700000002e-1));
          
          % store on output
          res__JbigETA = zeros(5,6);
          res__JbigETA(1,1) = res__1_1;
          res__JbigETA(1,2) = res__1_2;
          res__JbigETA(2,1) = res__2_1;
          res__JbigETA(2,2) = res__2_2;
          res__JbigETA(2,3) = res__2_3;
          res__JbigETA(3,2) = res__3_2;
          res__JbigETA(3,3) = res__3_3;
          res__JbigETA(4,2) = res__4_2;
          res__JbigETA(4,3) = res__4_3;
          res__JbigETA(5,1) = res__5_1;
          res__JbigETA(5,2) = res__5_2;
        end

    end
%-------------------------------------------------------------------------
    methods
        function self = DRS3()
            neq  = 8;
            ninv = 6;
            self@DAC_ODEclass( 'DRS3', neq, ninv );
        end
%-------------------------------------------------------------------------
        
        function res__Phi = Phi( self, t, vars__ )

          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
          vP__d = vars__(7);
          omegaT__d = vars__(8);
          omegaW__d = vars__(9);
    
          % evaluate function
          t1 = -YP + YT;
          t2 = cos(thetaT);
          t4 = sin(thetaT);
          t5 = LP - XT + xP;
          t9 = LT2 ^ 2;
          t10 = t9 ^ 2;
          t11 = LT1 ^ 2;
          t12 = LT3 ^ 2;
          t17 = (LT1 - LT3) ^ 2;
          t19 = (LT1 + LT3) ^ 2;
          t26 = sqrt(0.1e1 / t12 / t9 * (-t10 + t9 * (2 * t11 + 2 * t12) - t19 * t17));
          t29 = t11 - t9 - t12;
          t35 = LP ^ 2;
          t39 = XT ^ 2;
          t42 = xP ^ 2;
          res__1 = 0.1e1 / LT2 * (t26 * LT3 * (t2 * t1 + t5 * t4) * LT2 + t2 * t5 * t29 - t4 * t1 * t29 + (t12 + t35 + (-2 * XT + 2 * xP) * LP + t39 - 2 * xP * XT + t42 + (YP - YT + Lrod) * (YP - YT - Lrod)) * LT2);
          t52 = cos(thetaW);
          t54 = sin(thetaW);
          res__2 = t52 * (-LT2 * t4 - YT + YW) + (LT2 * t2 + XT - XW) * t54;
          
    
          % store on output
          res__Phi = zeros(2,1);
          res__Phi(1) = res__1;
          res__Phi(2) = res__2;
    
        end

        function res__rhs = rhs( self, t, vars__ )

          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
          vP__d = vars__(7);
          omegaT__d = vars__(8);
          omegaW__d = vars__(9);
    
          % evaluate function
          res__1 = vP;
          res__2 = omegaT;
          res__3 = omegaW;
          res__4 = vP__d;
          res__5 = omegaT__d;
          res__6 = omegaW__d;
          
    
          % store on output
          res__rhs = zeros(6,1);
          res__rhs(1) = res__1;
          res__rhs(2) = res__2;
          res__rhs(3) = res__3;
          res__rhs(4) = res__4;
          res__rhs(5) = res__5;
          res__rhs(6) = res__6;
    
        end

        function res__h = h( self, t, vars__ )

          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
          vP__d = vars__(7);
          omegaT__d = vars__(8);
          omegaW__d = vars__(9);
    
          % evaluate function
          t1 = sin(thetaT);
          t4 = cos(thetaW);
          t6 = cos(thetaT);
          t9 = sin(thetaW);
          res__1 = t4 * (t1 * 0.534220827199999998e-1 - 0.527382408399999988e-1) + t9 * (t6 * (-0.534220827199999998e-1) + 0.155116907500000012e0);
          t12 = -0.385633708400000014e-2 + xP * 0.298877773700000002e-1;
          t15 = 0.495863060900000006e-2 + xP * (-0.237577804800000007e-1);
          t17 = xP ^ 2;
          res__2 = t6 * t12 + t1 * t15 - 0.1e1 * t17 + xP * 0.319766185099999989e0 - 0.261199923200000003e-1;
          t22 = omegaT * (-0.534220827199999998e-1) + omegaW * 0.534220827199999998e-1;
          res__3 = t4 * (t6 * t22 + omegaW * (-0.155116907500000012e0)) + t9 * (t1 * t22 + omegaW * (-0.527382408399999988e-1));
          res__4 = t6 * (-omegaT * t15 + vP * (-0.298877773700000002e-1)) + t1 * (omegaT * t12 + vP * 0.237577804800000007e-1) + (-0.3197661851e0 + 0.2e1 * xP) * vP;
          t43 = t6 ^ 2;
          t47 = -0.517174965356253313e1 + lambda2 * (-0.337094098577705503e0);
          t50 = lambda2 * t1;
          t51 = t50 * 0.114608717019024725e0;
          t53 = t4 ^ 2;
          t58 = -0.154534563286436963e2 + (xP * (-0.138021198991278453e3) + 0.288072424225434567e2) * lambda1;
          t65 = xP * (-0.173633512094776677e3) + 0.224034508747251451e2;
          t66 = lambda1 * t65;
          t69 = Twing_interpolation(thetaW);
          t78 = omegaT * omegaW * 0.106844165440000000e0;
          t79 = omegaT ^ 2;
          t81 = omegaW ^ 2;
          res__5 = t53 * (t43 * lambda2 * 0.620828952199662467e3 + t6 * t47 + 0.150167453565879345e2 + lambda2 * (-0.309981651978861066e3) + t51) + t4 * (t43 * t58 + t6 * (t9 * (t50 * 0.620828952199662467e3 + lambda2 * (-0.114608717019024725e0)) + t1 * (0.268510645940653969e1 + t66) + t69 * (-0.108658077320715507e1)) + t9 * (t1 * t47 + 0.510554746102507284e1 + lambda2 * 0.332779046629684383e0) + t1 * (t78 + t79 * (-0.534220827199999998e-1) + t81 * (-0.534220827199999998e-1)) + t69 * 0.315500708147705033e1 + 0.5273824084e-1 * t81) + t43 * (t9 * (-0.268510645940653969e1 - lambda1 * t65) + lambda2 * (-0.310414476099831234e3)) + t6 * t9 * (t1 * t58 + 0.5342208272e-1 * t81 + 0.5342208272e-1 * t79 - t78) + t9 * (t1 * t69 * (-0.108658077320715507e1) + t69 * 0.107267174156912692e1 + t66 + 0.268510645940653969e1 - 0.1551169075e0 * t81) + lambda2 * 0.310471046920480376e3 - t51;
          t110 = xP * lambda2;
          t112 = lambda2 * (-0.224034508631061122e2) + t110 * 0.173633512094776677e3;
          t116 = lambda2 * 0.288072424109244274e2 + t110 * (-0.138021198875088146e3);
          t118 = t17 * lambda1;
          t127 = -t112;
          t140 = vP * omegaT;
          t144 = Fp(t);
          t167 = vP ^ 2;
          res__6 = t43 * (t9 * t112 + t4 * t116 + t118 * (-0.357612865123933332e2) + (lambda1 * (-0.554332186811407723e0) + 0.837465827627087478e1) * xP - 0.162821538867840654e1 + lambda1 * 0.105806011978450765e1) + t6 * (t1 * (t9 * t116 + t4 * t127 + t118 * 0.154436018066779866e3 + (0.745154947638308407e1 + lambda1 * (-0.521597303968669479e2)) * xP + lambda1 * 0.415294341947984780e1 - 0.866295046575568994e0) + xP * (lambda1 * (-0.507390667359178593e0) - 0.2988777737e-1 * t79) + t140 * (-0.475155609600000015e-1) + lambda1 * 0.811231890400862660e-1 + 0.3856337084e-2 * t79 + t144 * 0.126847666845541801e0) + t1 * (xP * (lambda1 * 0.403324608022344544e0 + 0.2375778048e-1 * t79) + t140 * (-0.597755547400000004e-1) + lambda1 * (-0.644847856414233200e-1) - 0.4958630609e-2 * t79 + t144 * (-0.100831152012711769e0)) + t9 * t127 + t144 * (0.135712983986385516e1 + xP * (-0.848826363200000067e1)) + t118 * 0.114118373650675736e3 + (-0.150222267623136196e1 + lambda1 * (-0.304964058132851612e2)) * xP + lambda1 * 0.205357971481856927e1 - 0.2e1 * t167 + 0.193827628701208010e0;
          
    
          % store on output
          res__h = zeros(6,1);
          res__h(1) = res__1;
          res__h(2) = res__2;
          res__h(3) = res__3;
          res__h(4) = res__4;
          res__h(5) = res__5;
          res__h(6) = res__6;
    
        end

        function res__DhDx = DhDx( self, t, vars__ )

          % extract states
          xP = vars__(1);
          thetaT = vars__(2);
          thetaW = vars__(3);
          vP = vars__(4);
          omegaT = vars__(5);
          omegaW = vars__(6);
          vP__d = vars__(7);
          omegaT__d = vars__(8);
          omegaW__d = vars__(9);
    
          % evaluate function
          t1 = cos(thetaW);
          t2 = cos(thetaT);
          t5 = sin(thetaW);
          t6 = sin(thetaT);
          t7 = t6 * t5;
          res__1_2 = t2 * t1 * 0.534220827199999998e-1 + t7 * 0.534220827199999998e-1;
          t10 = t2 * (-0.534220827199999998e-1) + 0.155116907500000012e0;
          t13 = t6 * (-0.534220827199999998e-1) + 0.527382408399999988e-1;
          res__1_3 = t1 * t10 + t5 * t13;
          t15 = t2 * 0.298877773700000002e-1;
          t16 = t6 * 0.237577804800000007e-1;
          res__2_1 = t15 - t16 - 0.2e1 * xP + 0.319766185099999989e0;
          t19 = 0.495863060900000006e-2 + xP * (-0.237577804800000007e-1);
          t22 = 0.385633708400000014e-2 + xP * (-0.298877773700000002e-1);
          res__2_2 = t2 * t19 + t6 * t22;
          t28 = t6 * t1;
          res__3_2 = (t2 * t5 - 0.1e1 * t28) * (omegaT * 0.1e1 + omegaW * (-0.1e1)) * (-0.534220827199999998e-1);
          t35 = omegaT * (-0.534220827199999998e-1) + omegaW * 0.534220827199999998e-1;
          res__3_3 = t1 * (t6 * t35 + omegaW * (-0.527382408399999988e-1)) + t5 * (-t2 * t35 + omegaW * 0.155116907500000012e0);
          res__3_5 = -res__1_2;
          res__3_6 = -t1 * t10 - t5 * t13;
          t49 = t2 * omegaT;
          t51 = t6 * omegaT;
          res__4_1 = t49 * 0.237577804800000007e-1 + t51 * 0.298877773700000002e-1 + vP * 0.2e1;
          t54 = -t22;
          res__4_2 = t2 * (omegaT * t54 + vP * 0.237577804800000007e-1) + t6 * (omegaT * t19 + vP * 0.298877773700000002e-1);
          res__4_4 = -t15 + t16 + xP * 0.2e1 - 0.319766185099999989e0;
          res__4_5 = -t2 * t19 + t6 * t54;
          t68 = t5 * 0.125802060381861036e1;
          t70 = t2 ^ 2;
          res__5_1 = (t70 * (t1 * 0.1e1 - t68) + t2 * (t28 * 0.125802060381861036e1 + t7 * 0.1e1) + t68) * lambda1 * (-0.138021198991278453e3);
          t79 = lambda2 * t5;
          t80 = t79 * 0.124165790439932493e4;
          t83 = (xP * (-0.347267024189553354e3) + 0.448069017494502901e2) * lambda1;
          t87 = xP * (-0.276042397982556906e3) + 0.576144848450869134e2;
          t93 = lambda2 * 0.114608717019024725e0;
          t94 = t6 * lambda2;
          t95 = t94 * 0.124165790439932493e4;
          t97 = t1 ^ 2;
          t100 = -0.517174965356253313e1 + lambda2 * (-0.337094098577705503e0);
          t107 = omegaT * omegaW * 0.106844165440000000e0;
          t108 = omegaT ^ 2;
          t109 = t108 * 0.534220827199999998e-1;
          t110 = omegaW ^ 2;
          t111 = t110 * 0.534220827199999998e-1;
          t116 = Twing_interpolation(thetaW);
          t117 = t116 * 0.108658077320715507e1;
          t120 = t94 * 0.620828952199662467e3;
          t124 = -t6 * t100;
          t131 = t6 * t116 * 0.108658077320715507e1;
          t133 = xP * 0.173633512094776677e3 - 0.224034508747251451e2;
          t134 = lambda1 * t133;
          t137 = 0.5342208272e-1 * t108;
          t138 = 0.5342208272e-1 * t110;
          t142 = xP * 0.138021198991278453e3 - 0.288072424225434567e2;
          t143 = lambda1 * t142;
          res__5_2 = t70 * (t1 * (t80 + 0.537021291881307938e1 + t83) + t5 * (-0.309069126572873927e2 + lambda1 * t87)) + t2 * (t97 * (t93 - t95) + t1 * (t5 * t100 + t6 * (0.309069126572873927e2 - lambda1 * t87) + t107 - t109 - t111) + t5 * (t6 * (0.537021291881307938e1 + t83) - t117) - t93 + t120) + t97 * t124 + t1 * (t5 * (lambda2 * (-0.620828952199662467e3) + t94 * 0.114608717019024725e0) + t131 - 0.268510645940653969e1 + t134) + t5 * (t6 * (-t137 - t138 + t107) + 0.154534563286436963e2 + t143);
          t153 = diff(Twing_interpolation(thetaW), thetaW);
          t159 = -0.103434993071250663e2 + lambda2 * (-0.674188197155411006e0);
          res__5_3 = t153 * (t1 * (0.315500708147705033e1 + t2 * (-0.108658077320715507e1)) + t5 * (0.107267174156912692e1 + t6 * (-0.108658077320715507e1))) + t97 * (t2 * (lambda2 * (-0.229217434038049450e0) + t95) + t6 * t159 + lambda2 * 0.665558093259368766e0 + 0.102110949220501457e2) + t1 * (t70 * (-t80 - 0.268510645940653969e1 + t134) + t2 * (-t5 * t159 + t6 * (-0.154534563286436963e2 - lambda1 * t142) + t138 + t137 - t107) + t5 * (lambda2 * 0.619963303957722133e3 + t94 * (-0.229217434038049450e0) - 0.300334907131758690e2) - t131 + t116 * 0.107267174156912692e1 - lambda1 * t133 + 0.268510645940653969e1 - 0.1551169075e0 * t110) + t70 * t5 * (0.154534563286436963e2 + t143) + t2 * (t5 * (t6 * (-0.268510645940653969e1 + t134) + t117) + t93 - t120) + t5 * (t6 * (t109 + t111 - t107) - 0.5273824084e-1 * t110 + t116 * (-0.315500708147705033e1)) + t124 + lambda2 * (-0.332779046629684383e0) - 0.510554746102507284e1;
          t202 = omegaW * 0.106844165440000000e0 + omegaT * (-0.106844165440000000e0);
          t205 = -t202;
          res__5_5 = t1 * t6 * t202 + t2 * t5 * t205;
          res__5_6 = t1 * (t6 * t205 + omegaW * 0.105476481679999998e0) + t5 * (t2 * t202 + omegaW * (-0.310233815000000024e0));
          t216 = t79 * 0.173633512094776677e3;
          t217 = lambda2 * t1;
          t231 = lambda1 * 0.507390667359178593e0;
          t232 = 0.2988777737e-1 * t108;
          t235 = lambda1 * 0.403324608022344544e0;
          t239 = Fp(t);
          res__6_1 = t70 * (t216 + t217 * (-0.138021198875088146e3) + 0.837465827627087478e1 + (xP * (-0.715225730247866665e2) - 0.554332186811407723e0) * lambda1) + t2 * (t6 * (t79 * (-0.138021198875088146e3) + t217 * (-0.173633512094776677e3) + 0.745154947638308407e1 + (xP * 0.308872036133559732e3 - 0.521597303968669479e2) * lambda1) - t231 - t232) + t6 * (t235 + t108 * 0.237577804800000007e-1) - t216 + t239 * (-0.848826363200000067e1) - 0.150222267623136196e1 + (xP * 0.228236747301351471e3 - 0.304964058132851612e2) * lambda1;
          t245 = xP * lambda2;
          t247 = lambda2 * 0.448069017262122244e2 + t245 * (-0.347267024189553354e3);
          t251 = lambda2 * 0.576144848218488548e2 + t245 * (-0.276042397750176292e3);
          t253 = xP ^ 2;
          t254 = t253 * lambda1;
          t278 = vP * omegaT;
          res__6_2 = t70 * (t1 * t247 + t5 * t251 + t254 * 0.308872036133559732e3 + (0.149030989527661681e2 + lambda1 * (-0.104319460793733896e3)) * xP - 0.173259009315113799e1 + lambda1 * 0.830588683895969560e1) + t2 * (t6 * (-t1 * t251 + t5 * t247 + t254 * 0.715225730247866665e2 + (-0.167493165525417496e2 + lambda1 * 0.110866437362281545e1) * xP + 0.325643077735681308e1 + lambda1 * (-0.211612023956901529e1)) + t239 * (-0.100831152012711769e0) + xP * (t235 + 0.2375778048e-1 * t108) - 0.4958630609e-2 * t108 + lambda1 * (-0.644847856414233200e-1) + t278 * (-0.597755547400000004e-1)) + t6 * (t239 * (-0.126847666845541801e0) + xP * (t232 + t231) - 0.3856337084e-2 * t108 + t278 * 0.475155609600000015e-1 + lambda1 * (-0.811231890400862660e-1)) + t1 * (lambda2 * (-0.224034508631061122e2) + t245 * 0.173633512094776677e3) + t5 * (t245 * 0.138021198875088146e3 + lambda2 * (-0.288072424109244274e2)) + t254 * (-0.154436018066779866e3) + (-0.745154947638308407e1 + lambda1 * 0.521597303968669479e2) * xP + lambda1 * (-0.415294341947984780e1) + 0.866295046575568994e0;
          t304 = -0.129027228631287155e0 + xP * 0.1e1;
          t307 = -0.165908309193217224e0 + xP * 0.794899539898439755e0;
          res__6_3 = (t70 * (t1 * t304 + t5 * t307) + t2 * (-t1 * t6 * t307 + t6 * t5 * t304) - t1 * t304) * lambda2 * 0.173633512094776677e3;
          res__6_4 = t49 * (-0.475155609600000015e-1) + t51 * (-0.597755547400000004e-1) + vP * (-0.4e1);
          res__6_5 = t2 * ((xP * (-0.597755547400000004e-1) + 0.771267416800000029e-2) * omegaT + vP * (-0.475155609600000015e-1)) + t6 * ((xP * 0.475155609600000015e-1 - 0.991726121800000013e-2) * omegaT + vP * (-0.597755547400000004e-1));
          
          % store on output
          res__DhDx = zeros(6,9);
          res__DhDx(1,2) = res__1_2;
          res__DhDx(1,3) = res__1_3;
          res__DhDx(2,1) = res__2_1;
          res__DhDx(2,2) = res__2_2;
          res__DhDx(3,2) = res__3_2;
          res__DhDx(3,3) = res__3_3;
          res__DhDx(3,5) = res__3_5;
          res__DhDx(3,6) = res__3_6;
          res__DhDx(4,1) = res__4_1;
          res__DhDx(4,2) = res__4_2;
          res__DhDx(4,4) = res__4_4;
          res__DhDx(4,5) = res__4_5;
          res__DhDx(5,1) = res__5_1;
          res__DhDx(5,2) = res__5_2;
          res__DhDx(5,3) = res__5_3;
          res__DhDx(5,5) = res__5_5;
          res__DhDx(5,6) = res__5_6;
          res__DhDx(6,1) = res__6_1;
          res__DhDx(6,2) = res__6_2;
          res__DhDx(6,3) = res__6_3;
          res__DhDx(6,4) = res__6_4;
          res__DhDx(6,5) = res__6_5;
        end


    end



end