public class Account_Ctrl {
    
    @AuraEnabled
    public static Account createAccount(Account acc) {
        insert acc;
        return acc;
    }
    
}