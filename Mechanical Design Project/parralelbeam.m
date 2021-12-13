classdef parralelbeam
    
    properties (Constant)
        Ea = 13.4E10; %elastic modulus ceramic [GPa]
        Em = 210E9; %elastic modulus steel [GPa]
        rho_s = 8.050E3; %kg/m^3
        rho_a = 7.7E3; %kg/m^3
        S0 = 3.3; %Stroke single actuator [micrometer]
        h0 = 2E-3; %height single actuator [m]  
        

    end
    
    properties 
        t1 = 0; %thickness red beam
        t2 = 0; %thickness green beam
        b = 0; %width red beam
        h = 0; %height green beam
        h_tot = 0; %total height
        L_A = 0; %length actuator
        
        margin = 1E-3; %margin space between actuator and beam [m]
        d = 40E-3; %thickness beams part [m]
        w_a = 10E-3; %width actuator [m]
        
        
        Ig = 0;
        Ir = 0;
        
        Cg = 0;
        Cr = 0;
        Ca = 0;
        Ctot = 0;
        
        i = 0; %transmission ratio
        m = 0; %mass
        S_out = 0;
        
        isvalid = false;
        isGood = false; 
    end
    
    methods
        function obj = parralelbeam(t1,t2,b,L_A,h_tot,margin,d,w_a)
            obj.t1 = t1;
            obj.t2 = t2;
            obj.b = b;
            obj.h_tot = h_tot; 
            obj.margin = margin;
            obj.d = d;
            obj.w_a = w_a;
            obj.L_A = L_A;
        end
        
        function obj = compdimension1(obj)
            %variable b, h_tot, t1, t2
            obj.h = obj.h_tot - 2*obj.t1 - 2*obj.margin;
            obj.b = obj.L_A + 2*obj.t2;
            obj.i = (1/12) * (obj.h/obj.b)^2 * (obj.t1 / obj.t2)^3;
            obj.S_out = (((obj.L_A*obj.i)/obj.h0) - 1) *obj.S0;
            if obj.S_out > 10
                obj.isGood = true;
            end
        end
        
        function obj = compdimension2(obj)
            %variable L_a, h_tot, t1,t2
                        obj.h = obj.h_tot - 2*obj.t1 - 2*obj.margin;
            obj.L_A = obj.b - 2*obj.t2;
            obj.i = (1/12) * (obj.h/obj.b)^2 * (obj.t1 / obj.t2)^3;
            obj.S_out = (((obj.L_A*obj.i)/obj.h0) - 1) *obj.S0;
            if obj.S_out > 5
                obj.isGood = true;
            end
        end
        
        function obj = calc(obj)
            obj.m = 2 * obj.d *(obj.t2 * obj.h + obj.t1* obj.b) *obj.rho_s + obj.rho_a * obj.L_A * obj.w_a^2;
            obj.Ig = obj.t1^3*obj.d;
            obj.Ir = obj.t2^3*obj.d;
            obj.Cg = 192 * obj.Em * obj.Ig / (obj.b^3);
            obj.Cr = 16 * obj.Em * obj.Ir / (obj.b * obj.h^2);
            obj.Ca = obj.Ea*obj.w_a^2/obj.L_A;
            obj.Ctot = 2 * (1/obj.Cg + 1/obj.Cr)^-1 + obj.Ca;

        end
        
        function obj = testvalid(obj)
            if obj.h <= 0
                return
            elseif obj.L_A <= 0
                return
            elseif obj.t1*2 + obj.w_a + obj.margin > obj.h_tot
                return
            end
            obj.isvalid = true;
                
        end
        
    end
end