public Class Maha1{
    //get allbooks
    public static void getAllBooks(){
        List<Book__c> bookList=[Select Name From Book__c];
        for(Book__c b:bookList){
             System.debug(b);
        }
    }
    
    //get Books By Name
    public List<Book__c> getByName(){
        List<Book__c> b= [Select Id,Name From Book__c Where Name='SPM'];
        System.debug(b);
        return b;
    }
    
    //Return DeveloperName and Id in Map(Method argument as Set and String)
    public Map<String,Id> getrtnameid(Set<String> rtnames,String objname){
        List<RecordType> rt=[Select Id,Name,DeveloperName,SObjectType 
                    From RecordType where DeveloperName IN :rtnames AND SObjectType= :objname];
         Map<String,Id> m=new Map<String,Id>();
        for(RecordType r:rt){
            m.put(r.DeveloperName,r.Id);
            System.debug(m);
        }
        return m;
    }
    
    public Map<string,Integer> getBooksCountByAuthor(){
        //get all author
        List<Book_author__c> balist=[Select Author__r.Name From Book_author__c];
        Map<String,Integer> bc=new Map<String,Integer>();
        for(Book_author__c b:balist){
            if(bc.containsKey(b.Author__r.Name)){
                Integer count=bc.get(b.Author__r.Name);
                count++;
                bc.put(b.Author__r.Name,count);
            }
            else{
                bc.put(b.Author__r.Name,1);
            }
        }
        System.debug(bc);
        return bc;   
    }
}