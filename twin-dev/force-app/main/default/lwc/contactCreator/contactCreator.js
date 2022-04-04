import { LightningElement,api,wire } from 'lwc';
import { createContact } from 'lightning/uiRecordApi';
import CONTACT from '@salesforce/schema/Contact';
import FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import LASTNAME from '@salesforce/schema/Contact.LastName';
import EMAIL from '@salesforce/schema/Contact.Email';
import ShowToastEvent from 'lightning/platformShowToastEvent';

export default class ContactCreator extends LightningElement {
    objectApiName = CONTACT;
    fields = [FIRSTNAME,LASTNAME,EMAIL];
    handleSuccess(event)
    { 
        const evt = new ShowToastEvent({
            title: "Contact created",
            message: "Record ID: " + event.detail.id,
            variant: "success"

        });
        this.dispatchEvent(evt);
    }
}