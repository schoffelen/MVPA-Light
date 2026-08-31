function data = mv_select_samples(data, sample_dimension, idx)
% Index DATA along SAMPLE_DIMENSION(S), keeping only IDX. Generalizes
% X(idx,:,:,:) style indexing to an arbitrary sample dimension.
s = repmat({':'}, 1, ndims(data));
for dim = sort(sample_dimension(:))'
    s{dim} = idx;
end
data = data(s{:});
end