@isTest
private class TestOpportunityTrigger {
    
    @testsetup
    private static void createTestData() {
        
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        Contact con = new Contact(LastName = 'Test Contact',AccountId = acc.Id,IsPrimary__c = TRUE);
        insert con;
    }

    private static testmethod void testSetAmountRange() {
        
        List<ID> oppID = new List<ID>();
        List<Opportunity> oppInsert = new List<Opportunity>(); 
        
        Opportunity opp1 = new Opportunity(Name = 'Opportunity1 From Test Class',Amount = 500,StageName = 'Closed Won',CloseDate = System.Today());
        oppInsert.add(opp1);
        
        Opportunity opp2 = new Opportunity(Name = 'Opportunity2 From Test Class',Amount = 2000,StageName = 'Closed Won',CloseDate = System.Today());
        oppInsert.add(opp2);
        
        Opportunity opp3 = new Opportunity(Name = 'Opportunity3 From Test Class',Amount = 6000,StageName = 'Closed Won',CloseDate = System.Today());
        oppInsert.add(opp3);
        
        Opportunity opp4 = new Opportunity(Name = 'Opportunity4 From Test Class',Amount = 12000,StageName = 'Closed Won',CloseDate = System.Today());
        oppInsert.add(opp4);
        
        insert oppInsert;
        
        oppID.add(opp1.Id);
        oppID.add(opp2.Id);
        oppID.add(opp3.Id);
        oppID.add(opp4.Id);
        
        List<Opportunity> oppList = [
            SELECT Id , Amount_Range__c , Amount
            FROM Opportunity
            WHERE Id = :oppID
        ];
        
        for(Opportunity oppobj : oppList) {
            
            if(oppobj.Amount < 1000)
                System.assertEquals('Low', oppList[0].Amount_Range__c);
            else if(oppobj.Amount >= 1000 && oppobj.Amount < 5000)
                System.assertEquals('Medium', oppList[1].Amount_Range__c);
            else if(oppobj.Amount >= 5000 && oppobj.Amount < 10000)
                System.assertEquals('High', oppList[2].Amount_Range__c);
            else if(oppobj.Amount >= 10000)
                System.assertEquals('Very High', oppList[3].Amount_Range__c);
        }
    } 
    
    private static testmethod  void testcreateOCR() {
        
        List<Opportunity> oppInsertList = new list<Opportunity>();
        
        List<Account> accList = [SELECT Id FROM Account];
        
        Opportunity opp = new Opportunity(Name = 'Test1 Opp',StageName = 'Closed Won',CloseDate = System.today(),AccountId = accList[0].Id);
        oppInsertList.add(opp);
        
        Opportunity oppy = new Opportunity(Name = 'Test2 Opp',StageName = 'Closed Won',CloseDate = System.today(),AccountId = accList[0].Id);
        oppInsertList.add(oppy);
        
        insert oppInsertList;
        
        List<OpportunityContactRole> OCR =[SELECT Id FROM OpportunityContactRole];
        System.assertEquals(2, OCR.size());
        System.assert(OCR.size() == 2);
    }
}