function [ espec ] = compute_shared_eigspec( fa_model )
%
% computes the shared eigenspectrum
%
% Input:
%   fa_model - (struct), factor analysis model parameters
%
% Output:
%   espec - (list), eigenspectrum of the shared covariance matrix
%
% @ Akash Umakantha, 2021. See https://www.biorxiv.org/content/10.1101/2020.12.04.383604v1
% 


    % espec is empty if 'L' does not exist
    if ~isfield(fa_model,'L')
        espec=[];
        return
    end
    
    L = fa_model.L;
    n_dims = size(L,2);
    
    % compute shared eigenspectrum
    shared_cov = L*L';
    [~,espec,~] = svd(shared_cov);
    espec = diag(espec);
    espec = espec(1:n_dims);
    
end

