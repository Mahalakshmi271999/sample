public class AccountProcessor {

    @future
    public static void countContacts( List< ID > recordId ) {
        
        List< Account > lst_of_contacts = [
            SELECT ID , Number_of_Contacts__c ,(SELECT ID FROM Contacts)
            FROM Account
            WHERE ID = :recordId
        ];
        //Map< ID , Integer > contactCount = new Map< ID , Integer >();
        for( Account a : lst_of_contacts ) {
            
            //contactCount.put(a.ID , a.Contacts.size());
            a.Number_of_Contacts__c = a.Contacts.size();
        }
        
        update lst_of_contacts;
        
    }
}