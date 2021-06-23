function [ loading_similarity ] = compute_load_sim( fa_model )
%
% computes the loading similarity of each dimension
%
% Input:
%   fa_model - (struct), factor analysis model parameters
%
% Output:
%   loading_similarity - (list), loading similarities of each dimension's
%                        loading vector
%
% @ Akash Umakantha, 2021. See https://www.biorxiv.org/content/10.1101/2020.12.04.383604v1
% 

    % return empty if 'L' does not exist
    if ~isfield(fa_model,'L')
        loading_similarity=[];
        return
    end

    % extract some basic info/params
    L = fa_model.L;
    [n_neurons,z_dim] = size(L);
    
    % orthonormalize L
    shared_cov = L*L';
    [L_orth,~,~] = svd(shared_cov);
    L_orth = L_orth(:,1:z_dim);
    
    % compute loading similarity of each dimension
    loading_similarity = (1/n_neurons - var(L_orth,1,1)).*n_neurons;
    
end
