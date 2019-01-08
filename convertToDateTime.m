function dt_out = convertToDateTime(dateString,dateFormat)

if isdatetime(dateString)
    dt_out = dateString;
    return
end

if isnan(dateString)
    dt_out = NaT(size(dateString,1),1);
    return;
end

if isempty(dateFormat)
    dt_out = datetime(dateString);
else
    dt_out = datetime(dateString,'inputformat',dateFormat);
end

dt_out.Year(dt_out.Year < 100) = dt_out.Year(dt_out.Year < 100) + 2000;

end