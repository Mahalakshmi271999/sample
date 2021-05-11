public class ContactCountReconsins_Batch implements Database.Batchable <SObject>{

Public static Database.QueryLocator start(Database.BatchableContext bc){
system.debug('Started');
return Database.getQueryLocator('SELECT ID FROM Account');
}
public static void execute(Database.BatchableContext bc,List<Account> accounts){

for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount
FROM Contact
GROUP BY AccountId]){
	System.debug('Execute = ' + ar.get('ContactCount'));
}

}
public static void finish(Database.BatchableContext bc){
system.debug('Finish');
}
}