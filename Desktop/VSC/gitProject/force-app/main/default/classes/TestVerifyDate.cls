@isTest
private class TestVerifyDate {
    
    private static testmethod void testCheckDates() {
        
        Date d1 = Date.newInstance(2021, 01, 09);
        Date d2 = Date.newInstance(2021, 01, 20);
        Date d = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d2, d);
        
        Date d3 = Date.newInstance(2021, 01, 09);
        Date d4 = Date.newInstance(2021, 03, 09);
        Date dt = VerifyDate.CheckDates(d3, d4);
        System.assertEquals(Date.newInstance(2021, 01, 31), dt);
    }

}