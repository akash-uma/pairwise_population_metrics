function [ avg_perc_shared, avg_shared_var, avg_ind_var ] = compute_perc_shared( fa_model )

    Ph = fa_model.Ph;

    if ~isfield(fa_model,'L')
        shared_var = zeros(size(Ph));
    else
        L = fa_model.L;
        shared_var = diag(L*L');
    end

    perc_shared = shared_var./(shared_var + Ph).*100;
    
    avg_perc_shared = mean(perc_shared);
%     avg_perc_shared = sum(shared_var)/sum(shared_var+Ph);
    min_perc_shared = min(perc_shared);
    max_perc_shared = max(perc_shared);
    
    avg_shared_var = mean(shared_var);
    avg_ind_var = mean(Ph);
    
end
