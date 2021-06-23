function [rsc_mean, rsc_std] = compute_pairwise_metrics(X)
%
% computes pairwise metrics (rsc mean and rsc standard deviation)
%
% Input:
%   X     - (matrix of size n_neurons x n_trials), spike count matrix 
%   zDims - (list of integers), dimensionalities to try for FA crossvalidation
%
% Output:
%   rsc_mean - (scalar), mean of spike count correlation (rsc) distribution
%   rsc_std  - (scalar), standard deviation of rsc distribution
%
% @ Akash Umakantha, 2021. See https://www.biorxiv.org/content/10.1101/2020.12.04.383604v1
% 

    corrX = corr(X');
    
    idx = triu(true(size(corrX)),1);
    corr_vals = corrX(idx);
    
    rsc_mean = mean(corr_vals);
    rsc_std = std(corr_vals);
    
end

