function ops = ops4Lon(model,max_aoa, max_de, min_de, max_thr, min_thr)
%ops4Lon 设置纵向定直平飞条件的OperatingSpec
%   Detailed explanation goes here

if nargin < 6
    min_thr = 0;
    if nargin < 5
        max_thr = 1;
        if nargin < 4
            if nargin < 3
                max_de = 30/57.3;
                if nargin < 2
                    max_aoa = 20/57.3;
                end
            end
            min_de = -max_de;
        end
    end
end

ops = operspec(model);
ops.States(1).Known = true;
ops.States(2).Max = max_aoa;
ops.States(3).Known = true;
ops.States(3).x = 0;
ops.States(3).SteadyState = false;
ops.States(4).Known = true;
ops.States(4).x = 0;
ops.States(4).SteadyState = false;
ops.States(5).Known = true;
ops.States(5).x = 0;
ops.States(6).Known = true;
ops.States(6).x = 0;
ops.States(6).SteadyState = false;
ops.States(7).Known = true;
ops.States(7).x = 0;
ops.States(7).SteadyState = false;
ops.States(8).SteadyState = false;
        
ops.Inputs(1).Known = true;
ops.Inputs(1).u = 0;
ops.Inputs(2).Min = min_de;
ops.Inputs(2).Max = max_de;
ops.Inputs(3).Known = true;
ops.Inputs(3).u = 0;
ops.Inputs(4).Min = min_thr;
ops.Inputs(4).Max = max_thr;
        
ops.Outputs(10).Known = true;
ops.Outputs(10).y = 0;

end