({
    fetchPickListVal : function(component, objDetails,APIFeildName,fetchrecid) {
        // call the apex class method and pass fieldApi name and object type 
        var objDetails = component.get("v.objDetail"); 
        var action = component.get("c.FetchOpportunityDetails");
        action.setParams({
            "objObject": objDetails,
            "fld": APIFeildName,
            "recid": fetchrecid
        });
        action.setCallback(this, function(response) {
            alert('response-->'+response.getState());
            console.log('response-->'+response.getState());
            if (response.getState() === "SUCCESS") {
                var allValues = response.getReturnValue();
                var opts = [];
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        label: allValues[i],
                        value: allValues[i]
                    });
                     
                }
                    component.set("v.StagePickName", opts);                     
                }

        });
        $A.enqueueAction(action);
    }
})