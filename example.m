clear; clc; close all;
addpath(genpath('helpers'))

%% load data

% the two spike count matrices (counts.attend_in, counts.attend_out) are of
% the shape n_neurons, n_trials
load('example.mat');

% because pairwise and population metrics can depend on n_neurons and n_trials,
% we recommend that, if possible, one use the same neurons and equalize the 
% number of trials between conditions one is comparing
[n_neurons,n_trials] = size(counts.attend_in);
fprintf('number of neurons: %d\n',n_neurons)
fprintf('number of trials: %d\n\n',n_trials)

%% compute pairwise metrics

% compute the mean and s.d. of the rsc distribution
[rsc_mean_in,rsc_sd_in] = compute_pairwise_metrics(counts.attend_in);
[rsc_mean_out,rsc_sd_out] = compute_pairwise_metrics(counts.attend_out);

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
    compute_population_metrics(counts.attend_in,zDimList);
[ls_out,psv_out,d_out,espec_out] = ...
    compute_population_metrics(counts.attend_out,zDimList);

% compare the two conditions
fprintf('Loading similarity of the strongest dimension:\n')
fprintf('   attend-out: %.3f, attend-in: %.3f\n\n',ls_out(1),ls_in(1))

fprintf('%% shared variance:\n')
fprintf('   attend-out: %.3f, attend-in: %.3f\n\n',psv_out,psv_in)

fprintf('Dimensionality (d_shared):\n')
fprintf('   attend-out: %d, attend-in: %d\n\n',d_out,d_in)
