public class AddPrimaryContact implements Queueable {
    
    public Contact con;
    public String str;
    public AddPrimaryContact(Contact con , String str) {
        
        this.con = con;
        this.str = str;
    }
    
    public void execute(QueueableContext qp) {
        
        List<Account> accountLists = [
            SELECT Id,Name,BillingState
            FROM Account
            WHERE BillingState = :this.str
            LIMIT 200
        ];
        System.debug(accountLists);
        List<Contact> contactLists = new List<Contact>();
        for(Account a : accountLists) {
            
            Contact con = new Contact();
            con = this.con.clone(false,false,false,false);
            con.AccountId = a.Id;
            contactLists.add(con);
            System.debug(con);
        }
        insert contactLists;
    }
}