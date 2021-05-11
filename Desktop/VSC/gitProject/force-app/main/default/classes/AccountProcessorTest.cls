@isTest
private class AccountProcessorTest {
    
    @isTest static void docountContacts() {
        
        List<ID> accountID = new List<ID>();
        Account a = new Account(Name = 'TEST ACCOUNT');
        insert a;
        accountID.add(a.Id);
        Test.startTest();
        AccountProcessor.countContacts(accountID);
        Test.stopTest();
    }

}