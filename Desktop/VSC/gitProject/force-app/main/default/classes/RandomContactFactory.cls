public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer num,String str) {
        
        List<Contact> conList = new List<Contact>();
        
        for(Integer i = 0;i < num;i++) {
            Contact con = new Contact();
            con.FirstName = 'Test' + '' + i;
            con.LastName = str;
            conList.add(con);
        }
        return conList;
    }
}