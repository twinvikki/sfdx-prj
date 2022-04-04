import { LightningElement, track } from 'lwc';

export default class CustomDatatableDemo extends LightningElement {

    @track data = [];
    //have this attribute to track data changed
    //with custom picklist or custom lookup
    @track draftValues = [];

    lastSavedData = [];

    connectedCallback() {
        this.columns = [
            { label: 'Name', fieldName: 'Name', editable: true },
            { label: 'Account Number', fieldName: 'AccountNumber', editable: true },
            { label: 'Phone', fieldName: 'phone', type: 'phone', editable: true },
            { label: 'Date', fieldName: 'last_checkedinfo__c', type: 'date', editable: true,typeAttributes: {
                placeholder: 'Enter Date',
                value: { fieldName: 'last_checkedinfo__c' } // default value for picklist
                , context: { fieldName: 'Id' } 
        }},
            {
                label: 'Rating', fieldName: 'Rating', type: 'picklist', typeAttributes: {
                    placeholder: 'Choose rating', options: [
                        { label: 'Hot', value: 'Hot' },
                        { label: 'Warm', value: 'Warm' },
                        { label: 'Cold', value: 'Cold' },
                    ] // list of all picklist options
                    , value: { fieldName: 'Rating' } // default value for picklist
                    , context: { fieldName: 'Id' } // binding account Id with context variable to be returned back
                }
            },
 
        ];

        //sample data
        this.data = [{ 'Id': '0017F00002UkPFe', 'Name': 'Acme', 'AccountNumber': '12344','last_checkedinfo__c':'2020-05-18' ,'Rating': 'Hot', phone: 12537 }]
        //save last saved copy
        this.lastSavedData = JSON.parse(JSON.stringify(this.data));
    }

    updateDataValues(updateItem) {
        let copyData = [... this.data];
        copyData.forEach(item => {
            if (item.Id === updateItem.Id) {
                for (let field in updateItem) {
                    item[field] = updateItem[field];
                }
            }
        });

        //write changes back to original data
        this.data = [...copyData];
    }

    updateDraftValues(updateItem) {
        let draftValueChanged = false;
        let copyDraftValues = [...this.draftValues];
        //store changed value to do operations
        //on save. This will enable inline editing &
        //show standard cancel & save button
        copyDraftValues.forEach(item => {
            if (item.Id === updateItem.Id) {
                for (let field in updateItem) {
                    item[field] = updateItem[field];
                }
                draftValueChanged = true;
            }
        });

        if (draftValueChanged) {
            this.draftValues = [...copyDraftValues];
        } else {
            this.draftValues = [...copyDraftValues, updateItem];
        }
    }

    //listener handler to get the context and data
    //updates datatable
    picklistChanged(event) {
        event.stopPropagation();
        let dataRecieved = event.detail.data;
        let updatedItem = { Id: dataRecieved.context, Rating: dataRecieved.value };
        this.updateDraftValues(updatedItem);
        this.updateDataValues(updatedItem);
    }

    //handler to handle cell changes & update values in draft values
    handleCellChange(event) {
        this.updateDraftValues(event.detail.draftValues[0]);
    }

    handleSave(event) {
        console.log('Updated items', this.draftValues);
        //save last saved copy
        this.lastSavedData = JSON.parse(JSON.stringify(this.data));
    }

    handleCancel(event) {
        //remove draftValues & revert data changes
        this.data = JSON.parse(JSON.stringify(this.lastSavedData));
        this.draftValues = [];
    }
}