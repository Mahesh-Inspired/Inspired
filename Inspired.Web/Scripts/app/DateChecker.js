function CheckDate(dateVal)
{
    if (dateVal == '')
        return false;
    alert(Date.parse(dateVal));
    var comp = dateVal.split('/');    
    var dtDay = parseInt(comp[0], 10);
    var dtMonth = parseInt(comp[1], 10);
    var dtYear = parseInt(comp[2], 10);
    if (dtDay == "NaN" || dtMonth == "NaN" || dtYear == "NaN")
        return false;
    if (dtMonth < 1 || dtMonth > 12) 
        return false;
    else if (dtDay < 1 || dtDay > 31) 
        return false;
    else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31) 
        return false;
    else if (dtMonth == 2) {        
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay > 29 || (dtDay == 29 && !isleap)) 
            return false;
    }
    return true;
}