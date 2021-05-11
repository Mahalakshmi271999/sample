({
	doInit : function(component, event, helper) {
        
        var action = component.get("c.getAccount");
        action.setCallback(this,function(response){
            
            var state = response.getState();
            if(state === "SUCCESS")
                var acclists = response.getReturnValue();
            if(acclists != null)
                component.set("v.accountLists",acclists);
                
        });
        $A.enqueueAction(action);
	},
    
    handleDeleteEvent : function(component , event) {
        
        var accobj = event.getParam("accounteve");
        var action1 = component.get("c.deleteAccount");
        action1.setParams({
            "a" : accobj
        });
        var action2 = component.get("c.getAccount");
        action2.setCallback(this,function(response){
            
            var state = response.getState();
            if(state === "SUCCESS")
                var acclists = response.getReturnValue();
            if(acclists != null)
                component.set("v.accountLists",acclists);
                
        });
        
        
         $A.enqueueAction(action1);
        $A.enqueueAction(action2);
    }
    
})