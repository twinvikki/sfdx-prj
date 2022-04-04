({
	save : function(component, event, helper) {
		console.log('save');
        var objDetails = component.get("v.objDetail");
        helper.InsertRecord(component,objDetails);
	}
})