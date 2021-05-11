@isTest
private class LeadProcessorTest {
    
    @isTest static void doUpdate() {
        
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 0; i < 200 ; i++) {
            leadList.add(new Lead(LastName ='Test Lead'+i,Company='SS'));
        }
        insert leadList;
        Test.startTest();
        LeadProcessor obj = new LeadProcessor();
        Id batchId = Database.executeBatch(obj);
        Test.stopTest();
    }
}