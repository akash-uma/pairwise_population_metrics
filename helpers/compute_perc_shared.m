function [ avg_psv ] = compute_perc_shared( fa_model )
%
% computes the percent shared variance
%
% Input:
%   fa_model - (struct), factor analysis model parameters
%
% Output:
%   avg_psv - (scalar), percent shared variance
%
% @ Akash Umakantha, 2021. See https://www.biorxiv.org/content/10.1101/2020.12.04.383604v1
% 

    Ph = fa_model.Ph;

    % shared var is 0 if 'L' does not exist
    if ~isfield(fa_model,'L')
        shared_var = zeros(size(Ph));
    else
        L = fa_model.L;
        shared_var = diag(L*L');
    end

    % compute psv for each neuron
    perc_shared = shared_var./(shared_var + Ph).*100;
    
    % compute the average psv
    avg_psv = mean(perc_shared);
    
end
