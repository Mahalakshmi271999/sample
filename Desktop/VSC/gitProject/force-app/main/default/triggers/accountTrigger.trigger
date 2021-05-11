trigger accountTrigger on Account (before insert,before update,before delete,after insert) {
    
    if(Trigger.isBefore) {
        
        if(Trigger.isInsert) {
            
            Set<String> accountName = new Set<String>();
            Set<String> dupAccName = new Set<String>();
            for(Account account : Trigger.New) {
                
                if(accountName.contains(account.Name))
                    dupAccName.add(account.Name);
                
                else
                    accountName.add(account.Name);
            }
            
            List<Account> accounts = [SELECT ID,Name FROM Account WHERE Name IN :accountName];
            Map<String,Account> accMap = new Map<String,Account>();
            for(Account a : accounts) {
                
                accMap.put(a.Name,a);
            }
            
            for(Account acc :Trigger.New) {
                
                if(accMap.containsKey(acc.Name) || dupAccName.contains(acc.Name)){
                    
                    acc.addError('Account Name should be unique');
                }
            }
        }
        
        if(Trigger.isUpdate) {
            
            Set<String> accountName = new Set<String>();
            Set<String> dupAccName = new Set<String>();
            for(Account account : Trigger.New) {
                
                if(accountName.contains(account.Name))
                    dupAccName.add(account.Name);
                
                else
                    accountName.add(account.Name);
            }
            
            List<Account> accounts = [SELECT ID,Name FROM Account WHERE Name IN :accountName];
            Map<String,Account> accMap = new Map<String,Account>();
            for(Account a : accounts) {
                
                accMap.put(a.Name,a);
            }
            
            for(Account acc :Trigger.New) {
                
                Account a = Trigger.OldMap.get(acc.Id);
                
                if((accMap.containsKey(acc.Name) || dupAccName.contains(acc.Name)) && (a.Name <> acc.Name)){
                    
                    acc.addError('Account Name should be unique');
                }
            }
        }
        
        if(Trigger.isDelete) {
        
            Set<ID> accountId = Trigger.OldMap.keySet();
            Map<ID,Opportunity> accmap = new Map<ID,Opportunity>();
            
            List<Opportunity> opportunities = [SELECT Id,AccountId FROM Opportunity WHERE AccountId IN :accountId];
            for(Opportunity opp : opportunities) {
                
                accmap.put(opp.AccountId,opp);
            }
            
            for(Account acc : Trigger.Old) {
                
                if(accmap.containsKey(acc.Id)){
                    acc.addError('Account has Opportunity');
                }
            }
        }
    }
    
    if(Trigger.isAfter) {
        
        if(Trigger.isInsert) {
            
            List<Opportunity> oppList = new List<Opportunity>();
            
            for(Account accObj : Trigger.New) {
                
                Opportunity opportunity = new Opportunity();
                opportunity.Name = 'Opportunity from Apex-' +accObj.Name;
                opportunity.CloseDate = System.today() + 5;
                opportunity.StageName = 'Prospecting';
                opportunity.AccountId = accObj.Id;
                oppList.add(opportunity);
            }
            
            if(oppList.size() > 0) {
                
                insert oppList;
            }
        }
    }
}