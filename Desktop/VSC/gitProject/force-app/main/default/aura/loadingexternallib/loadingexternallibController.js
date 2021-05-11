({
	doSubmit : function(component) {
        
        var cmpMsg = component.find("msg");
    	$A.util.removeClass(cmpMsg, 'hide');
        
        var val = component.find("dateTimeField").get("v.value");
        var tzval = moment(val).format("YYYY-MM-DD HH:mm");
        var oVal = component.find("oDateTime");
        var aN = moment.tz(tzval, "America/New_York");
		oVal.set("v.value",aN);    
    },
    
})