trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
        
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
        OpportunityHandler.setAmountRange(Trigger.new, Trigger.oldMap, Trigger.isInsert);
        
    if(Trigger.isAfter && Trigger.isInsert)
        OpportunityHandler.createOCR(Trigger.new);    

}