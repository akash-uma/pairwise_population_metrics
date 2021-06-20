function [ls, psv, d, eigspec] = compute_pop_metrics(X, zDims)
    % X - spike count matrix (n_neurons x n_trials)

    if nargin<2
        zDims = 0:10;
    end

    % compute cross-validated LL for each dimensionality
    dims = crossvalidate_fa(X,'zDimList',zDims);
    
    % find the model that gives highest cross-validated LL
    [~,max_idx] = max([dims.sumLL]);
    params = dims(max_idx).estParams;
    
    % compute loading similarity, %sv, dshared, and shared eigenspectrum
    ls = compute_load_sim(params);
    psv = compute_perc_shared(params);
    d = compute_dshared(params);
    eigspec = compute_shared_eigspec(params);

end

