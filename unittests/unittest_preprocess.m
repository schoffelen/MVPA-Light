% Preprocessing unit test
%
rng(42)
tol = 10e-10;

% Random data
N = 100;
X = randn(N,40);
clabel = randi(2, N, 1);

cfg = [];
cfg.preprocess_fun = {};
cfg.preprocess_param = {};

oversample_param = mv_get_preprocess_param('oversample');
undersample_param = mv_get_preprocess_param('undersample');
zscore_param = mv_get_preprocess_param('zscore');
demean_param = mv_get_preprocess_param('demean');
average_param = mv_get_preprocess_param('average_samples');

%% try all preprocessing routeins + .is_train_set should be 1 after calling mv_preprocess once
cfg.preprocess_fun = {@mv_preprocess_oversample @mv_preprocess_undersample @mv_preprocess_zscore @mv_preprocess_demean @mv_preprocess_average_samples};
cfg.preprocess_param = {oversample_param, undersample_param, zscore_param, demean_param, average_param};

[cfg, X2, clabel2] = mv_preprocess(cfg, X, clabel);

print_unittest_result('[param.is_train_set] should be all 0 after calling mv_preprocess', 0, unique(cellfun(@(p) p.is_train_set==1 , cfg.preprocess_param)), tol);

%% undersample followed by ssd: select_data fields (signal_train/noise_train) must be
% resliced to match the undersampled number of samples (regression test)
nfeat = 5; ntime = 20;
clabel3 = [ones(40,1); 2*ones(20,1)];  % unbalanced classes: 40 vs 20
n_expect = 2 * min(sum(clabel3==1), sum(clabel3==2)); % after undersampling: 20+20
Xtr = randn(numel(clabel3), nfeat, ntime);

undersample_param2 = mv_get_preprocess_param('undersample');
ssd_param = mv_get_preprocess_param('ssd');

cfg3 = [];
cfg3.preprocess_fun = {@mv_preprocess_undersample @mv_preprocess_ssd};
cfg3.preprocess_param = {undersample_param2, ssd_param};

% ssd is used directly (not via mv_select_train_and_test_data), so
% signal_train/noise_train need to be set by hand, matching the
% *original* (pre-undersampling) number of samples
cfg3.preprocess_param{2}.signal_train = Xtr;
cfg3.preprocess_param{2}.noise_train = Xtr + 0.1*randn(size(Xtr));

[cfg3, Xtr_out] = mv_preprocess(cfg3, Xtr, clabel3);

print_unittest_result('[undersample+ssd] X should have undersampled number of samples', n_expect, size(Xtr_out,1), tol);
print_unittest_result('[undersample+ssd] signal_train should be resliced to undersampled number of samples', n_expect, size(cfg3.preprocess_param{2}.signal_train,1), tol);
print_unittest_result('[undersample+ssd] noise_train should be resliced to undersampled number of samples', n_expect, size(cfg3.preprocess_param{2}.noise_train,1), tol);


