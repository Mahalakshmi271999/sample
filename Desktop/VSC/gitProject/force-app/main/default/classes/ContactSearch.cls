public class ContactSearch {
    
    public static List<Contact> searchForContacts(String a,String b){
         
        List<Contact> clist=[Select Name,MailingAddress From Contact
                             Where LastName = :a AND MailingPostalCode = :b];
        for(Contact c:clist){
            System.debug(c.Id);
            System.debug(c.Name);
        }
        System.debug(clist);
        return clist;
        
    }

}