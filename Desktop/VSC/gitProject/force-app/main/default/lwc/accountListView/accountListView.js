import { LightningElement } from 'lwc';

export default class AccountListView extends LightningElement {
    
    accountLists =[
        
        {
        name : 'Account1',
        status : 'Active',
        accountnumber : 1
        },
        {
        name : 'Account2',
        status : 'Active',
        accountnumber : 2
        },
        {
        name : 'Account3',
        status : 'Active',
        accountnumber : 3
        }
    ];

    showButton = true;
    showTable = false;
    showChild = false;

    handleClick() {
        this.showButton = false;
        this.showTable = true;
        this.showChild = true;
    }
    
}