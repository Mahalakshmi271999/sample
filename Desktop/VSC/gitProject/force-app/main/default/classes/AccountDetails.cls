public class AccountDetails {
    
    @AuraEnabled
    public static List<Account> getAccountDetails() {
        
        return [SELECT Id,Name,Phone,LWC_Date__c FROM Account WHERE LWC_Date__c != null LIMIT 5];
    }
    
    @AuraEnabled
    public static void updateAccountDetails(Id accId,String accName,Date accDate) {
        
        Account aobj = new Account();
        aobj.Id = accId;
        aobj.Name = accName;
        aobj.LWC_Date__c = accDate;
        update aobj;
        System.debug(aobj);
        
    }

}