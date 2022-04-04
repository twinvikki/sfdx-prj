({
    cloneOpportunity : function(component, event, helper) {
        //event.preventDefault(); 
        var fields = event.getParam("fields");
        fields["Id"] = component.get("v.recordId");
        console.log(JSON.stringify(fields))
        
       helper.cloneOppAndGetLineItems(component, fields);
    }
})