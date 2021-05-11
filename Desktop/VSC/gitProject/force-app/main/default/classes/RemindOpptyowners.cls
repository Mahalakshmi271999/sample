public class RemindOpptyowners implements Schedulable {
    
    public void execute(SchedulableContext sc ) {
        
        List<Opportunity> opp = [
            SELECT ID,Name,OwnerID,CloseDate
            FROM Opportunity
            WHERE CloseDate < TODAY 
        ];
        
        delete opp;
        
    }
}