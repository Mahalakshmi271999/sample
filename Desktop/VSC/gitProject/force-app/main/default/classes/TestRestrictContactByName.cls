@isTest
private class TestRestrictContactByName {
    
    private static testmethod void testLastName() {
        
        Contact c1 = new Contact();
        c1.LastName = 'INVALIDNAME';
        Database.SaveResult result = Database.insert (c1,false);
        System.assertEquals('The Last Name "'+c1.LastName+'" is not allowed for DML', result.getErrors()[0].getMessage());
    }
}