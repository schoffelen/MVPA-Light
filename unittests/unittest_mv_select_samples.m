tol = 10e-10;
mf = mfilename;

%% mv_select_samples: default dimension 1
X = reshape(1:24, 4, 3, 2);  % 4 samples x 3 x 2
idx = [1 3];
out = mv_select_samples(X, 1, idx);
print_unittest_result('[mv_select_samples] dim=1 selects correct rows', X(idx,:,:), out, tol);

%% mv_select_samples: non-default dimension
X2 = reshape(1:24, 3, 4, 2);  % samples along dim 2
out2 = mv_select_samples(X2, 2, idx);
print_unittest_result('[mv_select_samples] dim=2 selects correct slices', X2(:,idx,:), out2, tol);

%% mv_select_samples: other dimensions unchanged
print_unittest_result('[mv_select_samples] non-sample dimensions preserved', size(X2,1), size(out2,1), tol);
print_unittest_result('[mv_select_samples] non-sample dimensions preserved', size(X2,3), size(out2,3), tol);