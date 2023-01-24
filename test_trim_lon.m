function [op,opreport] = test_trim_lon(model, V0, h0)

max_aoa = 8/57.3;
min_de = -30/57.3;
max_de = 30/57.3;
ops = ops4Lon(model,max_aoa, max_de, min_de);

ops.States(1).x = V0;

assignin('base', 'h0', h0);

%% Create the options
opt = findopOptions('DisplayReport','iter');

%% Perform the operating point search.
[op,opreport] = findop(model,ops, opt);
end