import { LightningElement } from 'lwc';

export default class Add2numbers extends LightningElement {

    firstnumvalue = 0;
    secondnumvalue = 0;
    addvalue = 0;

    addnumbers1(event) {
       this.firstnumvalue = event.target.value;
       this.addvalue = parseInt(this.firstnumvalue) + parseInt(this.secondnumvalue);
    }
    addnumbers2(event) {
        this.secondnumvalue = event.target.value;
        this.addvalue = parseInt(this.firstnumvalue) + parseInt(this.secondnumvalue);  
    }
}