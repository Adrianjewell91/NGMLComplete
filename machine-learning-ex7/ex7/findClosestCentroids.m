function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% For each training example, get the distance to each centroid and 
% assign idx to centroid with the minimum number. 

% Is there any way to vectorize this? 
% I will ask this on stack overflow

map = repmat(1:size(X, 1), size(centroids, 1), 1)(:);
centroids_map = repmat(centroids, size(X,1), 1);

X_map = X(map, :);

d = X_map .- centroids_map;
d2 = sum(d .* d, 2);
d3 = reshape(d2, size(centroids, 1), size(X, 1))'; %'
[_, idx] = min(d3, [], 2);

%for i = 1:length(idx)
%    d = X(i, :) - centroids;
%    d2 = sum(d .* d, 2);
%
%    [_, idx(i)] = min(d2);
%end

% =============================================================

end

