function [rsc_mean, rsc_std] = compute_pair_metrics(X)
    % X - spike count matrix (n_neurons x n_trials)

    corrX = corr(X');
    
    idx = triu(true(size(corrX)),1);
    corr_vals = corrX(idx);
    
    rsc_mean = mean(corr_vals);
    rsc_std = std(corr_vals);
    
end

