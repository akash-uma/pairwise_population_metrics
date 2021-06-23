function [ dshared ] = compute_dshared( fa_model, var_exp_thresh )
%
% computes the shared dimensionality
%
% Input:
%   fa_model       - (struct), factor analysis model parameters
%   var_exp_thresh - (scalar, [0,1]), variance explained threshold for
%                    determining dimensionality
%
% Output:
%   dshared - (scalar), shared dimensionality
%
% @ Akash Umakantha, 2021. See https://www.biorxiv.org/content/10.1101/2020.12.04.383604v1
% 

    % deal with optional arguments
    if nargin<2
        var_exp_thresh = .95;
    end

    % dimensionality is 0 if 'L' does not exist
    if ~isfield(fa_model,'L')
        dshared=0;
        return
    end
    
    L = fa_model.L;
    n_dims = size(L,2);
    
    % compute shared dimensionality
    shared_cov = L*L';
    [~,d,~] = svd(shared_cov);
    d = diag(d);
    d = d(1:n_dims);
    var_exp = cumsum(d)./sum(d);
    dshared = find(var_exp>var_exp_thresh,1,'first');
    
end

