({
	doDelete : function(component, event) {
        
        var cmpEvent = component.getEvent("deleteAccount");
        cmpEvent.setParams({"accounteve":component.get("v.account")});
        cmpEvent.fire();
	}
})