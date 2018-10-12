function dbStruct = readExcelDB(xlfname, varargin)
%
% INPUTS
%
% VARARGS
%   1st vararg: sheetName - name of the sheet in the excel file from which
%       to read. If not specified, reads from the first sheet
%
% OUTPUTS

[~,sheets] = xlsfinfo(xlfname);

numFixedArgs = 1;
if nargin > numFixedArgs
    sheetName = varargin{1};
else
    sheetName = sheets{1};
end

dbStructFieldNames = getColumnHeaders(xlfname, sheetName);
numCols = length(dbStructFieldNames);

dbIdx = 0;
exitFlag = false;
cellNum = 0;
cellString = 'testing';
while ~exitFlag
    
    exitFlag = true;
    
    dbIdx = dbIdx + 1;
    rowNum = dbIdx + 1;
    for iField = 1 : numCols
    
        xlColLetter = excel_column(iField);
        cell2read = sprintf('%s%d',xlColLetter,rowNum);
        [~,~,cellData] = xlsread(xlfname, sheetName, cell2read);
        
        if ~isnan(cellData{1})
            if contains(lower(dbStructFieldNames{iField}),'date')
                % this field contains a date. Add 693960 to the date read
                % from excel to convert between excel and matlab date
                % conventions (see matlab help)
                dbStruct(dbIdx).(dbStructFieldNames{iField}) = datestr(cellData{1} + 693960,'yyyymmdd');
            else
                dbStruct(dbIdx).(dbStructFieldNames{iField}) = cellData{1};
            end
            exitFlag = false;
        end
        
    end

end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function headers = getColumnHeaders(xlfname, sheetName, varargin)

headerRow = 1;
for iarg = 1 : 2 : nargin - 2
    switch lower(varargin{iarg})
        case 'headerrow'
            headerRow = varargin{iarg + 1};
    end
end

xlCol = 0;
headers = {};
currentField = 'testing';
while ~isempty(currentField)
    
    xlCol = xlCol + 1;
    
    xlColLetter = excel_column(xlCol);
    cell2read = sprintf('%s%d',xlColLetter,headerRow);
    
    [~,currentField] = xlsread(xlfname,sheetName,cell2read);
    
    if ~isempty(currentField)
        headers{xlCol} = currentField{1};
    end
end

end