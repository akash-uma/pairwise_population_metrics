function [ espec ] = compute_shared_eigspec( fa_model )

    % espec is empty if 'L' does not exist
    if ~isfield(fa_model,'L')
        espec=[];
        return
    end
    
    L = fa_model.L;
    n_dims = size(L,2);
    
    % compute shared dimensionality
    shared_cov = L*L';
    [~,espec,~] = svd(shared_cov);
    espec = diag(espec);
    espec = espec(1:n_dims);
    
end

