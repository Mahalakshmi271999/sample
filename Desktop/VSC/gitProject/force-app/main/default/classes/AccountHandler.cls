public class AccountHandler {
    public static Account insertNewAccount(String aname){
        
        
        Account a=new Account(Name=aname);
        if(a.Name==''){
            return null;
        }
        
        insert a;
        System.debug(a);
        return a;
        
    }

}