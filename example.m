clear; clc; close all;
addpath(genpath('helpers'))

%% load data

% the two spike count matrices (counts.attend_in, counts.attend_out) are of
% the shape n_neurons, n_trials

load('example.mat');

%% compute pairwise metrics

% compute the mean and s.d. of the rsc distribution
[rsc_mean_in,rsc_sd_in] = compute_pair_metrics(counts.attend_in);
[rsc_mean_out,rsc_sd_out] = compute_pair_metrics(counts.attend_out);

% compare the two conditions
fprintf('Rsc mean:\n')
fprintf('   attend-out: %.3f, attend-in: %.3f\n\n',rsc_mean_out,rsc_mean_in)

fprintf('Rsc standard deviation:\n')
fprintf('   attend-out: %.3f, attend-in: %.3f\n\n',rsc_sd_out,rsc_sd_in)

%% compute population metrics

% fit factor analysis & compute population metrics:
%   1) perform cross-validation to choose dimensionalities among those 
%      specified by 'zDimList'
%   2) compute population metrics & shared eigenspectrum
% the function 'compute_pop_metrics' performs both of these steps

zDimList = 0:15;

[ls_in,psv_in,d_in,espec_in] = ...
    compute_pop_metrics(counts.attend_in,zDimList);
[ls_out,psv_out,d_out,espec_out] = ...
    compute_pop_metrics(counts.attend_out,zDimList);

% compare the two conditions
fprintf('Loading similarity of the strongest dimension:\n')
fprintf('   attend-out: %.3f, attend-in: %.3f\n\n',ls_out(1),ls_in(1))

fprintf('%% shared variance:\n')
fprintf('   attend-out: %.3f, attend-in: %.3f\n\n',psv_out,psv_in)

fprintf('Dimensionality (d_shared):\n')
fprintf('   attend-out: %d, attend-in: %d\n',d_out,d_in)
