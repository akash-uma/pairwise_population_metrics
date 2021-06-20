function [ dshared ] = compute_dshared( fa_model, var_exp_thresh )

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

