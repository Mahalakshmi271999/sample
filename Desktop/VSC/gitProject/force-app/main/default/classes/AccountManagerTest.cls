@isTest(SeeAllData=true)
private class AccountManagerTest {
    
    @isTest static void dogetAccount() {
        
        Id accID = createTestAccount();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+accID+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account result = AccountManager.getAccount();
        
    }
    
    static Id createTestAccount() {
        
        Account acc = new Account(Name='Test Account');
        insert acc;
        return acc.Id;
        
    }

}