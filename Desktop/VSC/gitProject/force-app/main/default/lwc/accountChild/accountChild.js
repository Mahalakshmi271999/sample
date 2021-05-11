import { LightningElement,api,track } from 'lwc';

export default class AccountChild extends LightningElement {
    @api acc;

    
    handleEvent(){
        let accId = this.acc.Id;
        let accName = this.acc.Name;
    
        let accDate = this.acc.LWC_Date__c;

        const selectedEvent = new CustomEvent('editevent',{
            detail:{eventId:accId,eventName:accName,eventDate:accDate}
        });
        this.dispatchEvent(selectedEvent);
        console.log('child event');
    }
    
}