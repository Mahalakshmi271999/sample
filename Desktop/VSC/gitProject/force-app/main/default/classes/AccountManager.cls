@RestResource(urlMapping='/accounts/*/contacts')
global class AccountManager {
    
    @HttpGet
    global static Account getAccount(){
        
        RestRequest request = RestContext.request;
        //String accId = request.requestURI.substring(request.requestURI.lastIndexOf('/')-18,
          //request.requestURI.lastIndexOf('/'));
        String accId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [
            SELECT ID,Name,(SELECT Name FROM Contacts)
            FROM Account
            WHERE ID = :accId
        ];
        List<Contact> contact = [
            SELECT Id,Name 
            FROM Contact
            WHERE Id = :accId
        ];
        return acc;
        
    }

}