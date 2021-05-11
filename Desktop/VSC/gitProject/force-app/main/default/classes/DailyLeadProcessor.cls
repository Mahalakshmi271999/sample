public class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext sc) {
        
        List<Lead> leads = [
            SELECT ID,LeadSource
            FROM Lead
            WHERE LeadSource =''
            LIMIT 200
        ];
        for(Lead obj : leads) {
            obj.LeadSource ='Dreamforce';
        }
        update leads;
    }

}