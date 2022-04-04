({
    doInit: function(component, event, helper) {
        // Prepare a new record from template
        component.find("2WheelerRecordCreator").getNewRecord(
            "Product__c", // sObject type (objectApiName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.objDetail");
                var error = component.get("v.errordetail");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                    return;
                }
                console.log("Record template initialized: " + rec.apiName);
            })
        );
    },
    Engine : function(component, event, helper) {
        helper.helperFun(component,event,'articleOne');
    },
    handleSaveRecord : function(component, event, helper) {
        alert('checked');
        component.find('2WheelerRecordCreator').saveRecord(function(saveResult){
            alert('saveresult-->'+saveResult);
             if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                    // record is saved successfully
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Saved",
                        "message": "The record was saved."
                    });
                    resultsToast.fire();

                } else if (saveResult.state === "INCOMPLETE") {
                    // handle the incomplete state
                    console.log("User is offline, device doesn't support drafts.");
                } else if (saveResult.state === "ERROR") {
                    // handle the error state
                    console.log('Problem saving contact, error: ' + JSON.stringify(saveResult.error));
                } else {
                    console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
                }            
        })
    },
})