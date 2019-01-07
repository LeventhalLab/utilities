function streakBorders = findConsecutiveEntries(x)
%
% find the borders of consecutive true values in a boolean vector x
%
% INPUTS
%	x - vector of booleans
%
% OUTPUTS
%

% make sure x is a column vector
if isrow(x)
    x = x';
end

x_diff = diff(x);

start_indices = find(x_diff == 1) + 1;
end_indices  = find(x_diff == -1);

if x(1)
    start_indices = [1;start_indices];
end

if x(end)
    end_indices = [end_indices;length(x)];
end

streakBorders = [start_indices,end_indices];