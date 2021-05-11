@isTest
private class AddPrimaryContactTest {
    
    @isTest static void doAddPrimaryContact() {
        
        List<Account> accounts = new List<Account>();
        for(Integer i = 1; i <= 50; i++) {
            
            Account a = new Account(Name = 'TEST ACCOUNT'+i,BillingState = 'NY');
            accounts.add(a);
        }
        
        for(Integer i = 51 ; i<= 100 ; i++) {
            
            Account a = new Account(Name = 'TEST ACCOUNT'+i,BillingState = 'CA');
            accounts.add(a);
        }
        insert accounts;
        Test.startTest();
        Contact c = new Contact(LastName = 'TEST CONTACT');
        AddPrimaryContact obj = new AddPrimaryContact(c,'CA');
        System.enqueueJob(obj);
        Test.stopTest();
    }

}