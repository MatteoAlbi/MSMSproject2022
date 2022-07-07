classdef DRS2 < DAC_ODEclass
  properties (SetAccess = protected, Hidden = true)
        Iz_flap;
        L0;
        L2;
        L3;
        L4;
        LMP;
        Lbase;
        g;
        m_flap;
        xE;
        yE;
        m_piston;
        ForcePiston;
        TorqueWing;
  end
  methods
      function self = DRS2(Iz_flap, L0, L2, L3, L4, LMP, Lbase, g, m_flap, xE, yE, m_piston, ForcePiston, TorqueWing)
      neq  = 5;
      ninv = 3;
      self@DAC_ODEclass('DRS2',neq,ninv);
      
      self.Iz_flap = Iz_flap;
      self.L0 = L0;
      self.L2 = L2;
      self.L3 = L3;
      self.L4 = L4;
      self.LMP = LMP;
      self.Lbase = Lbase;
      self.g = g;
      self.m_flap = m_flap;
      self.xE = xE;
      self.yE = yE;
      self.m_piston = m_piston;
      self.ForcePiston = ForcePiston;
      self.TorqueWing = TorqueWing;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res__f = f( self, t, vars__ )

      Iz_flap = self.Iz_flap;
      L0 = self.L0;
      L2 = self.L2;
      L3 = self.L3;
      L4 = self.L4;
      LMP = self.LMP;
      Lbase = self.Lbase;
      g = self.g;
      m_flap = self.m_flap;
      xE = self.xE;
      yE = self.yE;
      m_piston = self.m_piston;
      ForcePiston = self.ForcePiston;
      TorqueWing = self.TorqueWing;

      % extract states
      theta3 = vars__(1);
      s = vars__(2);
      lambda1 = vars__(3);
      omega3 = vars__(4);
      vp = vars__(5);

      % evaluate function
      res__1 = omega3;
      res__2 = vp;
      t2 = L4 ^ 2;
      t4 = L0 + L2 + Lbase - yE + s;
      t5 = xE - LMP;
      t6 = omega3 * t5;
      t10 = cos(theta3);
      t11 = t10 ^ 2;
      t15 = t2 * omega3;
      t20 = (s + L0 + L2 + xE - yE - LMP + Lbase) * (s + L0 + L2 - xE - yE + LMP + Lbase);
      t25 = omega3 * Iz_flap;
      t28 = sin(theta3);
      t31 = omega3 ^ 2;
      t54 = lambda1 * t4 - 0.3e1 / 0.8e1 * ForcePiston;
      t64 = vp * lambda1;
      t86 = t4 * t5;
      t99 = m_flap * t2;
      t112 = t99 + 4 * Iz_flap;
      t117 = t2 ^ 2;
      t120 = t5 ^ 2;
      t124 = Lbase ^ 2;
      t129 = L0 ^ 2;
      t134 = L2 ^ 2;
      t139 = s ^ 2;
      t143 = yE ^ 2;
      t149 = t4 ^ 2;
      res__3 = 0.1e1 / (8 * t11 * (-t99 / 4 + m_piston * t20 - Iz_flap) * t2 + 16 * t10 * t86 * t2 * t28 * m_piston - 4 * t28 * t4 * t112 * L4 + 2 * m_flap * t117 + t2 * (8 * m_piston * t120 + 8 * Iz_flap + m_flap * (2 * t124 + (4 * s + 4 * L0 + 4 * L2 - 4 * yE) * Lbase + 2 * t129 + (4 * s + 4 * L2 - 4 * yE) * L0 + 2 * t134 + (4 * s - 4 * yE) * L2 + 2 * t139 - 4 * s * yE + 2 * t143)) + 8 * t149 * Iz_flap) * (-64 * t11 * (t6 + vp / 2) * t4 * t2 * lambda1 * m_piston + 32 * t10 * (t28 * L4 * lambda1 * (-m_flap * t15 / 4 + m_piston * (omega3 * t20 - t5 * vp) - t25) + t15 * m_flap * (m_piston * t4 * t31 + 8 * lambda1 * t4 - 3 * ForcePiston) / 32 + m_piston * (t31 * omega3 * t4 * Iz_flap / 8 - 0.3e1 / 0.8e1 * omega3 * t5 * TorqueWing - 0.3e1 / 0.8e1 * vp * TorqueWing) + t54 * t25) * L4 + 12 * t28 * L4 * (t2 * (m_piston * t31 * (t6 + 3 * vp) + 8 * t64) * m_flap / 12 + m_piston * (t31 * t5 * Iz_flap / 3 + vp * omega3 * Iz_flap + t4 * TorqueWing) * omega3 + 0.8e1 / 0.3e1 * Iz_flap * t64) + t2 * (32 * m_piston * t86 * omega3 * lambda1 - 8 * t54 * vp * m_flap) - 32 * t54 * vp * Iz_flap);
      t154 = L4 * lambda1;
      res__4 = 0.1e1 / t112 * (8 * t10 * t4 * t154 + 8 * t28 * t5 * t154 + 4 * TorqueWing);
      res__5 = 0.1e1 / m_piston * (-2 * lambda1 * t4 + 2 * t28 * t154 + ForcePiston);
      

      % store on output
      res__f = zeros(5,1);
      res__f(1) = res__1;
      res__f(2) = res__2;
      res__f(3) = res__3;
      res__f(4) = res__4;
      res__f(5) = res__5;

    end

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res__DfDx = DfDx( self, t, vars__ )

      Iz_flap = self.Iz_flap;
      L0 = self.L0;
      L2 = self.L2;
      L3 = self.L3;
      L4 = self.L4;
      LMP = self.LMP;
      Lbase = self.Lbase;
      g = self.g;
      m_flap = self.m_flap;
      xE = self.xE;
      yE = self.yE;
      m_piston = self.m_piston;
      ForcePiston = self.ForcePiston;
      TorqueWing = self.TorqueWing;
      

      % extract states
      theta3 = vars__(1);
      s = vars__(2);
      lambda1 = vars__(3);
      omega3 = vars__(4);
      vp = vars__(5);

      % evaluate function
      res__1_1 = omega3;
      res__2_1 = vp;
      t2 = L4 ^ 2;
      t4 = L0 + L2 + Lbase - yE + s;
      t5 = xE - LMP;
      t6 = omega3 * t5;
      t10 = cos(theta3);
      t11 = t10 ^ 2;
      t15 = t2 * omega3;
      t20 = (s + L0 + L2 + xE - yE - LMP + Lbase) * (s + L0 + L2 - xE - yE + LMP + Lbase);
      t25 = omega3 * Iz_flap;
      t28 = sin(theta3);
      t31 = omega3 ^ 2;
      t54 = lambda1 * t4 - 0.3e1 / 0.8e1 * ForcePiston;
      t64 = vp * lambda1;
      t86 = t4 * t5;
      t99 = m_flap * t2;
      t112 = t99 + 4 * Iz_flap;
      t117 = t2 ^ 2;
      t120 = t5 ^ 2;
      t124 = Lbase ^ 2;
      t129 = L0 ^ 2;
      t134 = L2 ^ 2;
      t139 = s ^ 2;
      t143 = yE ^ 2;
      t149 = t4 ^ 2;
      res__3_1 = 0.1e1 / (8 * t11 * (-t99 / 4 + m_piston * t20 - Iz_flap) * t2 + 16 * t10 * t86 * t2 * t28 * m_piston - 4 * t28 * t4 * t112 * L4 + 2 * m_flap * t117 + t2 * (8 * m_piston * t120 + 8 * Iz_flap + m_flap * (2 * t124 + (4 * s + 4 * L0 + 4 * L2 - 4 * yE) * Lbase + 2 * t129 + (4 * s + 4 * L2 - 4 * yE) * L0 + 2 * t134 + (4 * s - 4 * yE) * L2 + 2 * t139 - 4 * s * yE + 2 * t143)) + 8 * t149 * Iz_flap) * (-64 * t11 * (t6 + vp / 2) * t4 * t2 * lambda1 * m_piston + 32 * t10 * (t28 * L4 * lambda1 * (-m_flap * t15 / 4 + m_piston * (omega3 * t20 - t5 * vp) - t25) + t15 * m_flap * (m_piston * t4 * t31 + 8 * lambda1 * t4 - 3 * ForcePiston) / 32 + m_piston * (t31 * omega3 * t4 * Iz_flap / 8 - 0.3e1 / 0.8e1 * omega3 * t5 * TorqueWing - 0.3e1 / 0.8e1 * vp * TorqueWing) + t54 * t25) * L4 + 12 * t28 * L4 * (t2 * (m_piston * t31 * (t6 + 3 * vp) + 8 * t64) * m_flap / 12 + m_piston * (t31 * t5 * Iz_flap / 3 + vp * omega3 * Iz_flap + t4 * TorqueWing) * omega3 + 0.8e1 / 0.3e1 * Iz_flap * t64) + t2 * (32 * m_piston * t86 * omega3 * lambda1 - 8 * t54 * vp * m_flap) - 32 * t54 * vp * Iz_flap);
      t154 = L4 * lambda1;
      res__4_1 = 0.1e1 / t112 * (8 * t10 * t4 * t154 + 8 * t28 * t5 * t154 + 4 * TorqueWing);
      res__5_1 = 0.1e1 / m_piston * (-2 * lambda1 * t4 + 2 * t28 * t154 + ForcePiston);
      
      % store on output
      res__DfDx = zeros(5,1);
      res__DfDx(1,1) = res__1_1;
      res__DfDx(2,1) = res__2_1;
      res__DfDx(3,1) = res__3_1;
      res__DfDx(4,1) = res__4_1;
      res__DfDx(5,1) = res__5_1;
    end


    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res__DfDt = DfDt( self, t, vars__ )

      % extract states
      t = vars__(1);

      % evaluate function
      
      % store on output
      res__DfDt = zeros(5,1);
    end

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res__h = h( self, t, vars__ )

      Iz_flap = self.Iz_flap;
      L0 = self.L0;
      L2 = self.L2;
      L3 = self.L3;
      L4 = self.L4;
      LMP = self.LMP;
      Lbase = self.Lbase;
      g = self.g;
      m_flap = self.m_flap;
      xE = self.xE;
      yE = self.yE;
      m_piston = self.m_piston;
      ForcePiston = self.ForcePiston;
      TorqueWing = self.TorqueWing;

      % extract states
      theta3 = vars__(1);
      s = vars__(2);
      lambda1 = vars__(3);
      omega3 = vars__(4);
      vp = vars__(5);

      % evaluate function
      t1 = L0 + L2 + Lbase - yE + s;
      t3 = sin(theta3);
      t6 = xE - LMP;
      t8 = cos(theta3);
      t11 = L4 ^ 2;
      t12 = Lbase ^ 2;
      t13 = -s - L0 - L2 + yE;
      t16 = L0 ^ 2;
      t17 = -s - L2 + yE;
      t20 = L2 ^ 2;
      t21 = -s + yE;
      t24 = yE ^ 2;
      t25 = s * yE;
      t27 = s ^ 2;
      res__1 = 2 * t3 * t1 * L4 - 2 * t8 * t6 * L4 - t11 - t12 + 2 * Lbase * t13 - t16 + 2 * L0 * t17 - t20 + 2 * L2 * t21 - t24 + 2 * t25 - t27 + (L3 - LMP + xE) * (L3 + LMP - xE);
      t34 = omega3 * t6;
      res__2 = -2 * t8 * t1 * omega3 * L4 - 2 * t3 * L4 * (t34 + vp) + 2 * t1 * vp;
      t41 = m_flap * t11;
      t48 = t8 ^ 2;
      t59 = t34 + 2 * vp;
      t74 = omega3 ^ 2;
      t75 = t1 * t74;
      t94 = t11 ^ 2;
      t98 = t6 ^ 2;
      t121 = vp ^ 2;
      t122 = t121 * m_piston;
      t123 = t1 * ForcePiston;
      t129 = t1 ^ 2;
      res__3 = 0.1e1 / m_piston / (t41 + 4 * Iz_flap) * (16 * t48 * (-t41 / 4 + (s + L0 + L2 - xE - yE + LMP + Lbase) * (s + L0 + L2 + xE - yE - LMP + Lbase) * m_piston - Iz_flap) * t11 * lambda1 + 32 * t8 * (t3 * t1 * t6 * lambda1 * L4 + t11 * t59 * m_flap * omega3 / 16 + Iz_flap * t59 * omega3 / 4 + t1 * TorqueWing / 4) * m_piston * L4 - 2 * t3 * (t11 * (4 * lambda1 * t1 + m_piston * t75 - ForcePiston) * m_flap + 16 * lambda1 * t1 * Iz_flap + m_piston * (4 * Iz_flap * t75 - 4 * t6 * TorqueWing) - 4 * Iz_flap * ForcePiston) * L4 + 4 * m_flap * lambda1 * t94 + t11 * (lambda1 * (16 * m_piston * t98 + 16 * Iz_flap + m_flap * (-8 * L0 * t17 - 8 * L2 * t21 - 8 * Lbase * t13 + 4 * t12 + 4 * t16 + 4 * t20 + 4 * t24 - 8 * t25 + 4 * t27)) - 2 * m_flap * (t122 + t123)) + 16 * (lambda1 * t129 - t122 / 2 - t123 / 2) * Iz_flap);
      

      % store on output
      res__h = zeros(3,1);
      res__h(1) = res__1;
      res__h(2) = res__2;
      res__h(3) = res__3;

    end

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res__DhDx = DhDx( self, t, vars__ )

      Iz_flap = self.Iz_flap;
      L0 = self.L0;
      L2 = self.L2;
      L3 = self.L3;
      L4 = self.L4;
      LMP = self.LMP;
      Lbase = self.Lbase;
      g = self.g;
      m_flap = self.m_flap;
      xE = self.xE;
      yE = self.yE;
      m_piston = self.m_piston;
      ForcePiston = self.ForcePiston;
      TorqueWing = self.TorqueWing;

      % extract states
      theta3 = vars__(1);
      s = vars__(2);
      lambda1 = vars__(3);
      omega3 = vars__(4);
      vp = vars__(5);

      % evaluate function
      t1 = L0 + L2 + Lbase - yE + s;
      t2 = cos(theta3);
      t4 = xE - LMP;
      t5 = sin(theta3);
      t6 = t4 * t5;
      res__1_1 = 2 * L4 * (t2 * t1 + t6);
      t9 = L4 * t5;
      res__1_2 = 2 * t9 - 2 * L0 - 2 * L2 - 2 * Lbase - 2 * s + 2 * yE;
      t13 = omega3 * t4;
      t17 = L4 * (t5 * t1 * omega3 - (t13 + vp) * t2);
      res__2_1 = 2 * t17;
      t18 = t2 * L4;
      t20 = -omega3 * t18 + vp;
      res__2_2 = 2 * t20;
      res__2_4 = -res__1_1;
      res__2_5 = -res__1_2;
      t23 = t1 * t4;
      t24 = t2 ^ 2;
      t28 = L4 * lambda1;
      t29 = L4 ^ 2;
      t30 = m_flap * t29;
      t31 = t30 / 4;
      t36 = -t31 + (s + L0 + L2 - xE - yE + LMP + Lbase) * (s + L0 + L2 + xE - yE - LMP + Lbase) * m_piston - Iz_flap;
      t39 = omega3 ^ 2;
      t52 = t30 + 4 * Iz_flap;
      t53 = lambda1 * t1;
      t54 = ForcePiston / 4;
      t62 = t13 + 2 * vp;
      t78 = 0.1e1 / t52;
      t79 = 0.1e1 / m_piston;
      res__3_1 = -32 * t79 * t78 * L4 * (-2 * t24 * t23 * m_piston * L4 * lambda1 + t2 * (t5 * t36 * t28 + m_piston * (t29 * t1 * t39 * m_flap / 16 + Iz_flap * t1 * t39 / 4 - t4 * TorqueWing / 4) + (t53 - t54) * t52 / 4) + (t5 * (t29 * t62 * m_flap * omega3 / 16 + Iz_flap * t62 * omega3 / 4 + t1 * TorqueWing / 4) + t23 * t28) * m_piston);
      t98 = t31 + Iz_flap;
      res__3_2 = t79 * t78 * (32 * t24 * t29 * m_piston * t53 + 32 * t18 * m_piston * (t6 * t28 + TorqueWing / 4) + 32 * t98 * (-t5 * (m_piston * t39 + 4 * lambda1) * L4 / 4 + t53 - t54));
      t114 = t29 ^ 2;
      t117 = t4 ^ 2;
      t121 = Lbase ^ 2;
      t126 = L0 ^ 2;
      t131 = L2 ^ 2;
      t136 = s ^ 2;
      t140 = yE ^ 2;
      t146 = t1 ^ 2;
      res__3_3 = t79 * t78 * (16 * t24 * t36 * t29 + 32 * t2 * t23 * t29 * t5 * m_piston - 32 * t9 * t98 * t1 + 4 * m_flap * t114 + t29 * (16 * m_piston * t117 + 16 * Iz_flap + m_flap * (4 * t121 + (8 * s + 8 * L0 + 8 * L2 - 8 * yE) * Lbase + 4 * t126 + (8 * s + 8 * L2 - 8 * yE) * L0 + 4 * t131 + (8 * s - 8 * yE) * L2 + 4 * t136 - 8 * s * yE + 4 * t140)) + 16 * t146 * Iz_flap);
      res__3_4 = -4 * t17;
      res__3_5 = -4 * t20;
      
      % store on output
      res__DhDx = zeros(3,5);
      res__DhDx(1,1) = res__1_1;
      res__DhDx(1,2) = res__1_2;
      res__DhDx(2,1) = res__2_1;
      res__DhDx(2,2) = res__2_2;
      res__DhDx(2,4) = res__2_4;
      res__DhDx(2,5) = res__2_5;
      res__DhDx(3,1) = res__3_1;
      res__DhDx(3,2) = res__3_2;
      res__DhDx(3,3) = res__3_3;
      res__DhDx(3,4) = res__3_4;
      res__DhDx(3,5) = res__3_5;
    end

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res__DhDt = DhDt( self, t, vars__ )

      % extract states
      t = vars__(1);

      % evaluate function
      
      % store on output
      res__DhDt = zeros(3,1);
    end

    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function plot( self, t, vars__ )

    end
end
end