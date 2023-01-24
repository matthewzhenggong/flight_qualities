function [op,opreport,params] = trim_lon_HV(model, vRange, hRange)

nV = length(vRange);
nH = length(hRange);

[vGrid,hGrid] = ndgrid(vRange,hRange);
max_aoa = 8/57.3;
min_de = -30/57.3;
max_de = 30/57.3;
ops = ops4Lon(model,max_aoa, max_de, min_de);

opspec = opcond.OperatingSpec.empty(nV,0);
for j = 1:nH
    for i = 1:nV
        % Set parameter values in model.
        V0 = vGrid(i,j);

        % Create the operating point specification object.
        opspec(i,j) = copy(ops);
        opspec(i,j).States(1).x = V0;
    end
end

params(1).Name = 'V0';
params(1).Value = vGrid;
params(2).Name = 'h0';
params(2).Value = hGrid;

%% Create the options
opt = findopOptions('DisplayReport','off');

%% Perform the operating point search.
[op,opreport] = findop(model,opspec,params, opt);
end