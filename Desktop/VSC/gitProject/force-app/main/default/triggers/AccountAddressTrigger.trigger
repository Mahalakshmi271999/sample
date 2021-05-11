trigger AccountAddressTrigger on Account (before insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            
            for(Account a:Trigger.New){
                if(a.BillingPostalCode!=null && a.Match_Billing_Address__c==true){
                    a.ShippingPostalCode=a.BillingPostalCode;
                }
            }
            
           
        }
    }
}