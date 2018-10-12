function [N,h_axes] = histogramHeatMap(X, varargin)
%
% INPUTS
%   X - m x n matrix where m is the number of different trials and n is
%       time
%
% OUTPUTS
%   
numBins = 10;
binLimits = [min(X(:)),max(X(:))];
binEdges = [];
h_axes = [];
xvalues = 1 : size(X,2);

for iarg = 1 : 2 : nargin - 1
    switch lower(varargin{iarg})
        case 'axes'
            h_axes = varargin{iarg + 1};
        case 'numbins'
            numBins = varargin{iarg + 1};
        case 'binedges'
            binEdges = varargin{iarg + 1};
        case 'binlimits'
            binLimits = varargin{iarg + 1};
        case 'xvalues'
            xvalues = varargin{iarg + 1};
    end
end

if isempty(binEdges)
    binEdges = linspace(binLimits(1),binLimits(2),numBins+1);
end
numBins = length(binEdges) - 1;   % in case binEdges was specified in the inputs

num_t = size(X,2);
N = zeros(numBins, num_t);
for i_t = 1 : num_t
    
    [N(:,i_t),edges] = histcounts(X(:,i_t),binEdges);
    
end

if isempty(h_axes)
    figure
    h_axes = gca;
end

imagesc(xvalues,binEdges,N)
set(gca,'clim',[binEdges(1),binEdges(end)]);
colorbar


end