function col = excel_column(n)

    %// find LSB
    xlsb = mod(n-1,26)+1 ;
    xmsb = fix((n-1)/26) ;

    %// find MSB (recursively if necessary)
    if xmsb >= 1
        col = [excel_column(xmsb) char(xlsb+64)] ;
    else
        col = char(xlsb+64) ;
    end