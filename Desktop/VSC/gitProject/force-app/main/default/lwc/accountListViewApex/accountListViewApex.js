import { LightningElement,track } from 'lwc';
import accountDetails from '@salesforce/apex/AccountDetails.getAccountDetails';
import momentStaticResource from '@salesforce/resourceUrl/momentDateTime';
import { loadScript } from 'lightning/platformResourceLoader';
import updateAccount from '@salesforce/apex/AccountDetails.updateAccountDetails';

export default class AccountListViewApex extends LightningElement {
    
    showButton = true;
    showTable = false;
    showChild = false;
    @track showModal=false;
    @track eventAcc = {};
    @track accountLists = [];
    @track acc={};

    connectedCallback() {

                this.doInit();      
                
    }

    doInit() {
        accountDetails()
        .then(result =>{
            this.accountLists = result;
            console.log(this.accountLists.length);
            for(let i = 0;i<this.accountLists.length;i++){
                this.acc = this.accountLists[i];
                let dateFormat = moment(this.acc.LWC_Date__c).format('DD/MM/YYYY');
                this.acc.LWC_Date__c = dateFormat;
                console.log(dateFormat);
            }
        })
        .catch(error =>{
            console.log('Error');
        });
    }
    
    handleClick() {

        this.showButton = false;
        this.showTable = true;
	    this.showChild = true;
        console.log('load accounts');
    }

    handleClose() {
        this.showModal = false;
    }

    handleNameChange(event) {
        this.eventAcc.Name=event.target.value;
    }

    handleUpdate() {

        updateAccount({accId:this.eventAcc.Id,accName:this.eventAcc.Name,accDate:this.eventAcc.LWC_Date__c})
        
         this.showModal=false;

    }

    editAction(event){
        this.showModal = true;
        this.eventAcc.Id=event.detail.eventId;
        this.eventAcc.Name=event.detail.eventName;
        
        this.eventAcc.LWC_Date__c=event.detail.eventDate;
        
        console.log('event parent');

    }
    
}