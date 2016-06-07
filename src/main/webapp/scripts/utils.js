/**
 * 
 */

var UTIL = function()
{
};

/**
 * Redirect to another page
 * @param url
 */
UTIL.redirectTo	= function(url,newTab)
{
	if (newTab == true){
		var win = window.open(url, '_blank');
        win.focus();
	}
	else{
		window.location = url;
	}
	
};

/**
 * Get parameter from current url
 * */
UTIL.getUrlParameter = function(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
};

UTIL.showLoadingMask = function(){
    $.blockUI({ 
        message: "<div><img src=\""+contextPath+"/images/spin.gif\" alt=\"Loading...\"/><br/><h1>"+showMessage("ajax.loading")+"</h1></div>",
        css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' ,
            width: '40%'
        } 
    });
};

UTIL.hideLoadingMask= function(){
	$.unblockUI();
};

UTIL.showMessage = function(message,type)
{
	new PNotify({
	    title: false,
	    text: message,
	    type: type,
	    delay:2000
	});
};

//money formatting
UTIL.MONEY_STYLE = {
		symbol : "",
		decimal : ".",
		thousand: ",",
		precision : 0,
		format: "%s%v"
};

UTIL.MONEY_STYLE_2_DIGIT = {
		symbol : "",
		decimal : ".",
		thousand: ",",
		precision : 2,
		format: "%s%v"
};

UTIL.MONEY_STYLE_3_GIGIT = {
		symbol : "",
		decimal : ".",
		thousand: ",",
		precision : 3,
		format: "%s%v"
};

UTIL.NUMBER_STYLE={
		symbol : "",
		decimal : ".",
		thousand: ",",
		precision : 0,
		format: "%s%v"
};

UTIL.cloneObject = function(obj) {
    if (obj === null || typeof obj !== 'object') {
        return obj;
    }
 
    var temp = obj.constructor(); // give temp the original obj's constructor
    for (var key in obj) {
        temp[key] = cloneObject(obj[key]);
    }
 
    return temp;
};