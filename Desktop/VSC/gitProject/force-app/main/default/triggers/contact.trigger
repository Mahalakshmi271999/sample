trigger contact on Contact (after insert,after delete) {
	if(Trigger.isAfter){
		if(Trigger.isInsert){
        	Set<Id> accId=new Set<Id>();
        	for(Contact c:Trigger.New){
        		accId.add(c.AccountId);
        	}
        	List<Account> acclst=[Select Id,Total_number_of_contacts__c From Account
        							where Id IN :accId];
        	Map<Id,String> accmap=new Map<Id,String>();
        	for(Account aobj:acclst){
        		accmap.put(aobj.Id,aobj.Total_number_of_contacts__c);
        	}
        	List<Account> ua=new List<Account>();
        	for(Contact cobj:Trigger.New){
        
        		Account a=new Account();
        		a.Id=cobj.AccountId;
        		a.Total_number_of_contacts__c=accmap.get(cobj.AccountId);
        		if(a.Total_number_of_contacts__c==null){
        			a.Total_number_of_contacts__c='1';
        		}
        		else{
       				a.Total_number_of_contacts__c=String.valueOf(Integer.valueOf(a.Total_number_of_contacts__c)+1);
       			 }
       		 ua.add(a);
        
        }
        update ua;


		}	
 


	}
}