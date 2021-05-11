public class OpportunityHandler {
    
     public static void setAmountRange(List<Opportunity> newList, Map<Id, Opportunity> oldMap, Boolean isInsert) {
        
        for(Opportunity opp :newList) {
            if(isInsert || oldMap.get(opp.Id).Amount != opp.Amount) {
                if(opp.Amount != NULL) {
                    if(opp.Amount < 1000) {
                        opp.Amount_Range__c = 'Low';
                    } else if (opp.Amount >=1000 && opp.Amount < 5000) {
                        opp.Amount_Range__c = 'Medium';
                    } else if (opp.Amount >=5000 && opp.Amount < 10000) {
                        opp.Amount_Range__c = 'High';
                    } else if (opp.Amount >=10000) {
                        opp.Amount_Range__c = 'Very High';
                    }
                }
            }
        }
    
    }
    
    public static void createOCR(List<Opportunity> newList) {
        
        Set<Id> acctIdSet = new Set<Id>();
        Map<Id,Id> acctIdPrimaryCntIdMap = new Map<Id,Id>();
        List<OpportunityContactRole> ocrInsertList = new List<OpportunityContactRole>();
        
        //Get all Accounts under the Opps
        for(Opportunity opp :newList) {
            acctIdSet.add(opp.AccountId);
        }
        
        //populate the primary contact Id for each of the Account
        for(Contact ct: [Select Id, AccountId From Contact Where AccountId IN :acctIdSet AND IsPrimary__c = TRUE]) {
            acctIdPrimaryCntIdMap.put(ct.AccountId, ct.Id);
        }
        
        for(Opportunity opp :newList) {
            if(acctIdPrimaryCntIdMap.containsKey(opp.AccountId)) {
                OpportunityContactRole ocr = new OpportunityContactRole();
                ocr.OpportunityId = opp.Id;
                ocr.ContactId = acctIdPrimaryCntIdMap.get(opp.AccountId);
                ocr.IsPrimary = TRUE;
                ocrInsertList.add(ocr);
             }
        }
        
        if(ocrInsertList.size() > 0) {
            insert ocrInsertList;
        }
    }
}