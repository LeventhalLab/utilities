function outputArray = removeNearbyElementsFromArray(X, minSep)

% 
Xsort = sort(X);
Xdiff = diff(Xsort);

outputArray = Xsort(Xdiff > minSep);