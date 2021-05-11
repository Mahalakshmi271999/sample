trigger studentTrigger on Student__c(before update){
    
    Set<String> names=new Set<String>();
    for(Student__c s:Trigger.New){
        names.add(s.Name);
    }
    
    System.debug(names);
    
    Map<Id,List<Student__c>> stumap = new Map<Id,List<Student__c>>();
    List<Student__c> stulist=[Select Name From Student__c Where Name IN :names];
    
    for(Student__c s:Trigger.New){
        if(stumap.get(s.Id).size()>0){
            s.addError('No ');
        }
    }
    
    
    
    
    
}