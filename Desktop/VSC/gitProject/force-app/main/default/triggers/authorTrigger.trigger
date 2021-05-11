trigger authorTrigger on Author__c (before update) {
    
    Set<Id> aId = Trigger.newMap.keySet();
    
    Map<Id,Author__c> aMap = new Map<Id,Author__c>([Select Id,Name From Author__c Where Id = :aId]);
    
    for(Author__c a : Trigger.new){
        
        if(a.Foreign_Author__c == true && !(a.Name.contains('foreign'))){
            Author__c aobj=aMap.get(a.Id);
            a.Name = aobj.Name + ' -foreign';
           System.debug('name====' + a);
          
        }

    }

}