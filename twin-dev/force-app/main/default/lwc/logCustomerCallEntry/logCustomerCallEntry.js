import { LightningElement,api,track,wire } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import fetchCustomerLogAccount from '@salesforce/apex/LogCustomerCallEntryController.fetchCustomerLogAccount';
const FIELDS = ['Customer_Account__c.Name'];
export default class LWCModalBoxDemo extends LightningElement {
    @api recordId;
    @track CustomerAccount;
    @track error;
    @track CustName;
    @track statusValue;
    @track disableFields = false; 
    @track openmodel = false;
    @track submitInteraction = true;
    @wire(getRecord,{
        recordId: '$recordId', fields: FIELDS
    })wiredRecord({error,data})
    {
        if(error){
            let message = 'Unknown error';
            if(Array.isArray(error.body))
            {
                message = error.body.map(e=> e.message).join(', ');
            }
            else if(typeof error.body.message === 'string')
            {
                message = error.body.message;
            }
            this.dispatchEvent(
                  new ShowToastEvent({
                      title: 'Error loading Customer Details',
                      message,
                      variant: 'error',
                  }),
            );
        }
        else if(data)
        {
            this.CustomerAccount= data;
            this.CustName = this.CustomerAccount.fields.Name.value;
            this.statusValue = 'In Progress';
            this.disableFields = true;
            console.log('recordId-->'+this.CustName);
            fetchCustomerLogAccount({accountid : this.recordId,
                accName : this.CustName})
                .then(result=>{
                    if(result == null){
                       console.log('No log data found');
                       this.submitInteraction = true;
                    }
                    else{
                        console.log('view customer'+result);
                        this.submitInteraction = false;
                    }
                })
                .catch(error=>{
                    this.error = error;
                });           
            console.log('record--->'+ this.CustomerAccount);
        }
    };
    connectedCallback(){
        this.openmodel = true;
    }
    openmodal() {
        this.openmodel = true;
    }
    closeModal() {
        this.openmodel = false;
    } 
    saveMethod() {
        alert('save method invoked');
        this.closeModal();
    }
    handleSubmit(event) { 
        console.log('onsuccess event recordEditForm',event.detail.id);
        this.openmodel = false;
    }
}