({
	doInit : function(component, event, helper) {
		var action = component.get("c.getContacts");
        var accID = component.get("v.recordId");
        action.setParams({
            recordId :  accID
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS')
            {
                var contactList = response.getReturnValue();
                component.set("v.contactList",contactList);
            }
            else
            {
                alert('Error in getting Data');
            }
        });
        $A.enqueueAction(action);
	}
})