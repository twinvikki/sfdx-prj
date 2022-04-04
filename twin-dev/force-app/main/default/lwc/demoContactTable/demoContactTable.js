import { LightningElement,track,wire } from 'lwc';
import fetchContactMethod from '@salesforce/apex/demoContactTableController.methodName';
const columns = [
    { label: 'Name',
    fieldName: 'Name',
    type: 'text',
    sortable: true},
    {label: 'Email',
    fieldName: 'Email',
    type: 'email',
    sortable: true}

]
export default class DemoContactTable extends LightningElement {
    dataColummns = columns;
    @track rowData = [];
    @wire(fetchContactMethod)
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            console.log('data-->'+JSON.stringify(data));
            this.rowData = data;
        } else if (error) {
            console.log('error-->'+JSON.stringify(error));
            this.error = error;
        }
    }

}