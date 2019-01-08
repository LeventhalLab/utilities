function [row, pageNum] = getRow(idx, rowsPerPage)
% get the row and page number to use in a set of figure axes for a given
% index (idx) given that there are rowsPerPage rows per page. For example, 
% if idx = 6 and there are 5 rows per page, then plots should be made in
% the 1st row of the 2nd page

row = mod(idx, rowsPerPage);

pageNum = floor(idx/rowsPerPage) + 1;

if row == 0
    row = rowsPerPage;
    pageNum = pageNum - 1;
end