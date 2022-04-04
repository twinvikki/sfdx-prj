({
	SubmitCase : function(component, event, helper) {
        // call the apex class method and pass fieldApi name and object type 
        var objDetails = component.get("v.objDetail");
        alert('objDetails-->'+objDetails);
        var action = component.get("c.casesubmissionmethod");
        action.setParams({
            "objObject": objDetails
        });
        action.setCallback(this, function(response) {
            alert('response-->'+response.getState());
            console.log('response-->'+response.getState());
            if (response.getState() === "SUCCESS") {
                alert('sucess');
                }

        });
        $A.enqueueAction(action);
    },		

})