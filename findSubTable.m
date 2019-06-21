function subTable = findSubTable(tableIn,varargin)

% ignore case
ignoreCase = false;

numCategories = (nargin - 1) / 2;

if ignoreCase
    for iVar = 1 : size(tableIn, 2)
        tableIn.Properties.VariableNames{iVar} = lower(tableIn.Properties.VariableNames{iVar});
    end
end
validRows = true(size(tableIn,1),1);
for i_cat = 1 : numCategories
    
    catName_idx = (i_cat * 2) - 1;
    catValue_idx = i_cat * 2;
    
    currentCat = varargin{catName_idx};
    currentVal = varargin{catValue_idx};
    
    currentValList = tableIn.(currentCat);
    if ignoreCase
        currentCat = lower(currentCat);
        currentVal = lower(currentVal);
        currentValList = lower(currentValList);
    end
    
    currentValList = tableIn.(currentCat);
    
    validRows = validRows & (currentVal == currentValList);
    
end

subTable = tableIn(validRows,:);