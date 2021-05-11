public class ExceptionAdd {
    
    @InvocableMethod
    public static void ErrorMsg(List<ID> accID) {
        
        List<Account> accLst = [SELECT ID FROM Account WHERE ID IN :accID];
        for(Account acc : accLst) {
            
            acc.addError('Cant delete the account');
        }
    }

}