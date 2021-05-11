@RestResource(urlMapping='/myservice/*')
global class RESTAccount {
    
    @HttpGet
    global static sObject doGet(){
        RestRequest req=RestContext.request;
        ID AccountId=req.params.get('id');
        Account acc=[
            SELECT ID,Name 
            FROM Account
        	WHERE ID = :AccountId
        	LIMIT 1
        ];
        return acc;
    }

}