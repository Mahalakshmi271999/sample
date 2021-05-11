public class MyBatchClass implements Database.Batchable<sObject> {
    
    public static Database.QueryLocator start(Database.BatchableContext bc) {
        
        String query = 'SELECT COUNT(ID),AccountId FROM Contact GROUP BY  AccountId' ;
        return Database.getQueryLocator(query);
    }
    
    public static void execute(Database.BatchableContext bc,List<AggregateResult> acclist) {
        
        for(AggregateResult ar : acclist){
           
            System.debug(ar.get('expr0'));
        }

    }
    
    public static void finish(Database.BatchableContext bc) {
        System.debug('Batch finished');
    }

}