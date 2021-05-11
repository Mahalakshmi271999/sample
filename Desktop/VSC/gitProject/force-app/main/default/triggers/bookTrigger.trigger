trigger bookTrigger on Book__c(before delete){
    
    if(Trigger.isDelete){
        
        if(Trigger.isBefore){
            
            BookHandler.validateDelete(Trigger.Old);
        }
    }
}


/*
trigger bookTrigger on Book__c(before delete){
    
    Set<Id> dId = new Set<Id>();
    for(Book__c b : Trigger.Old){
        dId.add(b.Id);
    }
    
    List<Book_Author__c> blist = [Select Id ,Book__c From Book_Author__c
                                  Where Book__c IN :dId];
    
    for(Book__c trig : Trigger.Old){
        if(blist.size() <> 0){
            trig.addError('This Book cannot be deleted as it has child');
        }
    }
}*/