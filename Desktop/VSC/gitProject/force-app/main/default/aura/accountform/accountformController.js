({
    doSave:function(component){
        
        var action = component.get("c.createAccount");
        action.setParams({
            acc :component.get("v.account"),
        });
        $A.enqueueAction(action);
    },
    
    doName:function(component) {
        
        var name = component.get("v.account.Name");
        if(name == '')
            component.set("v.saveBtn",true);
        else
            component.set("v.saveBtn",false);
    },
    
    doNumber:function(component) {
        
        var no = component.get("v.account.accno__c");
        if(no == null)
            component.set("v.saveBtn",true);
        else
            component.set("v.saveBtn",false);
    }
})