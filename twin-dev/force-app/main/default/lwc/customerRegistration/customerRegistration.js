import { LightningElement,track,wire } from 'lwc';

export default class CustomerRegistration extends LightningElement {
    @track customerName;
    @track customerEmail;

    registerCust(event){
        var inp = this.template.querySelectorAll("lightning-input");
        inp.forEach(function(element){
             if(element.name == "CustomerName")
             this.customerName = element.value;
             else if(element.name == "CustomerEmail")
             this.customerEmail = element.value;
        },this);
    }


}