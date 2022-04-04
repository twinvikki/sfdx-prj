import { LightningElement,track,wire,api} from 'lwc';
import fetchCustomerDetails from '@salesforce/apex/CustomerSearchLWCController.fetchCustomerDetails';
export default class CustomerDisplayScreen extends LightningElement {
    @api recordId;
    @track wiredsObjectData;
    ContactData;
    @track customerName = 'Sample Name';
    @track contactId;
    @wire(fetchCustomerDetails,{accountId:'$recordId'})
    wiredSobjects(result){        
        if(result.data)
        { 
            console.log('dataJson'+result.data.lWrapperContact);
            this.ContactData = result.data.lWrapperContact;
            console.log('name:-->'+this.ContactData.Name);
            this.wiredsObjectData = result.data;
            this.customerName = this.wiredsObjectData.lWrapperContact.Name;
            console.log('Check Contact:'+this.wiredsObjectData.lWrapperContact.Name);
        }
    }
    get customerName(){
        console.log('this.contactData-->'+this.ContactData);
        //return this.wiredSobjects.result.data.lWrapperContact.Name;
    }
 
}