public class BookHandler {
    
    public static void validateDelete(List<Book__c> deletedbooks){
        Set<ID> ids_Of_Oldmap = Trigger.OldMap.KeySet();
            
            Map<Id,Book__c> booksMap = new Map<Id,Book__c>([Select Id ,(Select Id From Students__r LIMIT 1) 
                                                            From Book__c Where Id IN :ids_Of_Oldmap ]);
            
            for(Book__c bobj : deletedbooks){
                
                if(booksMap.get(bobj.Id).Students__r.size() > 0){
                    
                    bobj.addError('This Book cannot be deleted as it has child');
                }
            }
    }

}