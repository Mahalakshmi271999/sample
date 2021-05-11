public class LeadProcessor implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {

		return Database.getQueryLocator('SELECT ID,LeadSource FROM Lead');      
    } 
    
    public void execute(Database.BatchableContext bc , List<Lead> lst) {
        
        for(Lead obj : lst) {
            obj.LeadSource = 'Dreamforce';
        }
        update lst;
	}
    
    public void finish(Database.BatchableContext bc) {
        
    }

}