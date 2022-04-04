({
    cloneOppAndGetLineItems: function (component, fields){
        // call the apex class method and pass fieldApi name and object type 
        var action = component.get("c.CloneRecordAndChildRecords");
        action.setParams({
            "objObject": objDetails,
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