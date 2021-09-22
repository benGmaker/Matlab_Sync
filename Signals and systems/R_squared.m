function [result , SS_res] = R_squared(data, fit)
    mean_data = mean(data);
    sqr_res = [data - fit].^2;
    sqr_tot = [data - mean_data].^2;
    SS_res = sum (sqr_res);
    SS_tot = sum (sqr_tot);
    result = 1 - SS_res/SS_tot;
end 

