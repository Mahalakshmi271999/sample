public class displayAccount_Ctrl {
    
    @Auraenabled
    public static List<Account> getAccount() {
        
        List<Account> accounts = [SELECT Name,Type,Owner.Name FROM Account];
        return accounts;
    }
    
    @AuraEnabled
    public static void deleteAccount(Account a) {

        System.debug(a);
        if(a!=null)
        delete  a;
    }
}